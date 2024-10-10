<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Employee Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
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
	height: 89.9vh;
	display: flex;
	align-items: center;
	justify-content: center;
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

.form-container {
	max-width: 670px;
	margin: 0 auto;
	border-radius: 8px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	height: 300px;
}

h4, h5 {
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

.form-buttons {
	margin-top: 30px;
}

.profile-link, .password-link {
	color: crimson;
	text-decoration: underline;
}

.profile-link:hover, .password-link:hover {
	color: darkred;
}

.btn-crimson {
	background-color: crimson;
	color: white;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
}

.error-message {
	color: red;
	font-size: 0.875rem;
	margin-top: 0.25rem;
	display: none;
}

input[readonly] {
	background-color: #e9ecef;
	cursor: not-allowed;
}
</style>
</head>
<body>

	<%
	String role = (String) session.getAttribute("employeeRole");
	if ("Employee".equals(role)) {
	%>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/employee/employeedashboard">
			<img
			src="${pageContext.request.contextPath}/resources/images/logo1.png"
			alt="Logo">Employee Dashboard
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
	<!-- End Of Navbar -->
	<%
	} else if ("HR Admin".equals(role)) {
	%>
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
	<!--End Of Navbar -->
	<%
	} else if ("HR Manager".equals(role)) {
	%>
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
	<!-- End Of Navbar -->
	<%
	}
	%>

	<!-- Hero Section -->
	<section class="hero-section">
		<div class="container mt-4">
			<!-- Employee Info Card -->
			<div class="card form-container">
				<div class="card-header">
					<h4 class="card-title mb-0 text-start">My Profile</h4>
				</div>
				<div class="card-body">
					<!-- Display Employee Information -->
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Employee ID:</strong>
									${employee.employeeId}</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Username:</strong> ${employee.username}</span>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Name:</strong> ${employee.firstName}
									${employee.lastName}</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Email:</strong> ${employee.email}</span>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Phone Number:</strong>
									${employee.phoneNumber}</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Address:</strong> <span>${employee.address}</span>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Designation:</strong>
									${employee.designation}</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="d-flex justify-content-between">
								<span><strong>Team:</strong> ${employee.team}</span>
							</div>
						</div>
					</div>

					<div class="row mb-3 form-buttons">
						<div class="col-md-6">
							<p>
								<strong>Update your profile:</strong> <a href="#"
									class="profile-link" data-bs-toggle="modal"
									data-bs-target="#updateProfileModal"> Update Profile </a>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<strong>Change your password:</strong> <a href="#"
									class="password-link" data-bs-toggle="modal"
									data-bs-target="#changePasswordModal"> Change Password </a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Update Profile Modal -->
	<div class="modal fade" id="updateProfileModal" tabindex="-1"
		aria-labelledby="updateProfileModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateProfileModalLabel">Update
						Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="<c:url value='/employee/updatemydetails'/>"
						method="post" id="updateDetailsForm">

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username"
									value="${employee.username}" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="employeeId" class="form-label">Employee ID</label> <input
									type="text" class="form-control" id="employeeId"
									name="employeeId" value="${employee.employeeId}" readonly>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="firstName" class="form-label">First Name</label> <input
									type="text" class="form-control" id="firstName"
									name="firstName" value="${employee.firstName}" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName" class="form-label">Last Name</label> <input
									type="text" class="form-control" id="lastName" name="lastName"
									value="${employee.lastName}" readonly>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									value="${employee.email}">
								<div id="emailError" class="error-message">Email should be
									in the form "name@example.com".</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="phoneNumber" class="form-label">Phone Number</label>
								<input type="text" class="form-control" id="phoneNumber"
									name="phoneNumber" value="${employee.phoneNumber}">
								<div id="phoneNumberError" class="error-message">Phone
									number should start with 6-9 and contain exactly 10 digits.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address" name="address"
									value="${employee.address}">
								<div id="addressError" class="error-message">Address
									should be 10-100 characters long.</div>
							</div>
						</div>
						<input type="hidden" name="role" value="${employee.role}" /> <input
							type="hidden" name="team" value="${employee.team}" /> <input
							type="hidden" name="designation" value="${employee.designation}" />
						<input type="hidden" name="status" value="${employee.status}" />

						<div class="form-group mb-3 text-center">
							<button type="submit" class="btn btn-crimson w-100">Update
								Profile</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Change Password Modal -->
	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		aria-labelledby="changePasswordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="changePasswordModalLabel">Change
						Password</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/employee/changepassword"
						method="post" id="changePasswordForm">
						<div class="mb-3">
							<label for="firstName" class="form-label">Employee Name</label> <input
								type="text" class="form-control" id="firstname" name="firstName"
								value="${employee.firstName}" readonly>
						</div>
						<div class="mb-3">
							<label for="currentPassword" class="form-label">Current
								Password</label> <input type="password" class="form-control"
								id="currentPassword" name="currentPassword" required>
							<div id="currentPasswordError" class="error-message">Password
								should be 8-20 characters long, include at least one uppercase
								letter, one lowercase letter, one number, and one special
								character.</div>
						</div>
						<div class="mb-3">
							<label for="newPassword" class="form-label">New Password</label>
							<input type="password" class="form-control" id="newPassword"
								name="newPassword" required>
							<div id="newPasswordError" class="error-message">Password
								should be 8-20 characters long, include at least one uppercase
								letter, one lowercase letter, one number, and one special
								character.</div>
						</div>

						<!-- Hidden input to auto-insert the employee ID based on the URL parameter -->
						<input type="hidden" id="employeeid" name="employeeId"
							value="${employee.employeeId}">

						<button type="submit" class="btn btn-crimson w-100">Change
							Password</button>
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
		document.addEventListener('DOMContentLoaded', function () {
			var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co|net|in)$/;
		    var phoneNumberPattern = /^[6-9]\d{9}$/;
		    var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&*()_+!~`|{}:;"'<>,.?/\\-]).{8,20}$/;
	
		    function validateEmail() {
		        var email = document.getElementById("email").value;
		        var emailError = document.getElementById("emailError");
		        if (email.length < 1 || email.length > 50 || !emailPattern.test(email)) {
		            emailError.style.display = "block";
		        } else {
		            emailError.style.display = "none";
		        }
		    }
	
		    function validatePhoneNumber() {
		        var phoneNumber = document.getElementById("phoneNumber").value;
		        var phoneNumberError = document.getElementById("phoneNumberError");
		        if (!phoneNumberPattern.test(phoneNumber)) {
		            phoneNumberError.style.display = "block";
		        } else {
		            phoneNumberError.style.display = "none";
		        }
		    }
	
		    function validateAddress() {
		        var address = document.getElementById("address").value;
		        var addressError = document.getElementById("addressError");
		        if (address.length < 10 || address.length > 100) {
		            addressError.style.display = 'block';
		        } else {
		            addressError.style.display = 'none';
		        }
		    }
	
		    document.getElementById('email').addEventListener('input', validateEmail);
		    document.getElementById('phoneNumber').addEventListener('input', validatePhoneNumber);
		    document.getElementById('address').addEventListener('input', validateAddress);
	
		    document.getElementById('updateDetailsForm').addEventListener('submit', function(event) {
		        validateEmail();
		        validatePhoneNumber();
		        validateAddress();
	
		        if (document.querySelectorAll('.error-message[style*="block"]').length > 0) {
		            event.preventDefault();
		        }
		    });
		    
		    document.getElementById('changePasswordModal').addEventListener('show.bs.modal', function () {
		        function validatePassword(inputId, errorId) {
		            var password = document.getElementById(inputId).value;
		            var passwordError = document.getElementById(errorId);
		            if (!passwordPattern.test(password)) {
		                passwordError.style.display = "block";
		            } else {
		                passwordError.style.display = "none";
		            }
		        }
		        
		        document.getElementById('currentPassword').addEventListener('input', function () {
		            validatePassword('currentPassword', 'currentPasswordError');
		        });
		        
		        document.getElementById('newPassword').addEventListener('input', function () {
		            validatePassword('newPassword', 'newPasswordError');
		        });
	
		        document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
		            validatePassword('currentPassword', 'currentPasswordError');
		            validatePassword('newPassword', 'newPasswordError');
		    
		            if (document.querySelectorAll('.error-message[style*="block"]').length > 0) {
		                event.preventDefault();
		            }
		        });
		    });
		});

	</script>
</body>
</html>
