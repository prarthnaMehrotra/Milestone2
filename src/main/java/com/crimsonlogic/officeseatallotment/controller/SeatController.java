package com.crimsonlogic.officeseatallotment.controller;

import com.crimsonlogic.officeseatallotment.entity.Seat;
import com.crimsonlogic.officeseatallotment.exception.EmployeeNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatAlreadyAssignedException;
import com.crimsonlogic.officeseatallotment.exception.SeatNotFoundException;
import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.service.SeatService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/seats")
public class SeatController {

	@Autowired
	private SeatService seatService;

	// Method to redirect to the assign seat JSP page
	// Displays a list of available seats along with the employee ID
	@GetMapping("/assignseat")
	public String assignSeatPage(@RequestParam("employeeId") String employeeId, Model model) {
		model.addAttribute("employeeId", employeeId);
		model.addAttribute("seats", seatService.getAllSeats());
		return "assignseat";
	}

	// Method to assign a seat to an employee
	// If successful, redirects to the employee list page with a success message
	// In case of errors, redirects back to the assign seat page with an error
	// message
	@PostMapping("/assign")
	public String assignSeat(@RequestParam String seatNumber, @RequestParam String rowNumber,
			@RequestParam String employeeId, @RequestParam String firstName, Model model,
			RedirectAttributes redirectAttributes) {
		try {
			Seat assignedSeat = seatService.assignSeat(seatNumber, rowNumber, employeeId, firstName);
			redirectAttributes.addFlashAttribute("message", "Seat assigned successfully!");
			model.addAttribute("seat", assignedSeat);
			return "redirect:/employee/list";
		} catch (SeatAlreadyAssignedException | EmployeeNotFoundException e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to assign the seat!");
			return "redirect:/seats/assignseat?employeeId=" + employeeId;
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to assign the seat!");
			return "redirect:/employee/list";
		}
	}

	// Method to display the list of employees along with their seat status
	@GetMapping("/list")
	public String getEmployeeList(Model model) {
		List<Employee> list = seatService.getAllEmployees();
		model.addAttribute("employees", list);
		return "listemployee";
	}

	// Method to display all seats with their assignment status
	// (assigned/unassigned)
	@GetMapping("/seatdetails")
	public String getSeatDetails(Model model) {
		List<Seat> seats = seatService.getAllSeats();
		model.addAttribute("seats", seats);
		return "seatslayout";
	}

	// Method to display seat details for a specific employee
	// This includes the assigned seat as well as other available seats for seat
	// change options
	@GetMapping("/viewseats")
	public String getSeatDetailsForEmployee(@RequestParam("employeeId") String employeeId, Model model) {
		model.addAttribute("employeeId", employeeId);
		List<Seat> seats = seatService.getAllSeats();
		model.addAttribute("seats", seats);
		return "seatslayoutandchange";
	}

	// Method to fetch a list of available seats
	@GetMapping("/available")
	@ResponseBody
	public List<String> getAvailableSeatsForEmployee(Model model) {
		List<String> availableSeats = seatService.getAvailableSeats();
		return availableSeats;
	}

	// Method to unassign a seat for an employee
	// If successful, redirects to the employee list page with a success message
	// If the seat is not found, returns an error message
	@GetMapping("/unassignseat")
	public String unassignSeat(@RequestParam("employeeId") String employeeId, RedirectAttributes redirectAttributes) {
		try {
			seatService.unassignSeatByEmployeeId(employeeId);
			redirectAttributes.addFlashAttribute("message", "Seat unassigned successfully!");
			return "redirect:/employee/list";
		} catch (SeatNotFoundException e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Error unassigning the seat!");
			return "redirect:/employee/list";
		}
	}

	// Method to get employee details by seat number
	// This is used to fetch employee data associated with a specific seat
	@GetMapping("/employeeDetails/{seatNumber}")
	public Employee getEmployeeDetailsBySeat(@PathVariable String seatNumber) {
		Employee employee = seatService.getEmployeeBySeat(seatNumber);
		return employee;
	}

}
