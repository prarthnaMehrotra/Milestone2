// SeatAlreadyAssignedException.java
package com.crimsonlogic.officeseatallotment.exception;

public class SeatAlreadyAssignedException extends RuntimeException {
	
	private static final long serialVersionUID = 2270060283058694514L;

	public SeatAlreadyAssignedException(String message) {
		super(message);
	}
}
