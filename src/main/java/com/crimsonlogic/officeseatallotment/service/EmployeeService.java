package com.crimsonlogic.officeseatallotment.service;

import java.util.List;

import com.crimsonlogic.officeseatallotment.entity.Employee;

/**
 * 
 */
public interface EmployeeService {

	/**
	 * @param employee
	 * @return
	 */
	Employee addEmployee(Employee employee);

	/**
	 * @param id
	 */
	void deleteEmployee(String id);

	/**
	 * @return
	 */
	List<Employee> getAllEmployees();

	/**
	 * @param id
	 * @return
	 */
	Employee getEmployeeById(String id);

	/**
	 * @param id
	 * @param employeeDetails
	 * @return
	 */
	Employee updateEmployee(String id, Employee employeeDetails);

	Employee authenticate(String username, String password);

	void updatePassword(String employeeId, String newPassword);

	boolean verifyPassword(String currentPassword, String password);

	List<Object[]> getEmployeeSeatData();
}
