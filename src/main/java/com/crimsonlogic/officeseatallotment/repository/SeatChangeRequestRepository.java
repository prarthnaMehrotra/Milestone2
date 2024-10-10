package com.crimsonlogic.officeseatallotment.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.entity.Seat;
import com.crimsonlogic.officeseatallotment.entity.SeatChangeRequest;

@Repository
public interface SeatChangeRequestRepository extends JpaRepository<SeatChangeRequest, String> {

	Optional<SeatChangeRequest> findByCurrentSeat_SeatNumber(String seatNumber);

	void deleteByCurrentSeat(Seat seat);

	Optional<SeatChangeRequest> findByEmployee(Employee employee);
}
