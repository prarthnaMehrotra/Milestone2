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
	height: 115vh;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	overflow: auto;
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
	max-width: 600px;
	margin: 0 auto;
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
			<!-- Add Employee Form -->
			<div class="card form-container">
				<div class="card-header text-center">
					<h4 class="card-title">Add Employee</h4>
				</div>
				<div class="card-body">
					<form
						action="${pageContext.request.contextPath}/employee/addemployee"
						method="post" id="registerForm">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="firstName" class="form-label">First Name</label> <input
									type="text" class="form-control" id="firstName"
									name="firstName" required pattern="[A-Za-z]+" minlength="3"
									maxlength="50">
								<div id="firstNameError" class="error-message">First Name
									should be 3-50 characters long and contain only letters.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName" class="form-label">Last Name</label> <input
									type="text" class="form-control" id="lastName" name="lastName"
									required pattern="[A-Za-z]+">
								<div id="lastNameError" class="error-message">Last Name
									should be 1-50 characters long and contain only letters.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username"
									required minlength="5" maxlength="20" pattern="[A-Za-z0-9]+">
								<div id="usernameError" class="error-message">Username
									should be 5-20 characters long and contain only letters and
									numbers.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" required minlength="8" maxlength="20">
								<div id="passwordError" class="error-message">Password
									should be 8-20 characters long, include at least one uppercase
									letter, one lowercase letter, one number, and one special
									character.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="text" class="form-control" id="email" name="email"
									required>
								<div id="emailError" class="error-message">Enter a valid
									email address.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="phoneNumber" class="form-label">Phone Number</label>
								<input type="text" class="form-control" id="phoneNumber"
									name="phoneNumber" required pattern="[6-9][0-9]{9}">
								<div id="phoneNumberError" class="error-message">Phone
									number should start with 6-9 and contain exactly 10 digits.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="dob" class="form-label">Date of Birth</label> <input
									type="date" class="form-control" id="dob" name="dateOfBirth"
									required onchange="calculateAge()">
								<div id="dobError" class="error-message">Date of Birth is
									required and must be a valid date.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" id="age" name="age" readonly>
								<div id="ageError" class="error-message">Age must be
									between 18 and 60.</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address" name="address"
									required minlength="10" maxlength="100">
								<div id="addressError" class="error-message">Address
									should be 10-100 characters long.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="team" class="form-label">Team</label> <input
									type="text" class="form-control" id="team" name="team" required
									minlength="3" maxlength="20">
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
								<label for="role" class="form-label">Role</label> <select
									class="form-select" id="role" name="role" required>
									<option value="" disabled selected>Select Role</option>
									<option value="Employee">Employee</option>
									<option value="HR Admin">HR Admin</option>
									<option value="HR Manager">HR Manager</option>
								</select>
								<div id="roleError" class="error-message">Role is
									required.</div>
							</div>
						</div>

						<button type="submit" class="btn btn-crimson w-100">Add
							Employee</button>
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
        var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&*()_+!~`|{}:;"'<>,.?/\\-]).{8,20}$/;
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co|net|in)$/;
        var phoneNumberPattern = /^[6-9]\d{9}$/;

        function validateUsername() {
            var username = document.getElementById("username").value;
            var usernameError = document.getElementById("usernameError");
            if (username.length < 5 || username.length > 20 || !/^[A-Za-z0-9]+$/.test(username)) {
                usernameError.style.display = "block";
            } else {
                usernameError.style.display = "none";
            }
        }

        function validatePassword() {
            var password = document.getElementById("password").value;
            var passwordError = document.getElementById("passwordError");
            if (!passwordPattern.test(password)) {
                passwordError.style.display = "block";
            } else {
                passwordError.style.display = "none";
            }
        }

        function validateFirstName() {
            var firstName = document.getElementById("firstName").value;
            var firstNameError = document.getElementById("firstNameError");
            if (firstName.length < 3 || firstName.length > 50 || !/^[A-Za-z]+$/.test(firstName)) {
                firstNameError.style.display = "block";
            } else {
                firstNameError.style.display = "none";
            }
        }

        function validateLastName() {
            var lastName = document.getElementById("lastName").value;
            var lastNameError = document.getElementById("lastNameError");
            if (lastName.length < 1 || lastName.length > 50 || !/^[A-Za-z]+$/.test(lastName)) {
                lastNameError.style.display = "block";
            } else {
                lastNameError.style.display = "none";
            }
        }
        
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

        function validateDOB() {
            var dob = document.getElementById("dob").value;
            var dobError = document.getElementById("dobError");
            if (!dob) {
                dobError.style.display = "block";
            } else {
                dobError.style.display = "none";
            }
        }
        
        function validateAge(){
            var age = document.getElementById("age").value;
            var ageError = document.getElementById("ageError");

            if (!age) {
                ageError.innerHTML = "Age is required";
                ageError.style.display = "block";
            } else if (age < 18 || age > 60) {
                ageError.style.display = "block";
            } else {
                ageError.style.display = "none";
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
        
        function calculateAge() {
            const dob = document.getElementById('dob').value;
            if (dob) {
                const birthDate = new Date(dob);
                const today = new Date();
                let age = today.getFullYear() - birthDate.getFullYear();
                const monthDiff = today.getMonth() - birthDate.getMonth();

                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }

                document.getElementById('age').value = age;
            }
        }

        document.getElementById('dob').addEventListener('input', function() {
            calculateAge(); 
            validateAge();   
        });

        document.getElementById('username').addEventListener('input', validateUsername);
        document.getElementById('password').addEventListener('input', validatePassword);
        document.getElementById('firstName').addEventListener('input', validateFirstName);
        document.getElementById('lastName').addEventListener('input', validateLastName);
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('phoneNumber').addEventListener('input', validatePhoneNumber);
        document.getElementById('dob').addEventListener('input', validateDOB);
        document.getElementById('age').addEventListener('input', validateAge);
        document.getElementById('role').addEventListener('input', validateRole);
        document.getElementById('team').addEventListener('input', validateTeam);
        document.getElementById('address').addEventListener('input', validateAddress);

        document.getElementById('registerForm').addEventListener('submit', function(event) {
            validateUsername();
            validatePassword();
            validateFirstName();
            validateLastName();
            validateEmail();
            validatePhoneNumber();
            validateDOB();
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
