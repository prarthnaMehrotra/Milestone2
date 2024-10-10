package com.crimsonlogic.officeseatallotment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crimsonlogic.officeseatallotment.entity.SeatChangeRequest;
import com.crimsonlogic.officeseatallotment.exception.EmployeeNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatChangeRequestNotFoundException;
import com.crimsonlogic.officeseatallotment.exception.SeatNotFoundException;
import com.crimsonlogic.officeseatallotment.service.SeatChangeRequestService;

@Controller
@RequestMapping("/seatchangerequest")
public class SeatChangeRequestController {

	@Autowired
	private SeatChangeRequestService seatChangeRequestService;

	// Method to create a seat change request
	@PostMapping("/seatchange")
	public String createSeatChangeRequest(@RequestParam("employeeId") String employeeId,
			@RequestParam("currentSeatNumber") String currentSeatNumber,
			@RequestParam("desiredSeatNumber") String desiredSeatNumber,
			@RequestParam(value = "reason", required = false) String reason, Model model,
			RedirectAttributes redirectAttributes) {
		try {
			// Create the seat change request using the service layer
			SeatChangeRequest createdSeat = seatChangeRequestService.createRequest(currentSeatNumber, employeeId,
					desiredSeatNumber, reason);
			redirectAttributes.addFlashAttribute("message", "Request submitted successfully!");
			model.addAttribute("createdSeat", createdSeat);
			return "redirect:/employee/employeedashboard";
		} catch (SeatNotFoundException e) {
			// Handle case where seat is not found
			redirectAttributes.addFlashAttribute("errorMessage", "Seat not found!");
			return "redirect:/employee/employeedashboard";
		} catch (EmployeeNotFoundException e) {
			// Handle case where employee is not found
			redirectAttributes.addFlashAttribute("errorMessage", "Employee not found!");
			return "redirect:/employee/employeedashboard";
		} catch (IllegalStateException e) {
			// Handle case where an illegal state is encountered (e.g., seat already
			// assigned)
			String errorMessage = e.getMessage();
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			return "redirect:/employee/employeedashboard";
		} catch (Exception e) {
			// Handle general exceptions
			redirectAttributes.addFlashAttribute("errorMessage", "Error submitting the request!");
			return "redirect:/employee/employeedashboard";
		}
	}

	// Method to get the list of seat change requests
	@GetMapping("/seatchangerequestlist")
	public String getAllRequests(Model model) {
		// Retrieve the list of all seat change requests using the service layer
		List<SeatChangeRequest> queries = seatChangeRequestService.getAllQueries();
		model.addAttribute("queries", queries);
		return "seatchangerequest";
	}

	// Method to change the status of the seat change request query
	@GetMapping("/querystatuschange")
	public String updateSeatChangeRequestStatus(@RequestParam("queryId") String queryId,
			@RequestParam("status") String status, RedirectAttributes redirectAttributes) {
		try {
			// Update the request status using the service layer
			seatChangeRequestService.updateRequestStatus(queryId, status);
			redirectAttributes.addFlashAttribute("message", "Status updated successfully!");
		} catch (SeatChangeRequestNotFoundException e) {
			// Handle case where the seat change request is not found
			redirectAttributes.addFlashAttribute("errorMessage", "Request not found!");
		} catch (Exception e) {
			// Handle general exceptions
			redirectAttributes.addFlashAttribute("errorMessage", "Error updating the status!");
		}
		return "redirect:/seatchangerequest/seatchangerequestlist";
	}
}
