<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrimsonLogic - Office Seat Allotment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
body {
	color: #fff;
}

.navbar {
	background-color: crimson;
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
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

.hero-section {
	background-image: url('../resources/images/office1.jpeg');
	background-size: cover;
	background-repeat: no-repeat;
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

.btn-crimson {
	background-color: crimson;
	color: white;
	font-size: 1rem;
	padding: 0.75rem 1.25rem;
	border-radius: 4px;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.btn-crimson:hover {
	background-color: darkred;
	color: white;
}

.section {
	padding: 60px 20px;
}

.section h2 {
	color: crimson;
	margin-bottom: 20px;
}

.section p {
	color: #333;
}

.testimonial-carousel {
	background-color: #f7f2f2;
	padding: 40px 0;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.carousel-caption {
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	padding: 20px;
	border-radius: 10px;
	text-align: left;
	display: flex;
	align-items: center;
	transition: transform 0.3s ease;
	height: 200px;
}

.carousel-caption:hover {
	transform: scale(1.05);
}

.carousel-caption h6, .carousel-caption p {
	color: black !important;
	margin: 5px;
}

.carousel-caption img {
	border-radius: 50%;
	width: 100px;
	height: 100px;
	margin-right: 20px;
}

.carousel-caption div {
	max-width: 500px;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: crimson;
	border-radius: 50%;
	padding: 10px;
}

.carousel-indicators .active {
	background-color: crimson;
}

.footer {
	background-color: crimson;
	padding: 20px;
	color: white;
	text-align: center;
}

.social-icons a {
    color: white;
    font-size: 20px; /* Adjust size as needed */
    text-decoration: none;
}

.social-icons a:hover {
    color: #f1c40f; /* Optional: Change color on hover (e.g., to gold) */
}

</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
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
					<li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/employee/login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section id="home" class="hero-section">
		<div class="container">
			<h1>Welcome to WorkWise!</h1>
			<p>Effortless seat allotment for the workplace.</p>
			<a href="${pageContext.request.contextPath}/employee/login"
				class="btn btn-crimson">Login</a>
		</div>
	</section>

	<!-- Testimonials Section -->
	<section id="testimonials"
		class="testimonial-carousel section text-dark">
		<div class="container">
			<h2 class="text-center mb-5">What Our Employees Say</h2>
			<div id="testimonialCarousal" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="d-flex justify-content-center align-items-center"
							style="height: 200px;">
							<div class="carousel-caption d-none d-md-flex">
								<img
									src="${pageContext.request.contextPath}/resources/images/profile1.jpg"
									alt="img1">
								<div>
									<p>Working with WorkWise Technologies has been a
										game-changer for us. Their global perspective and cutting-edge
										technology have elevated our business to new heights.</p>
									<h6>~ Juliana Ray</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="d-flex justify-content-center align-items-center"
							style="height: 200px;">
							<div class="carousel-caption d-none d-md-flex">
								<img
									src="${pageContext.request.contextPath}/resources/images/profile2.jpg"
									alt="img2">
								<div>
									<p>The team at WorkWise Technologies is phenomenal! Their
										solutions are not only effective but also incredibly easy to
										implement. Highly recommend!</p>
									<h6>~ Jane Miles</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="d-flex justify-content-center align-items-center"
							style="height: 200px;">
							<div class="carousel-caption d-none d-md-flex">
								<img
									src="${pageContext.request.contextPath}/resources/images/profile3.jpg"
									alt="img3">
								<div>
									<p>WorkWise Technologies has revolutionized our business
										processes with their innovative solutions. Their commitment to
										technology and efficiency has made a significant impact on our
										operations.</p>
									<h6>~ John Doe</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#testimonialCarousal" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#testimonialCarousal" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>

	<!-- Footer (About Section) -->
	<footer id="about" class="footer">
		<div class="container">
			<h4>About WorkWise</h4>
			<p>WorkWise is a leading provider of innovative technology
				solutions designed to streamline and enhance global trade. Our
				cutting-edge tools and services are crafted to meet the evolving
				needs of businesses and governments worldwide. At WorkWise, we are
				dedicated to transforming the way organizations operate, making
				global trade more efficient and effective through our advanced
				technology solutions.</p>
		</div>

		<!-- Social Media Icons -->
		<div class="social-icons mt-3">
			<a href="https://www.facebook.com/WorkWise" target="_blank"
				class="me-3"> <i class="fab fa-facebook-f"></i>
			</a> <a href="https://www.twitter.com/WorkWise" target="_blank"
				class="me-3"> <i class="fab fa-twitter"></i>
			</a> <a href="https://www.linkedin.com/company/WorkWise" target="_blank"
				class="me-3"> <i class="fab fa-linkedin-in"></i>
			</a> <a href="https://www.instagram.com/WorkWise" target="_blank"
				class="me-3"> <i class="fab fa-instagram"></i>
			</a>
		</div>

		<div class="mt-3">
			<p>© 2024 WorkWise India Pvt. Ltd. All rights reserved.</p>
		</div>
	</footer>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
