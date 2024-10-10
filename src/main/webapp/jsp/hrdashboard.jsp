<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
	background-image: url('../resources/images/office1.jpeg');
	background-size: cover;
	background-attachment: fixed;
	background-color: #3d3d3d;
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
	background: rgba(0, 0, 0, 0.5);
	z-index: 1;
}

.hero-section>div {
	position: relative;
	z-index: 2;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s, box-shadow 0.3s;
	overflow: hidden;
	position: relative;
	z-index: 2;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
}

.card-header, .card-footer {
	background: transparent;
	border: 0px;
	color: white;
}

.card-body {
	text-align: center;
	padding: 20px;
}

.card-icon {
	font-size: 3rem;
	color: crimson;
	margin-bottom: 15px;
}

.btn-light {
	background-color: crimson;
	color: white;
	border-radius: 20px;
	padding: 10px 20px;
}

.btn-light:hover {
	background-color: #a50f27;
	color: white;
}

.alert-success {
	position: absolute;
	top: 4.9%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #d4edda;
	color: #155724;
	padding: 15px 30px;
	border-radius: 5px;
	max-width: 80%;
	width: 320px;
	z-index: 3;
}

.alert-danger {
	position: absolute;
	top: 4.9%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #f8d7da;
	color: #721c24;
	border-color: #f5c6cb;
	border-radius: 5px;
	padding: 15px 30px;
	max-width: 80%;
	width: 320px;
	z-index: 3;
	top: 4.7%;
	left: 50%;
	transform: translate(-50%, -50%);
	left: 50%;
	transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/employee/hrdashboard"> <img
			src="${pageContext.request.contextPath}/resources/images/logo1.png"
			alt="Logo">HR Dashboard
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

	<!-- Success Message Alert -->
	<c:if test="${not empty message}">
		<div
			class="alert alert-success alert-dismissible fade show alert-message"
			role="alert">
			<strong>${message}</strong>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>
	<!-- Error message alert -->
	<c:if test="${not empty errorMessage}">
		<div
			class="alert alert-danger alert-dismissible fade show alert-message"
			role="alert">
			<strong>${errorMessage}</strong>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>

	<!-- Card Section -->
	<section class="hero-section">
		<div class="container">
			<div class="row justify-content-center">

				<div class="col-md-5 mb-4">
					<div class="card text-center">
						<div class="card-header">
							<i class="fas fa-user card-icon"></i>
						</div>
						<div class="card-body">
							<h5 class="card-title">Personal Information</h5>
							<p class="card-text">View and Update your personal details
								and information.</p>
						</div>
						<div class="card-footer">
							<a
								href="<c:url value='/employee/viewprofile?employeeId=${sessionScope.employeeId}'/>"
								class="btn btn-light">View</a>
						</div>
					</div>
				</div>
				<div class="col-md-5 mb-4">
					<div class="card text-center">
						<div class="card-header">
							<i class="fas fa-plus card-icon"></i>
						</div>
						<div class="card-body">
							<h5 class="card-title">Add Employee</h5>
							<p class="card-text">Add a new employee to the system.</p>
						</div>
						<div class="card-footer">
							<a href="<c:url value='/employee/addemployee'/>"
								class="btn btn-light">Add</a>
						</div>
					</div>
				</div>
				<div class="col-md-5 mb-4">
					<div class="card text-center">
						<div class="card-header">
							<i class="fas fa-edit card-icon"></i>
						</div>
						<div class="card-body">
							<h5 class="card-title">Update Employee</h5>
							<p class="card-text">Update the details of an existing
								employee.</p>
						</div>
						<div class="card-footer">
							<a href="<c:url value='/employee/update'/>" class="btn btn-light">Update</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
