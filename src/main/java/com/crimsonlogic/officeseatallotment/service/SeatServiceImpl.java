package com.crimsonlogic.officeseatallotment.service;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.entity.Seat;
import com.crimsonlogic.officeseatallotment.exception.EmployeeNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatAlreadyAssignedException;
import com.crimsonlogic.officeseatallotment.exception.SeatNotFoundException;
import com.crimsonlogic.officeseatallotment.repository.EmployeeRepository;
import com.crimsonlogic.officeseatallotment.repository.SeatChangeRequestRepository;
import com.crimsonlogic.officeseatallotment.repository.SeatRepository;
import com.crimsonlogic.officeseatallotment.util.IDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatRepository seatRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private SeatChangeRequestRepository seatChangeRequestRepository;

	// to get all seats
	@Override
	public List<Seat> getAllSeats() {
		return seatRepository.findAll();
	}

	// to get all employees
	@Override
	public List<Employee> getAllEmployees() {
		return employeeRepository.findAll();
	}

	// to assign seats
	@Override
	@Transactional
	public Seat assignSeat(String seatNumber, String rowNumber, String employeeId, String employeeFirstName) {

		Seat seat = seatRepository.findBySeatNumber(seatNumber).orElseGet(() -> {

			Seat newSeat = new Seat();
			newSeat.setSeatNumber(seatNumber);
			newSeat.setSeatRowNumber(rowNumber);
			newSeat.setStatus("Available");
			newSeat.setAllotedAt(null);
			newSeat.setSeatId(IDGenerator.generateSeatID());

			return newSeat;
		});

		Employee employee = employeeRepository.findById(employeeId)
				.orElseThrow(() -> new EmployeeNotFoundException("Employee not found with ID: " + employeeId));

		if ("Assigned".equalsIgnoreCase(seat.getStatus())) {
			throw new SeatAlreadyAssignedException("Seat is already assigned.");
		}

		seat.setAssignedTo(employee);
		seat.setEmployeeName(employeeFirstName);
		seat.setStatus("Assigned");
		seat.setAllotedAt(new Date());

		employee.setSeatAssigned("Assigned");
		employeeRepository.save(employee);

		return seatRepository.save(seat);
	}

	// to get a list of available seats
	@Override
	public List<String> getAvailableSeats() {
		List<String> staticSeats = new ArrayList<>();
		char[] rows = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H' };
		for (char row : rows) {
			for (int i = 1; i <= 6; i++) {
				staticSeats.add(String.valueOf(row) + i);
			}
		}

		List<Seat> assignedSeats = seatRepository.findAll();

		List<String> assignedSeatNumbers = assignedSeats.stream().map(Seat::getSeatNumber).collect(Collectors.toList());

		List<String> availableSeats = staticSeats.stream()
				.filter(seatNumber -> !assignedSeatNumbers.contains(seatNumber)).collect(Collectors.toList());

		return availableSeats;
	}

	@Override
	@Transactional
	public void unassignSeatByEmployeeId(String employeeId) {
		// Find the Employee object
		Employee employee = employeeRepository.findById(employeeId)
				.orElseThrow(() -> new EmployeeNotFoundException("Employee not found with ID: " + employeeId));

		// Find the seat associated with the employee
		Seat seat = seatRepository.findByAssignedTo(employee).orElseThrow(
				() -> new SeatNotFoundException("Seat not found for employee: " + employee.getFirstName()));

		// Delete the seat change request associated with the seat
		seatChangeRequestRepository.deleteByCurrentSeat(seat);

		// Delete the seat assignment
		seatRepository.delete(seat);

		// Update the employee's seatAssigned field to "Unassigned"
		employee.setSeatAssigned("Unassigned");
		employeeRepository.save(employee);
	}

	// to get employee details using seat number
	@Override
	public Employee getEmployeeBySeat(String seatNumber) {
		Seat seat = seatRepository.findBySeatNumber(seatNumber)
				.orElseThrow(() -> new SeatNotFoundException("Seat not found: " + seatNumber));

		return seat.getAssignedTo();
	}

}
