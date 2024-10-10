<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>HR Dashboard</title>
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

.modal-header {
	background: transparent;
	border: none;
}

.custom-modal-position {
	position: relative;
	top: 20%;
	max-width: 560px;
}

.btn-crimson {
	background-color: crimson;
	color: white;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												title="${seatNumber} assigned to: ${seatData.employeeName}"
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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
												onclick="displayEmployeeDetails('${seatData.seatNumber}', '${seatData.assignedTo.employeeId}', '${seatData.employeeName}', '${seatData.assignedTo.designation}', '${seatData.assignedTo.team}', '${seatData.assignedTo.email}', '${seatData.assignedTo.phoneNumber}')">
												<i class="fas fa-chair"></i>
											</div>
										</c:when>
										<c:otherwise>
											<div class="chair available" data-bs-toggle="tooltip"
												data-bs-placement="top"
												data-bs-custom-class="tooltip-available" title="Available">
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

	<!-- Modal for displaying employee details -->
	<div class="modal fade" id="employeeDetailsModal" tabindex="-1"
		aria-labelledby="employeeDetailsModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md custom-modal-position">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="employeeDetailsModalLabel">
						<span id="modalEmployeeNameForTitle"></span>'s Details
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row mb-3">
						<div class="col-md-6">
							<strong>Seat Number:</strong> <span id="modalSeatNumber"></span>
						</div>
						<div class="col-md-6">
							<strong>Employee ID:</strong> <span id="modalEmployeeId"></span>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<strong>Employee Name:</strong> <span id="modalEmployeeName"></span>
						</div>
						<div class="col-md-6">
							<strong>Designation:</strong> <span id="modalDesignation"></span>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<strong>Team:</strong> <span id="modalTeam"></span>
						</div>
						<div class="col-md-6">
							<strong>Email:</strong> <span id="modalEmail"></span>
						</div>
					</div>
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

		function displayEmployeeDetails(seatNumber, employeeId, employeeName,
				designation, team, email, phoneNumber) {
			// Populating modal with employee details
			document.getElementById('modalSeatNumber').innerText = seatNumber;
			document.getElementById('modalEmployeeId').innerText = employeeId;
			document.getElementById('modalEmployeeName').innerText = employeeName;
			document.getElementById('modalDesignation').innerText = designation;
			document.getElementById('modalTeam').innerText = team;
			document.getElementById('modalEmail').innerText = email;
			document.getElementById('modalEmployeeNameForTitle').innerText = employeeName;

			// Show the modal
			var myModal = new bootstrap.Modal(document
					.getElementById('employeeDetailsModal'), {});
			myModal.show();
		}
	</script>
</body>
</html>
