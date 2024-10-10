package com.crimsonlogic.officeseatallotment.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

/*
 * Author: Prarthna
 * Version: 1.0
 * Date: 2024-09-19
 * Description: The Seat entity class represents a seat in the office layout. 
 *              It includes information like seat number, row number, and the employee assigned to it.
 */

@Entity
@Table(name = "seats")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Seat {

	@Id
	@Column(name = "seat_id")
	private String seatId;

	@Column(name = "seat_number", unique = true, nullable = false)
	private String seatNumber;

	@Column(name = "seat_row_number", nullable = false, unique = true)
	private String seatRowNumber;

	@Column(name = "seat_status", nullable = false)
	private String status;

	@Column(name = "seat_alloted_at")
	private Date allotedAt;

	@Column(name = "employee_name", unique = true, nullable = false)
	private String employeeName;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "seat_assigned_to", referencedColumnName = "employee_id")
	private Employee assignedTo;
}
