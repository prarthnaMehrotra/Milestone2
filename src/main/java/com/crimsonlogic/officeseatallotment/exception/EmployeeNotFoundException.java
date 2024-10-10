// EmployeeNotFoundException.java
package com.crimsonlogic.officeseatallotment.exception;

public class EmployeeNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 445277682463465033L;

	public EmployeeNotFoundException(String message) {
        super(message);
    }
}
