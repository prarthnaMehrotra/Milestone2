<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image:
		url('https://directlinedev.com/media/cases/rooney/header/background_1_zM58lsj.wide.jpeg');
	background-size: cover;
	background-attachment: fixed;
	background-color: #3d3d3d;
	color: #fff;
	font-family: 'Arial', sans-serif;
}

.navbar {
	background-color: crimson;
	top: 0;
	width: 100%;
	height: 60px;
}

.navbar-brand {
	color: white !important;
	font-size: 1.5rem;
	font-weight: bold;
}

.navbar-brand img {
	height: 50px;
	width: 60px;
	margin-right: -5px;
	margin-left: -10px;
}

.navbar-nav .nav-item {
	margin: 0 5px;
}

.navbar-nav .nav-link {
	color: white !important;
	font-size: 1rem;
	padding: 0.5rem 1rem;
	border-radius: 4px;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.navbar-nav .nav-link:hover, .navbar-nav .nav-link.active {
	color: #f1f1f1 !important;
	background-color: rgba(255, 255, 255, 0.2);
}

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

.login-container {
	max-width: 400px;
	margin: 8% auto;
	padding: 2rem;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	color: black;
}

.form-control {
	border-radius: 0.25rem;
}

.btn-crimson {
	background-color: crimson;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 0.55rem;
	margin-top: 15px;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
}

.error-message {
	color: red;
	font-size: 0.875rem;
	margin-top: 0.25rem;
}

a {
	color: crimson;
}

a:hover {
	color: #a30000;
}

.form-group+.btn-primary {
	margin-top: 1rem;
}

.alert-success {
	position: absolute;
	top: 6.5%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #d4edda;
	color: #155724;
	padding: 15px 30px;
	border-radius: 5px;
	max-width: 80%;
	width: 400px;
	z-index: 3;
	justify-content: center;
	text-align: center;
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
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/employee/home"> <img
				src="${pageContext.request.contextPath}/resources/images/logo1.png"
				alt="Logo">WorkWise
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/employee/home">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/employee/login">Login</a></li>
				</ul>
			</div>
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

	<div class="overlay"></div>
	<div class="container">
		<div class="login-container">
			<h2 class="text-center">Login</h2>
			<c:if test="${not empty errorMessage}">
				<div class="error-message">${errorMessage}</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/employee/validate"
				method="post" class="form-label">
				<div class="form-group">
					<label for="username">Username</label> <input type="text"
						class="form-control" id="username" name="username" required>
				</div>

				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password" required>
				</div>

				<button type="submit" class="btn btn-crimson w-100">Login</button>

			</form>

		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
