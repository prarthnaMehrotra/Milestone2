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
	height: 105vh;
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
	max-width: 700px;
	margin: 0 auto;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.card-header {
	background: transparent;
	border: none;
}

h4 {
	font-weight: bold;
	color: crimson !important;
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

	<section class="hero-section">
		<div class="container mt-4">
			<!-- Update Employee Details Form -->
			<div class="card form-container">
				<div class="card-header text-center">
					<h4 class="card-title">Update Employee Details</h4>
				</div>
				<div class="card-body">
					<form action="<c:url value='/employee/update'/>" method="post"
						id="updateForm">
						<input type="hidden" name="employeeId"
							value="${employee.employeeId}" />

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username"
									value="${employee.username}" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="empId" class="form-label">Employee ID</label> <input
									type="text" class="form-control" id="empId" name="empId"
									value="${employee.employeeId}" readonly>
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
									value="${employee.email}" required>
								<div id="emailError" class="error-message">Enter a valid
									email address.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="phoneNumber" class="form-label">Phone Number</label>
								<input type="tel" class="form-control" id="phoneNumber"
									name="phoneNumber" value="${employee.phoneNumber}" required
									pattern="[0-9]{10}">
								<div id="phoneNumberError" class="error-message">Phone
									number should start with 6-9 and contain exactly 10 digits.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address" name="address"
									value="${employee.address}" required>
								<div id="addressError" class="error-message">Address
									should be 10-100 characters long.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="team" class="form-label">Team</label> <input
									type="text" class="form-control" id="team" name="team"
									value="${employee.team}" required>
								<div id="teamNameError" class="error-message">Team name
									should be 3-20 characters long and contain only letters.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="designation" class="form-label">Designation</label>
								<select class="form-select" id="designation" name="designation"
									required>
									<option value="" disabled>Select Designation</option>
									<option value="Human Resource Manager"
										${employee.designation == 'Human Resource Manager' ? 'selected' : ''}>Human
										Resource Manager</option>
									<option value="Human Resource Admin"
										${employee.designation == 'Human Resource Admin' ? 'selected' : ''}>Human
										Resource Admin</option>
									<option value="Software Engineer 1"
										${employee.designation == 'Software Engineer 1' ? 'selected' : ''}>Software
										Engineer 1</option>
									<option value="Software Engineer 2"
										${employee.designation == 'Software Engineer 2' ? 'selected' : ''}>Software
										Engineer 2</option>
									<option value="Software Engineer 3"
										${employee.designation == 'Software Engineer 3' ? 'selected' : ''}>Software
										Engineer 3</option>
									<option value="Data Analyst 1"
										${employee.designation == 'Data Analyst 1' ? 'selected' : ''}>Data
										Analyst 1</option>
									<option value="Data Analyst 2"
										${employee.designation == 'Data Analyst 2' ? 'selected' : ''}>Data
										Analyst 2</option>
									<option value="Data Analyst 3"
										${employee.designation == 'Data Analyst 3' ? 'selected' : ''}>Data
										Analyst 3</option>
									<option value="Graduate Associate 1"
										${employee.designation == 'Graduate Associate 1' ? 'selected' : ''}>Graduate
										Associate 1</option>
									<option value="Graduate Associate 2"
										${employee.designation == 'Graduate Associate 2' ? 'selected' : ''}>Graduate
										Associate 2</option>
									<option value="Graduate Associate 3"
										${employee.designation == 'Graduate Associate 3' ? 'selected' : ''}>Graduate
										Associate 3</option>
									<option value="DevOps Engineer 1"
										${employee.designation == 'DevOps Engineer 1' ? 'selected' : ''}>DevOps
										Engineer 1</option>
									<option value="DevOps Engineer 2"
										${employee.designation == 'DevOps Engineer 2' ? 'selected' : ''}>DevOps
										Engineer 2</option>
									<option value="DevOps Engineer 3"
										${employee.designation == 'DevOps Engineer 3' ? 'selected' : ''}>DevOps
										Engineer 3</option>
									<option value="Network Engineer 1"
										${employee.designation == 'Network Engineer 1' ? 'selected' : ''}>Network
										Engineer 1</option>
									<option value="Network Engineer 2"
										${employee.designation == 'Network Engineer 2' ? 'selected' : ''}>Network
										Engineer 2</option>
									<option value="Network Engineer 3"
										${employee.designation == 'Network Engineer 3' ? 'selected' : ''}>Network
										Engineer 3</option>
									<option value="Project Manager"
										${employee.designation == 'Project Manager' ? 'selected' : ''}>Project
										Manager</option>
									<option value="Business Analyst"
										${employee.designation == 'Business Analyst' ? 'selected' : ''}>Business
										Analyst</option>
									<option value="Quality Assurance 1"
										${employee.designation == 'Quality Assurance 1' ? 'selected' : ''}>Quality
										Assurance 1</option>
									<option value="Quality Assurance 2"
										${employee.designation == 'Quality Assurance 2' ? 'selected' : ''}>Quality
										Assurance 2</option>
									<option value="HR 1"
										${employee.designation == 'HR 1' ? 'selected' : ''}>HR
										1</option>
									<option value="HR 2"
										${employee.designation == 'HR 2' ? 'selected' : ''}>HR
										2</option>
									<option value="HR 3"
										${employee.designation == 'HR 3' ? 'selected' : ''}>HR
										3</option>
									<option value="IT Support 1"
										${employee.designation == 'IT Support 1' ? 'selected' : ''}>IT
										Support 1</option>
									<option value="IT Support 2"
										${employee.designation == 'IT Support 2' ? 'selected' : ''}>IT
										Support 2</option>
								</select>
								<div id="designationError" class="error-message">Designation
									is required.</div>
							</div>

							<div class="col-md-6 mb-3">
								<label for="status" class="form-label">Status</label> <select
									class="form-select" id="status" name="status" required>
									<option value="">Select Status</option>
									<option value="Active"
										${employee.status == 'Active' ? 'selected' : ''}>Active</option>
									<option value="Inactive"
										${employee.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
								</select>
								<div id="statusError" class="error-message">Status is
									required.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<input type="hidden" class="form-control" id="role" name="role"
									value="${employee.role}" required>
								<div id="roleError" class="error-message">Role is
									required.</div>
							</div>
						</div>

						<button type="submit" class="btn btn-crimson w-100">Save</button>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	     var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co|net|in)$/;
	     var phoneNumberPattern = /^[6-9]\d{9}$/;

	     function validateEmail() {
	            var email = document.getElementById("email").value;
	            var emailError = document.getElementById("emailError");
	            if (email.length < 5 || email.length > 50 || !emailPattern.test(email)) {
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
	        
	        function validateRole() {
	            var role = document.getElementById("role").value;
	            var roleError = document.getElementById("roleError");
	            if (!role) {
	                roleError.style.display = "block";
	            } else {
	                roleError.style.display = "none";
	            }
	        }
	        
	        function validateTeam() {
	            var team = document.getElementById("team").value;
	            var teamError = document.getElementById("teamNameError");
	            if (team.length < 3 || team.length > 20 ||  !/^[A-Za-z\s]+$/.test(team)) {
	            	teamError.style.display = "block";
	            } else {
	            	teamError.style.display = "none";
	            }
	        }
	        
	        function validateAddress(){
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
	        document.getElementById('role').addEventListener('input', validateRole);
	        document.getElementById('team').addEventListener('input', validateTeam);
	        document.getElementById('address').addEventListener('input', validateAddress);

		document.getElementById('updateForm').addEventListener('submit', function (event) {
            validateEmail();
            validatePhoneNumber();
            validateRole();
            validateTeam();
            validateAddress();

			if (document.querySelectorAll('.error-message[style*="block"]').length > 0) {
				event.preventDefault();
			}
		});
	});
	</script>
</body>
</html>

