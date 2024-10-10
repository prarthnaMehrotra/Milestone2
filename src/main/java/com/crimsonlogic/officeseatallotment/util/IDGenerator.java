package com.crimsonlogic.officeseatallotment.util;

import java.util.UUID;

public class IDGenerator {

	public static String generateCustomID(String prefix, int length) {
		String randomString = UUID.randomUUID().toString().replaceAll("-", "").substring(0, length);
		return prefix + randomString.toUpperCase();
	}

	public static String generateEmployeeID() {
		return generateCustomID("EMP-", 6);
	}

	public static String generateSeatID() {
		return generateCustomID("SI-", 6);
	}

	public static String generateSeatChangeRequestID() {
		return generateCustomID("QI-", 6);
	}
}
