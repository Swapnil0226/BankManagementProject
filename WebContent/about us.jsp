<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("name") != null) {
		String i = (String) session.getAttribute("name");
		System.out.println("htll" + i);
	
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us | Aces Bank</title>
<style>
* {
	font-family: sans-serif;
}

body {
	font-family: "Poppins", sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	color: #333;
}

header {
	color: #004b8d;
	padding: 15px 20px;
	text-align: center;
}

header h1 {
	margin: 0;
	font-size: 35px;
}

.container {
	max-width: 900px;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #004b8d;
	margin-bottom: 10px;
}

p {
	margin-bottom: 15px;
}

.team-list {
	margin: 10px 0 20px 0;
}

.team-member {
	margin-bottom: 10px;
}

button {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	border: none;
	background-color: #0066b2;
	color: white;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

button:hover {
	background-color: #005A9C;
}
/* Footer Section */
footer {
	background-color: #0066b2; /* Dark Blue */
	color: white;
	padding: 10px 10px;
	text-align: center;
}

footer h3 {
	padding: 5px;
	font-size: 24px;
}

footer p {
	margin-bottom: 10px;
	font-size: 16px;
}

footer a {
	color: #f4f7fc;
	text-decoration: none;
	font-weight: bold;
	margin: 0 10px;
}

footer a:hover {
	text-decoration: underline;
}

/* Hero Section */
.hero {
	position: relative;
	height: 150px;
	background-size: cover;
	background-position: center;
	color: white;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #0066b2; /* Deep Blue */
}

.hero h1 {
	font-size: 40px;
	font-weight: 600;
	color: white;
	margin: 8px;
}

.hero p {
	font-size: 20px;
	font-weight: 300;
}
</style>
</head>
<body>
	<!-- Hero Section -->
	<section class="hero">
		<div>
			<h1>Welcome to Aces Bank</h1>
			<p>Your trusted partner for all financial needs.</p>
		</div>
	</section>


	<header>
		<h1>About Us</h1>
	</header>
	<div class="container">
		<h2>Welcome to Aces Bank</h2>
		<p>At Aces Bank, we are dedicated to providing innovative and
			reliable financial solutions. Our mission is to empower individuals
			and businesses with the tools they need to achieve financial success.
		</p>

		<h2>Our Vision</h2>
		<p>To be a leader in the banking industry, delivering superior
			customer service and fostering economic growth in the communities we
			serve.</p>

		<h2>Our Team</h2>
		<div class="team-list">
			<p class="team-member">
				<strong>John Doe</strong> - CEO
			</p>
			<p class="team-member">
				<strong>Jane Smith</strong> - CFO
			</p>
			<p class="team-member">
				<strong>Emily White</strong> - Head of Customer Service
			</p>
		</div>

		<button onclick="readMore()">Read More About Us</button>
	</div>
	<!-- Footer Section -->
	<footer>
		<h3>Aces Bank</h3>
		<p>&copy; 2024 Aces Bank. All Rights Reserved.</p>
		<p>
			<a href="privacy_policy.jsp">Privacy Policy</a> | <a
				href="terms of service.jsp">Terms of Service</a> | <a
				href="about us.jsp">About Us</a>
		</p>
	</footer>
	<script>
		function readMore() {
			alert("More information about Aces Bank will be available soon!");
		}
	</script>
</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>