package com.crimsonlogic.officeseatallotment.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.officeseatallotment.entity.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {

	Optional<Employee> findByUsername(String username);

	@Query(value = "SELECT e.employeeId, e.firstName, e.lastName, e.role, e.team, e.designation, s.seatId "
			+ "FROM employees e LEFT JOIN seats s ON e.employeeId = s.assignedTo "
			+ "WHERE e.status = 'Active' AND e.role NOT IN ('HR Admin', 'HR Manager')", nativeQuery = true)
	List<Object[]> getEmployeeSeatData();

}