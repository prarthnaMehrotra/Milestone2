package com.crimsonlogic.officeseatallotment.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.crimsonlogic.officeseatallotment.entity.Employee;
import com.crimsonlogic.officeseatallotment.entity.Seat;

@Repository
public interface SeatRepository extends JpaRepository<Seat, String> {

	Optional<Seat> findBySeatNumber(String seatNumber);

	List<Seat> findByStatus(String string);

	Optional<Seat> findByAssignedTo(Employee employee);

}
