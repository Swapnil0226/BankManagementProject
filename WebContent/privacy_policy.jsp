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
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Privacy Policy | Aces Bank</title>
<style>
/* General Styling */
* {
	font-family: sans-serif;
}

body {
	font-family: "Poppins", sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	color: #333;
	line-height: 1.6;
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

ul {
	margin: 10px 0 20px 20px;
}

ul li {
	margin-bottom: 10px;
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
		<h1>Privacy Policy</h1>
	</header>
	<div class="container">
		<h2>Introduction</h2>
		<p>Welcome to Aces Bank! Protecting your personal information is
			our top priority. This Privacy Policy outlines how we collect, use,
			and protect your data.</p>

		<h2>Information We Collect</h2>
		<p>We may collect the following information:</p>
		<ul>
			<li>Personal Identification Details (Name, Address, etc.)</li>
			<li>Transaction and Account Details</li>
			<li>Browser and Device Information</li>
		</ul>

		<h2>How We Use Your Information</h2>
		<p>Your information is used to:</p>
		<ul>
			<li>Provide banking services</li>
			<li>Process transactions</li>
			<li>Ensure account security</li>
			<li>Comply with legal obligations</li>
		</ul>

		<h2>Data Protection</h2>
		<p>We implement robust security measures to protect your data,
			including:</p>
		<ul>
			<li>Encryption of sensitive information</li>
			<li>Regular security audits</li>
			<li>Access controls and authentication protocols</li>
		</ul>

		<h2>Your Rights</h2>
		<p>You have the right to:</p>
		<ul>
			<li>Access your data</li>
			<li>Request corrections to your data</li>
			<li>Request data deletion under specific circumstances</li>
		</ul>

		<h2>Contact Us</h2>
		<p>If you have any questions about this Privacy Policy, feel free
			to contact us at:</p>
		<p>Email: support@AcesBank.com</p>
		<p>Phone: +1 (800) 123-4567</p>

		<button onclick="acknowledgePolicy()">Acknowledge</button>
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
		function acknowledgePolicy() {
			alert("Thank you for acknowledging our Privacy Policy!");
		}
	</script>
</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>