<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>HR Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
.navbar {
	background-color: crimson;
	width: 100%;
	height: 60px;
}

.navbar-brand {
	color: white !important;
	font-size: 20px;
}

.navbar-brand img {
	height: 50px;
	width: 60px;
	margin-right: -5px;
	margin-left: 10px;
}

.navbar-nav .nav-item {
	margin: 0 5px;
}

.navbar-nav .nav-link {
	color: white !important;
	font-size: 17px;
	padding: 0.5rem 1rem;
	border-radius: 4px;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.navbar-nav .nav-link:hover, .navbar-nav .nav-link.active {
	color: #f1f1f1 !important;
	background-color: rgba(255, 255, 255, 0.2);
}

.hero-section {
	background-size: cover;
	background-attachment: fixed;
	height: 95vh;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	position: relative;
}

.hero-section::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
}

.hero-section>div {
	position: relative;
	z-index: 2;
}

.office-layout {
	display: flex;
	gap: 120px;
	flex-wrap: wrap;
	justify-content: center;
}

.column-pair {
	display: flex;
	gap: 10px;
}

.desk-area {
	flex: 1 1 45px;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	margin-left: 15px;
}

.long-table {
	width: 80%;
	height: 400px;
	background-color: #e2eefe;
	border-radius: 8px;
	padding: 10px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	position: relative;
	display: flex;
	justify-content: center;
	transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.long-table:hover {
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
	transform: translateY(-5px);
}

.computers {
	display: flex;
	flex-direction: column;
	gap: 35px;
	justify-content: center;
	align-items: center;
}

.computer i {
	font-size: 30px;
	color: #34495e;
	transition: color 0.3s;
}

.chairs {
	display: flex;
	flex-direction: column;
	gap: 40px;
	position: absolute;
	top: 6%;
}

.chair i {
	font-size: 24px;
	transition: transform 0.3s ease;
	cursor: pointer;
}

.chair i:hover {
	transform: scale(1.2);
}

.chair {
	position: relative;
	display: inline-block;
}

.left-side {
	left: -30px;
}

.right-side {
	right: -30px;
}

.assigned {
	color: red;
}

.available {
	color: green;
}

.tooltip {
	font-size: 12px;
}

.tooltip-inner {
	max-width: none;
	font-size: 14px;
	padding: 8px 12px;
	border-radius: 4px;
	color: #fff;
}

.tooltip-assigned .tooltip-inner {
	background-color: rgba(211, 112, 112, 0.265);
	color: black;
}

.tooltip-available .tooltip-inner {
	background-color: rgba(134, 255, 134, 0.265);
	color: black;
}

@media ( max-width : 768px) {
	.office-layout {
		flex-direction: column;
		align-items: center;
	}
	.column-pair {
		flex-direction: row;
		justify-content: center;
	}
	.long-table {
		height: 150px;
	}
}

h5 {
	font-weight: bold;
	color: crimson !important;
}

.form-label {
	font-weight: bold;
}

.modal-dialog {
	position: relative;
	top: 10%;
}

.modal-header {
	background: transparent;
	border: none;
}

.btn-crimson {
	background-color: crimson;
	color: white;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
}

input[readonly] {
	background-color: #e9ecef;
	cursor: not-allowed;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/employee/hradmindashboard">
			<img
			src="${pageContext.request.contextPath}/resources/images/logo1.png"
			alt="Logo">HR Admin Dashboard
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/employee/home'/>">Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- Hero Section with Office Layout -->
	<section class="hero-section">
		<div class="container">
			<div class="office-layout">
				<!-- Column Pair 1 -->
				<div class="column-pair">
					<!-- Column 1 (Odd) -->
					<div class="desk-area odd">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs left-side">

								<c:forEach var="seatNumber"
									items="${['A1', 'A2', 'A3', 'A4', 'A5', 'A6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="A">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="A"
												onclick="openAssignmentModal('${seatNumber}', 'A')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Column 2 (Even) -->
					<div class="desk-area even">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs right-side">

								<c:forEach var="seatNumber"
									items="${['B1', 'B2', 'B3', 'B4', 'B5', 'B6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="B">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="B"
												onclick="openAssignmentModal('${seatNumber}', 'B')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- Column Pair 1 -->
				<div class="column-pair">
					<!-- Column 1 (Odd) -->
					<div class="desk-area odd">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs left-side">

								<c:forEach var="seatNumber"
									items="${['C1', 'C2', 'C3', 'C4', 'C5', 'C6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="C">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="C"
												onclick="openAssignmentModal('${seatNumber}', 'C')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Column 2 (Even) -->
					<div class="desk-area even">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs right-side">

								<c:forEach var="seatNumber"
									items="${['D1', 'D2', 'D3', 'D4', 'D5', 'D6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="D">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="D"
												onclick="openAssignmentModal('${seatNumber}', 'D')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- Column Pair 1 -->
				<div class="column-pair">
					<!-- Column 1 (Odd) -->
					<div class="desk-area odd">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs left-side">

								<c:forEach var="seatNumber"
									items="${['E1', 'E2', 'E3', 'E4', 'E5', 'E6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="E">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="E"
												onclick="openAssignmentModal('${seatNumber}', 'E')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Column 2 (Even) -->
					<div class="desk-area even">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs right-side">

								<c:forEach var="seatNumber"
									items="${['F1', 'F2', 'F3', 'F4', 'F5', 'F6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="F">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="F"
												onclick="openAssignmentModal('${seatNumber}', 'F')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- Column Pair 1 -->
				<div class="column-pair">
					<!-- Column 1 (Odd) -->
					<div class="desk-area odd">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs left-side">

								<c:forEach var="seatNumber"
									items="${['G1', 'G2', 'G3', 'G4', 'G5', 'G6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="A${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="G">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="G"
												onclick="openAssignmentModal('${seatNumber}', 'G')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Column 2 (Even) -->
					<div class="desk-area even">
						<div class="long-table">
							<div class="computers">
								<c:forEach var="i" begin="1" end="6">
									<div class="computer">
										<i class="fas fa-laptop"></i>
									</div>
								</c:forEach>
							</div>
							<div class="chairs right-side">

								<c:forEach var="seatNumber"
									items="${['H1', 'H2', 'H3', 'H4', 'H5', 'H6']}">
									<c:set var="isAssigned" value="false" />
									<c:forEach var="seat" items="${seats}">
										<c:if test="${seat.seatNumber == seatNumber}">
											<c:set var="isAssigned" value="true" />
											<c:set var="seatData" value="${seat}" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isAssigned}">
											<div class="chair assigned" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-assigned"
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												data-seat-number="${seatNumber}" data-row-number="H">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair chair-available available"
												data-bs-toggle="tooltip" data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available"
												data-seat-number="${seatNumber}" data-row-number="H"
												onclick="openAssignmentModal('${seatNumber}', 'H')">
												<i class="fas fa-chair"></i>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Bootstrap Modal -->
	<div class="modal fade" id="seatFormModal" tabindex="-1"
		aria-labelledby="seatFormModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="seatFormModalLabel">Assign Seat</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="seatForm"
						action="${pageContext.request.contextPath}/seats/assign"
						method="post">
						<div class="mb-3">
							<label for="firstName" class="form-label">Employee Name</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								value="${employee.firstName}" required readonly>
						</div>
						<div class="mb-3">
							<label for="seatNumber" class="form-label">Seat Number</label> <input
								type="text" class="form-control" id="seatNumber"
								name="seatNumber" required readonly>
						</div>
						<div class="mb-3">
							<label for="rowNumber" class="form-label">Row Number</label> <input
								type="text" class="form-control" id="rowNumber" name="rowNumber"
								required readonly>
						</div>
						<!-- Hidden input to auto-insert the employee ID based on the URL parameter -->
						<input type="hidden" id="employeeId" name="employeeId" value="">
						<button type="submit" class="btn btn-crimson w-100">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

	<script>
		var tooltipTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="tooltip"]'));
		var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl);
		});
	
		document.addEventListener('DOMContentLoaded', () => {
			
		    const urlParams = new URLSearchParams(window.location.search);
		    const employeeId = urlParams.get('employeeId');
		    const firstName = urlParams.get('firstName');
	
		    document.getElementById('employeeId').value = employeeId;
		    document.getElementById('firstName').value = firstName;
	
		    document.querySelectorAll('.chair-available').forEach(chair => {
		        chair.addEventListener('click', function () {
		        	
		            const seatNumber = this.getAttribute('data-seat-number');
		            const rowNumber = this.getAttribute('data-row-number');
	
		            document.getElementById('seatNumber').value = seatNumber;
		            document.getElementById('rowNumber').value = rowNumber;
	
		            const seatFormModal = new bootstrap.Modal(document.getElementById('seatFormModal'));
		            seatFormModal.show();
		        });
		    });
		});
	</script>
</body>
</html>
