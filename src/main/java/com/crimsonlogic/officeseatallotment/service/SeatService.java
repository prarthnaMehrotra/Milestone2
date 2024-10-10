package com.crimsonlogic.officeseatallotment.service;

import java.util.List;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.entity.Seat;

public interface SeatService {

	Seat assignSeat(String seatNumber, String rowNumber, String employeeId, String employeeFirstName);

	List<Seat> getAllSeats();

	List<Employee> getAllEmployees();

	List<String> getAvailableSeats();

	void unassignSeatByEmployeeId(String employeeId);

	Employee getEmployeeBySeat(String seatNumber);

}
