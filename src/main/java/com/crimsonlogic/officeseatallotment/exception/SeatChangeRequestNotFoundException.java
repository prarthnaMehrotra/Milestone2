package com.crimsonlogic.officeseatallotment.exception;

public class SeatChangeRequestNotFoundException extends RuntimeException {
	
	private static final long serialVersionUID = 3717424360424796984L;

	public SeatChangeRequestNotFoundException(String message) {
		super(message);
	}
}
