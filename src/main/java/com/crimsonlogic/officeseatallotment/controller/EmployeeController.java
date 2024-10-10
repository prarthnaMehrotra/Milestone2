package com.crimsonlogic.officeseatallotment.controller;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.service.EmployeeService;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	private static final Logger LOG = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	// Displays the home page
	@GetMapping("/home")
	public String homePage(Model model) {
		LOG.debug("Displaying home page");
		return "home";
	}

	// Displays the login form
	@GetMapping("/login")
	public String loginForm(Model model) {
		// Add an empty employee object for form binding
		model.addAttribute("employee", new Employee());
		return "login";
	}

	// Handles login validation
	@PostMapping("/validate")
	public String validateLogin(@ModelAttribute("employee") Employee employee, Model model, HttpSession session) {
		// Authenticate employee credentials using the service
		Employee authenticatedEmployee = employeeService.authenticate(employee.getUsername(), employee.getPassword());

		if (authenticatedEmployee != null) {
			// Check if employee status is "Active"
			if ("Active".equalsIgnoreCase(authenticatedEmployee.getStatus())) {
				// Store employee details in session
				session.setAttribute("employeeId", authenticatedEmployee.getEmployeeId());
				session.setAttribute("firstName", authenticatedEmployee.getFirstName());
				session.setAttribute("employeeRole", authenticatedEmployee.getRole());

				// Redirect based on employee role
				String role = authenticatedEmployee.getRole();
				if ("Employee".equalsIgnoreCase(role)) {
					return "redirect:/employee/employeedashboard";
				} else if ("HR Manager".equalsIgnoreCase(role)) {
					return "redirect:/employee/hrdashboard";
				} else if ("HR Admin".equalsIgnoreCase(role)) {
					return "redirect:/employee/hradmindashboard";
				} else {
					// Fallback to home page
					return "redirect:/employee/home";
				}
			} else {
				// If employee status is not active, show an error message
				model.addAttribute("errorMessage", "Invalid Credentials!");
				return "login";
			}
		} else {
			// If authentication fails, return an error message
			model.addAttribute("errorMessage", "Invalid Credentials!");
			return "login";
		}
	}

	// Displays the HR dashboard
	@GetMapping("/hrdashboard")
	public String hrDashboard(Model model) {
		return "hrdashboard";
	}

	// Displays the employee dashboard
	@GetMapping("/employeedashboard")
	public String employeeDashboard(Model model) {
		return "employeedashboard";
	}

	// Displays the HR admin dashboard
	@GetMapping("/hradmindashboard")
	public String hrAdminDashboard(Model model) {
		return "hradmindashboard";
	}

	// Displays the add employee page
	@GetMapping("/addemployee")
	public String addEmployeePage(Model model) {
		return "addemployee";
	}

	// Retrieves and displays the list of employees for HR admin view
	@GetMapping("/list")
	public String getEmployeeList(Model model) {
		// Get all employees from the service and add to model
		List<Employee> list = employeeService.getAllEmployees();
		model.addAttribute("employees", list);
		return "listemployee";
	}

	// Adds a new employee (HR functionality)
	@PostMapping("/addemployee")
	public String saveEmployee(@ModelAttribute("employee") Employee employee, Model model,
			RedirectAttributes redirectAttributes) {
		// Save the new employee using the service
		employeeService.addEmployee(employee);
		// Display success message and redirect to the update page
		redirectAttributes.addFlashAttribute("message", "Employee added successfully!");
		return "redirect:/employee/update";
	}

	// Retrieves and displays all employees for update purposes (HR functionality)
	@GetMapping("/update")
	public String getAllEmployees(Model model) {
		// Get all employees for updating
		List<Employee> list = employeeService.getAllEmployees();
		model.addAttribute("employees", list);
		return "updateemployee";
	}

	// Displays the employee update page with pre-filled details
	@GetMapping("/updateemployeedetail")
	public String getEmployeeForUpdateDetails(@RequestParam("employeeId") String employeeId, Model model) {
		// Get employee details for the given employee ID and add to model
		model.addAttribute("employeeId", employeeId);
		model.addAttribute("employee", employeeService.getEmployeeById(employeeId));
		return "updateemployeedetail";
	}

	// Updates employee details (HR functionality)
	@PostMapping("/update")
	public String updateEmployee(@ModelAttribute Employee employee, Model model,
			RedirectAttributes redirectAttributes) {
		// Update employee details using the service
		String employeeId = employee.getEmployeeId();
		Employee updatedEmployee = employeeService.updateEmployee(employeeId, employee);

		// Check if the update was successful
		if (updatedEmployee != null) {
			// Redirect to the update page with a success message
			redirectAttributes.addFlashAttribute("message", "Employee details updated successfully!");
			return "redirect:/employee/update";
		}
		// If update failed, return an error message
		redirectAttributes.addFlashAttribute("errorMessage", "Failed to update employee!");
		return "updateemployee";
	}

	// Displays the employee's profile details for viewing or updating
	@GetMapping("/viewprofile")
	public String getEmployeeDetails(@RequestParam("employeeId") String employeeId, Model model) {
		// Retrieve employee details for the given ID and add to model
		model.addAttribute("employeeId", employeeId);
		Employee employee = employeeService.getEmployeeById(employeeId);
		model.addAttribute("employee", employee);
		return "updatemyprofile";
	}

	// Handles the update of employee's own profile
	@PostMapping("/updatemydetails")
	public String updateMyDetails(@ModelAttribute Employee employee, Model model,
			RedirectAttributes redirectAttributes) {
		// Update the employee's own profile details
		String employeeId = employee.getEmployeeId();
		Employee updatedEmployee = employeeService.updateEmployee(employeeId, employee);

		// Add success message and redirect based on role
		String role = updatedEmployee.getRole();
		redirectAttributes.addFlashAttribute("message", "Details updated successfully!");
		if ("Employee".equalsIgnoreCase(role)) {
			return "redirect:/employee/employeedashboard";
		} else if ("HR Manager".equalsIgnoreCase(role)) {
			return "redirect:/employee/hrdashboard";
		} else if ("HR Admin".equalsIgnoreCase(role)) {
			return "redirect:/employee/hradmindashboard";
		} else {
			// Fallback to home page
			return "redirect:/employee/home";
		}
	}

	// Changes the employee's password
	@PostMapping("/changepassword")
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {

		// Retrieve the employee ID from session
		String employeeId = (String) session.getAttribute("employeeId");

		// If session expired, redirect to login
		if (employeeId == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Session expired. Please log in again.");
			return "redirect:/employee/login";
		}

		// Fetch the employee by ID
		Employee employee = employeeService.getEmployeeById(employeeId);
		if (employee == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Employee not found!");
			return "redirect:/employee/employeedashboard";
		}

		// Verify current password matches
		if (!employeeService.verifyPassword(currentPassword, employee.getPassword())) {
			redirectAttributes.addFlashAttribute("errorMessage", "Current password is incorrect!");

			// Redirect based on employee role
			String role = employee.getRole();
			if ("Employee".equalsIgnoreCase(role)) {
				return "redirect:/employee/employeedashboard";
			} else if ("HR Manager".equalsIgnoreCase(role)) {
				return "redirect:/employee/hrdashboard";
			} else if ("HR Admin".equalsIgnoreCase(role)) {
				return "redirect:/employee/hradmindashboard";
			} else {
				// Fallback to home page
				return "redirect:/employee/home";
			}
		}

		// Update the password if verification passes
		employeeService.updatePassword(employeeId, newPassword);
		// Inform user to login again after password change
		redirectAttributes.addFlashAttribute("message",
				"Your password was changed successfully. Please login again to continue.");
		return "redirect:/employee/login";
	}
}
