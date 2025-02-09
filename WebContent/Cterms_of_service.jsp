<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Terms of Service | Aces Bank</title>
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

p, ul {
	margin-bottom: 15px;
}

ul {
	margin-left: 20px;
}

ul li {
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
		<h1>Terms of Service</h1>
	</header>
	<div class="container">
		<h2>Agreement</h2>
		<p>By accessing and using Aces Bank's services, you agree to
			comply with these Terms of Service. Please read them carefully before
			proceeding.</p>

		<h2>Usage Policy</h2>
		<p>You agree to:</p>
		<ul>
			<li>Provide accurate and truthful information.</li>
			<li>Not engage in fraudulent or illegal activities.</li>
			<li>Maintain the security of your account credentials.</li>
		</ul>

		<h2>Limitation of Liability</h2>
		<p>Aces Bank is not liable for any indirect, incidental, or
			consequential damages arising from the use of our services.</p>

		<h2>Termination</h2>
		<p>We reserve the right to suspend or terminate your account if
			you breach these terms.</p>

		<button onclick="acceptTerms()">Accept Terms</button>
	</div>
	<!-- Footer Section -->
	<footer>
		<h3>Aces Bank</h3>
		<p>&copy; 2024 Aces Bank. All Rights Reserved.</p>
		<p>
			<a href="privacy policy.jsp">Privacy Policy</a> | <a
				href="terms of service.jsp">Terms of Service</a> | <a
				href="about us.jsp">About Us</a>
		</p>
	</footer>
	<script>
		function acceptTerms() {
			alert("Thank you for accepting the Terms of Service.");
		}
	</script>
</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>