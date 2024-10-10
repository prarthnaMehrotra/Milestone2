package com.crimsonlogic.officeseatallotment.entity;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

/*
 * Author: Prarthna
 * Version: 1.0
 * Date: 2024-09-19
 * Description: The SeatChangeRequest entity represents a request for changing an employee's seat. 
 *              It includes details like the current seat, desired seat, reason for the change, and the status of the request.
 */

@Entity
@Table(name = "queries")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatChangeRequest {

	@Id
	@Column(name = "query_id")
	private String queryId;

	@ManyToOne
	@JoinColumn(name = "employee_id", nullable = false)
	private Employee employee;

	@OneToOne
	@JoinColumn(name = "current_seat_id", referencedColumnName = "seat_id")
	private Seat currentSeat;

	@Column(name = "desired_seat_number")
	private String desiredSeatNumber;

	@Column(name = "query_status", nullable = false)
	private String status;

	@Column(name = "query_reason")
	private String reason;

	@Column(name = "query_request_date", nullable = false)
	private Date requestDate;
}
