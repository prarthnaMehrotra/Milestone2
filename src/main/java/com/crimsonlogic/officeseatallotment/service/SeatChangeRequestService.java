package com.crimsonlogic.officeseatallotment.service;

import java.util.List;

import com.crimsonlogic.officeseatallotment.entity.SeatChangeRequest;
import com.crimsonlogic.officeseatallotment.exception.SeatChangeRequestNotFoundException;

public interface SeatChangeRequestService {

	SeatChangeRequest createRequest(String currentSeat, String employeeId, String desiredSeatNumber, String reason);

	List<SeatChangeRequest> getAllQueries();

	void updateRequestStatus(String queryId, String status) throws SeatChangeRequestNotFoundException;

}
