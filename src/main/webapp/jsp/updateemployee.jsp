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
<title>Update Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	color: #333;
	font-family: 'Arial', sans-serif;
}

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
	height: 100vh;
	display: flex;
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

.table-container {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease-in-out;
	height: 90vh;
	overflow: auto;
}

.table-container:hover {
	box-shadow: 0 6px 30px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px);
}

.table thead {
	background-color: #e27b7b !important;
	color: white !important;
	border: black !important;
}

.table tbody tr:nth-child(odd) {
	background-color: #f0f4f8 !important;
}

.table tbody tr:nth-child(even) {
	background-color: #e6eef3 !important;
}

.table tbody tr:hover {
	background-color: #d6e4ec !important;
	transform: scale(1.02);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	transition: background-color 0.2s, transform 0.2s;
	cursor: pointer;
}

.table tbody tr td {
	vertical-align: middle;
}

.table .status-active {
	color: green;
	font-weight: bold;
}

.table .status-inactive {
	color: red;
	font-weight: bold;
}

.btn-crimson {
	background-color: crimson;
	color: white;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
}

.container {
	margin-top: 2rem;
}

h2, h5 {
	font-weight: bold;
	color: crimson;
}

.search-bar {
	width: 250px;
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	height: 31px;
}

.filter-select {
	width: 200px;
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	height: 31px;
}

.form-label {
	font-weight: bold;
}

.modal-header {
	background: transparent;
	border: none;
}

.alert-success {
	position: absolute;
	top: 4.7%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #d4edda;
	color: #155724;
	padding: 15px 30px;
	border-radius: 5px;
	max-width: 80%;
	width: 390px;
	z-index: 3;
	text-align: center;
}

.alert-danger {
	position: absolute;
	top: 4.7%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #f8d7da;
	color: #721c24;
	border-color: #f5c6cb;
	border-radius: 5px;
	padding: 15px 30px;
	max-width: 80%;
	width: 390px;
	z-index: 3;
	top: 4.7%;
	left: 50%;
	transform: translate(-50%, -50%);
	left: 50%;
	transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	text-align: center;
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

	<!-- Employee Table Section -->
	<section id="employees" class="hero-section">
		<div class="container">
			<div class="table-container">
				<h2 class="text-center mb-4">Employee Details List</h2>

				<!-- Search and Filter Section -->
				<div class="row mb-3">

					<!-- Search Bar (smaller) -->
					<div class="col-md-6 text-start">
						<label for="nameSearch" class="me-2">Search:</label> <input
							type="text" id="nameSearch" class="search-bar"
							placeholder="First Name">
					</div>

					<!-- Filter by Role (right) -->
					<div class="col-md-6 text-end">
						<label for="roleFilter" class="me-2">Filter by Role:</label> <select
							id="roleFilter" class="filter-select">
							<option value="all">All</option>
							<option value="HR Admin">HR Admin</option>
							<option value="HR Manager">HR Manager</option>
							<option value="Employee">Employee</option>
						</select>
					</div>
				</div>

				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>Employee ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Role</th>
							<th>Team</th>
							<th>Designation</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody id="employeeTableBody">
						<c:forEach items="${employees}" var="employee">
							<tr data-role="${employee.role}" data-id="${employee.employeeId}">
								<td>${employee.employeeId}</td>
								<td>${employee.firstName}</td>
								<td>${employee.lastName}</td>
								<td>${employee.role}</td>
								<td>${employee.team}</td>
								<td>${employee.designation}</td>
								<td
									class="<c:choose>
                                    <c:when test="${employee.status == 'Active'}">status-active</c:when>
                                    <c:otherwise>status-inactive</c:otherwise>
                                </c:choose>">${employee.status}</td>
								<td>
									<button class="btn btn-sm update-btn btn-crimson"
										onclick="confirmAction('Update', '${employee.employeeId}')">Update</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- Custom Confirm Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1"
		aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmModalLabel">Confirm Action</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="confirmMessage"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-crimson" id="confirmBtn">Yes</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		document.getElementById('nameSearch').addEventListener('input', function () {
		    const searchQuery = this.value.toLowerCase();
		    const rows = document.querySelectorAll('#employeeTableBody tr');
	
		    rows.forEach(row => {
		        const firstName = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
		        if (firstName.startsWith(searchQuery) || searchQuery === '') {
		            row.style.display = '';
		        } else {
		            row.style.display = 'none';
		        }
		    });
		});
		
        document.getElementById('roleFilter').addEventListener('change', function() {
            const selectedRole = this.value;
            const rows = document.querySelectorAll('#employeeTableBody tr');

            rows.forEach(row => {
                const role = row.getAttribute('data-role');
                if (selectedRole === 'all' || role === selectedRole) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
        
        function confirmAction(action, employeeId, firstName) {
		    var message = "Are you sure you want to update this employee's details?";

		    document.getElementById('confirmMessage').textContent = message;

		    var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
		    confirmModal.show();

		    document.getElementById('confirmBtn').onclick = function () {
		    	var baseUrl = '<c:url value="/employee/"/>'; // Base URL
                var actionUrl = action === 'Update' ? baseUrl + 'updateemployeedetail' : baseUrl + '';
                window.location.href = actionUrl + '?employeeId=' + employeeId;
		    };
		}
    </script>
</body>
</html>
