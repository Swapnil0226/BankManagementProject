<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		String cname = (String) session.getAttribute("custName");

		System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Aces Bank</title>

<style>
/* General Styles */
* {
	font-family: sans-serif;
}

body {
	font-family: "Arial", sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f7fc;
}

h1, h2 {
	color: #003366; /* Dark Blue */
	text-align: center;
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

/* Card Section */
.cards-section {
	margin: 20px 15px;
	background-color: #e4e7ff; /* White background */
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
}

.cards-section h2 {
	font-size: 35px;
	color: #003366;
}

.cards-container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 20px;
}

.card {
	background-color: white; /* White Background */
	width: 300px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	position: relative;
}

.card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 15px;
}

.card-content {
	padding: 20px;
	text-align: center;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.card h3 {
	font-size: 20px;
	color: #004b8d; /* Deep Blue */
	margin: 10px 0;
}

.card p {
	color: #555;
	font-size: 16px;
}

/* About Us Section */
.about-us {
	background-color: #e4e7ff;
	padding: 20px 10px;
	text-align: center;
	margin: 20px 15px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.about-us h2 {
	font-size: 32px;
	color: #003366; /* Dark Blue */
	margin: 10px;
	padding: 10px;
}

.about-us p {
	font-size: 18px;
	color: #777;
	line-height: 1.6;
	max-width: 800px;
	margin: 0 auto;
}

/* Contact Info Section */
.contact-info {
	background-color: #e4e7ff;
	padding: 15px 8px;
	text-align: center;
	margin: 20px 15px;
	border-radius: 10px;
}

.contact-info h2 {
	font-size: 32px;
	color: #003366;
	margin-bottom: 20px;
}

.contact-info p {
	font-size: 18px;
	color: #555;
	line-height: 1.6;
}

/* Services Section */
.services-section {
	padding: 40px 20px;
	text-align: center;
	margin: 50px 0;
}

.services-section h2 {
	font-size: 32px;
	color: #003366; /* Dark Blue */
	margin-bottom: 40px;
}

.services-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	gap: 20px;
}

.service-card {
	background-color: #ffffff; /* White Background */
	width: 250px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	text-align: center;
}

.service-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.service-card h3 {
	font-size: 20px;
	color: #004b8d; /* Deep Blue */
	margin-bottom: 15px;
}

.service-card p {
	color: #777;
	font-size: 16px;
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

/* Responsive Styles */
@media ( max-width : 768px) {
	.hero h1 {
		font-size: 36px;
	}
	.hero p {
		font-size: 18px;
	}
	.card {
		width: 100%;
	}
	.services-container {
		flex-direction: column;
		align-items: center;
	}
}
</style>
</head>

<body>
	<!-- Hero Section -->
	<section class="hero">
		<div>
			<h1>
				Welcome
				<%=cname%>
				to Aces Bank
			</h1>
			<p>Your trusted partner for all financial needs.</p>
		</div>
	</section>

	<!-- Card Section -->
	<section class="cards-section">
		<h2>Our Services</h2>
		<div class="cards-container">
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/home loan.png"
					alt="Home Loan" />
				<div class="card-content">
					<h3>Home Loan</h3>
					<p>Low interest rates for new home buyers.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/personal loan.PNG"
					alt="Personal Loan" />
				<div class="card-content">
					<h3>Personal Loan</h3>
					<p>Quick and easy loan process for any purpose.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/savings account.PNG"
					alt="Savings Account" />
				<div class="card-content">
					<h3>Savings Account</h3>
					<p>Save with interest and enjoy benefits.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/business loan.PNG"
					alt="Business Loan" />
				<div class="card-content">
					<h3>Business Loan</h3>
					<p>Grow your business with our tailored loans.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/credit cards.PNG"
					alt="Credit Cards" />
				<div class="card-content">
					<h3>Credit Cards</h3>
					<p>Exclusive offers and rewards for our cardholders.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/fixed deposit.PNG"
					alt="Fixed Deposit" />
				<div class="card-content">
					<h3>Fixed Deposit</h3>
					<p>Secure your future with high-interest rates.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/investment plans.PNG"
					alt="Investment Plans" />
				<div class="card-content">
					<h3>Investment Plans</h3>
					<p>Invest in the best opportunities for your future.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/insurance.PNG"
					alt="Insurance" />
				<div class="card-content">
					<h3>Insurance</h3>
					<p>Comprehensive insurance for your family and assets.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/credit score.PNG"
					alt="Credit Score Check" />
				<div class="card-content">
					<h3>Credit Score Check</h3>
					<p>Check your credit score for free.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/atm services.PNG"
					alt="ATM Services" />
				<div class="card-content">
					<h3>ATM Services</h3>
					<p>Free ATM withdrawals at our locations.</p>
				</div>
			</div>
			<div class="card">
				<img src="/Bank_Management_System_Grp23/images/online payment.PNG"
					alt="Online Banking" />
				<div class="card-content">
					<h3>Online Banking</h3>
					<p>Access your account anytime, anywhere.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- About Us Section -->
	<section class="about-us">
		<h2>About Us</h2>
		<p>We are a trusted bank committed to providing the best financial
			services to individuals and businesses alike. With a strong presence
			across the country, we focus on customer satisfaction and offering
			customized solutions to meet your needs.</p>
	</section>

	<!-- Contact Info Section -->
	<section class="contact-info">
		<h2>Contact Us</h2>
		<p>If you have any questions or need assistance, feel free to
			reach out to us:</p>
		<p>Email: support@ourbank.com</p>
		<p>Phone: +1 (123) 456-7890</p>
	</section>

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
</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>