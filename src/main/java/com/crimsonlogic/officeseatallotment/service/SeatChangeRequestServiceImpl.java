package com.crimsonlogic.officeseatallotment.service;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.entity.Seat;
import com.crimsonlogic.officeseatallotment.entity.SeatChangeRequest;
import com.crimsonlogic.officeseatallotment.exception.EmployeeNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatChangeRequestNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatNotFoundException;
import com.crimsonlogic.officeseatallotment.repository.EmployeeRepository;
import com.crimsonlogic.officeseatallotment.repository.SeatChangeRequestRepository;
import com.crimsonlogic.officeseatallotment.repository.SeatRepository;
import com.crimsonlogic.officeseatallotment.util.IDGenerator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SeatChangeRequestServiceImpl implements SeatChangeRequestService {

	@Autowired
	private SeatChangeRequestRepository seatChangeRequestRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private SeatRepository seatRepository;

	// to create a request for seat change
	@Transactional
	public SeatChangeRequest createRequest(String currentSeatNumber, String employeeId, String desiredSeatNumber,
			String reason) {
		// Find the employee
		Employee employee = employeeRepository.findById(employeeId)
				.orElseThrow(() -> new EmployeeNotFoundException("Employee not found with ID: " + employeeId));

		// Find the current seat
		Seat currentSeat = seatRepository.findBySeatNumber(currentSeatNumber)
				.orElseThrow(() -> new SeatNotFoundException("Seat not found with number: " + currentSeatNumber));

		// Check for an existing seat change request for this employee
		Optional<SeatChangeRequest> existingRequestOpt = seatChangeRequestRepository.findByEmployee(employee);

		if (existingRequestOpt.isPresent()) {
			SeatChangeRequest existingRequest = existingRequestOpt.get();

			// If the status is "Open" or "Accept", throw an exception with a custom message
			if ("Open".equals(existingRequest.getStatus())) {
				throw new IllegalStateException("Request already in consideration.");
			}
			if ("Accept".equals(existingRequest.getStatus())) {
				throw new IllegalStateException("Request already accepted.");
			}

			// If the status is "Reject", reactivate the request
			if ("Reject".equals(existingRequest.getStatus())) {
				existingRequest.setStatus("Open");
				existingRequest.setDesiredSeatNumber(desiredSeatNumber);
				existingRequest.setReason(reason);
				existingRequest.setRequestDate(new Date());
				return seatChangeRequestRepository.save(existingRequest);
			}
		}

		// Create a new seat change request if none exists
		SeatChangeRequest seatChangeRequest = seatChangeRequestRepository
				.findByCurrentSeat_SeatNumber(currentSeatNumber).orElseGet(() -> {
					SeatChangeRequest newSeatChangeRequest = new SeatChangeRequest();
					newSeatChangeRequest.setDesiredSeatNumber(desiredSeatNumber);
					newSeatChangeRequest.setStatus("Open");
					newSeatChangeRequest.setQueryId(IDGenerator.generateSeatChangeRequestID());
					return newSeatChangeRequest;
				});

		// Set the new request details
		seatChangeRequest.setEmployee(employee);
		seatChangeRequest.setCurrentSeat(currentSeat);
		seatChangeRequest.setDesiredSeatNumber(desiredSeatNumber);
		seatChangeRequest.setReason(reason);
		seatChangeRequest.setRequestDate(new Date());

		// Save and return the new request
		return seatChangeRequestRepository.save(seatChangeRequest);
	}

	// to get the list of all seat change request queries
	@Override
	public List<SeatChangeRequest> getAllQueries() {
		return seatChangeRequestRepository.findAll();
	}

	// to update the status of the seat change request queries
	@Override
	@Transactional
	public void updateRequestStatus(String queryId, String status) throws SeatChangeRequestNotFoundException {
		SeatChangeRequest seatChangeRequest = seatChangeRequestRepository.findById(queryId).orElseThrow(
				() -> new SeatChangeRequestNotFoundException("Seat change request not found with ID: " + queryId));

		seatChangeRequest.setStatus(status);
		seatChangeRequestRepository.save(seatChangeRequest);
	}
}
