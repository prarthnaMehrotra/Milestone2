package com.crimsonlogic.officeseatallotment.entity;

import java.util.Date;
import java.util.List;
import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * Author: Prarthna
 * Version: 1.0
 * Date: 2024-09-19
 * Description: The Employee entity class represents the employee details in the office seat allotment system. 
 *              It includes fields such as personal information, role, team, seat assignment, and related seat change requests.
 */

@Entity
@Table(name = "employee")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee {

	@Id
	@Column(name = "employee_id")
	private String employeeId;

	@Column(name = "employee_username", unique = true, nullable = false)
	private String username;

	@Column(name = "employee_password", nullable = false)
	private String password;

	@Column(name = "employee_first_name", nullable = false)
	private String firstName;

	@Column(name = "employee_last_name")
	private String lastName;

	@Column(name = "employee_role", nullable = false)
	private String role;

	@Column(name = "employee_team", nullable = false)
	private String team;

	@Column(name = "employee_designation", nullable = false)
	private String designation;

	@Column(name = "employee_email", nullable = false)
	private String email;

	@Column(name = "employee_phone_number", nullable = false)
	private Long phoneNumber;

	@Column(name = "employee_dob", nullable = false)
	private String dateOfBirth;

	@Column(name = "employee_age", nullable = false)
	private int age;

	@Column(name = "employee_address", nullable = false)
	private String address;

	@Column(name = "employee_created_at", nullable = false)
	private Date createdAt;

	@Column(name = "employee_status")
	private String status;

	@Column(name = "seat_assigned", nullable = false)
	private String seatAssigned;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<SeatChangeRequest> seatChangeRequests;
}
