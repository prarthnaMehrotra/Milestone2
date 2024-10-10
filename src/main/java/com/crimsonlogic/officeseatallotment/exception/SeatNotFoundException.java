// SeatNotFoundException.java
package com.crimsonlogic.officeseatallotment.exception;

public class SeatNotFoundException extends RuntimeException {
    
	private static final long serialVersionUID = -6375504278483854200L;

	public SeatNotFoundException(String message) {
        super(message);
    }
}

