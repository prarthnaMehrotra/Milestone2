package com.crimsonlogic.officeseatallotment.service;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.repository.EmployeeRepository;
import com.crimsonlogic.officeseatallotment.util.IDGenerator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private SeatService seatService;

	// to register an employee
	@Override
	public Employee addEmployee(Employee employee) {
		String employeeId = IDGenerator.generateEmployeeID();
		employee.setEmployeeId(employeeId);
		employee.setCreatedAt(new Date());
		employee.setStatus("Active");
		employee.setSeatAssigned("Unassigned");

		employee.setPassword(hashPassword(employee.getPassword()));
		return employeeRepository.save(employee);
	}

	// to delete an employee
	@Override
	public void deleteEmployee(String id) {
		employeeRepository.deleteById(id);
	}

	// to get the list of employees
	@Override
	public List<Employee> getAllEmployees() {
		return employeeRepository.findAll();
	}

	// to get an employee by id
	@Override
	public Employee getEmployeeById(String id) {
		Optional<Employee> employee = employeeRepository.findById(id);
		return employee.orElse(null);
	}

	// to get employee seat data
	@Override
	public List<Object[]> getEmployeeSeatData() {
		return employeeRepository.getEmployeeSeatData();
	}

	// to update an employee
	@Override
	public Employee updateEmployee(String id, Employee employeeDetails) {
		Employee employee = getEmployeeById(id);
		if (employee != null) {
			employee.setUsername(employeeDetails.getUsername());

			if (employeeDetails.getPassword() != null && !employeeDetails.getPassword().isEmpty()) {
				employee.setPassword(hashPassword(employeeDetails.getPassword()));
			}
			employee.setFirstName(employeeDetails.getFirstName());
			employee.setLastName(employeeDetails.getLastName());
			employee.setEmail(employeeDetails.getEmail());
			employee.setRole(employeeDetails.getRole());
			employee.setTeam(employeeDetails.getTeam());
			employee.setDesignation(employeeDetails.getDesignation());
			employee.setStatus(employeeDetails.getStatus());
			employee.setAddress(employeeDetails.getAddress());
			employee.setPhoneNumber(employeeDetails.getPhoneNumber());

			if ("Inactive".equalsIgnoreCase(employeeDetails.getStatus())) {
				seatService.unassignSeatByEmployeeId(id);
				employee.setSeatAssigned("Unassigned");
			}

			return employeeRepository.save(employee);
		}
		return null;
	}

	// for authentication while logging in
	@Override
	public Employee authenticate(String username, String password) {
		Optional<Employee> employeeOpt = employeeRepository.findByUsername(username);
		if (employeeOpt.isPresent()) {
			Employee employee = employeeOpt.get();
			if (BCrypt.checkpw(password, employee.getPassword())) {
				return employee;
			}
		}
		return null;
	}

	// to update the password of an employee
	public void updatePassword(String employeeId, String newPassword) {
		Employee employee = getEmployeeById(employeeId);
		if (employee != null) {
			employee.setPassword(hashPassword(newPassword));
			employeeRepository.save(employee);
		}
	}

	// to verify if the current password matches the stored one
	public boolean verifyPassword(String currentPassword, String hashedPassword) {
		return BCrypt.checkpw(currentPassword, hashedPassword);
	}

	// for hashing the password
	private String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
}
