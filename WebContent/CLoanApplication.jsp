<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.Model.LoanRequest"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applied Loans</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
}

h1 {
	text-decoration: underline;
	color: #003366; /* Dark Blue */
	margin-bottom: 20px;
}

.loan-container {
	max-width: 900px;
	margin: 0 auto;
}

.no-data-message {
	text-align: center;
	color: #777;
	font-size: 20px;
	font-weight: bold;
	margin-top: 50px;
}

.loanContainer {
	background-color: #e4e7ff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.loan-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.loan-grid>div {
	display: flex;
}

.loan-grid h2 {
	font-size: 16px;
	color: #003366;
	margin: 0;
}
.commentDiv h2 {
	font-size: 16px;
	color: #003366;
	margin: 0;
}

.loan-grid p {
	font-size: 16px;
	color: #555;
	margin: 0;
	font-weight: bold;
}
.commentDiv p {
	font-size: 16px;
	color: #555;
	margin: 0;
	font-weight: bold;
}

/* Status-specific styles */
.status-rejected {
	color: red;
}

.status-approved {
	color: green;
}

.header {
	text-align: center;
	color: #003366; /* Dark Blue */
	margin-bottom: 20px;
	text-decoration: none;
}

.commentDiv {
	display: flex;
	margin : 20px 0px;
/*	flex-direction: column;*/
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
	background-color: #0066b2;
}

.hero h1 {
	font-size: 45px;
	font-weight: 600;
	color: white;
	margin: 8px;
}
.hero p {
	font-size: 20px;
	font-weight: 300;
}
.hero h1 {
	text-decoration:none;
}
/* Footer Section */
footer {
	background-color: #0066b2;
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
.marginDiv{
margin : 20px 0px;

}

</style>
</head>
<body>
	<section class="hero">
		<div>
			<h1>Welcome to Aces Bank</h1>
			<p>Your trusted partner for all financial needs.</p>
		</div>
	</section>
	<h1 class="header">Applied Loans</h1>
	<div class="loan-container">
		<%
		request.getAttribute("loanRequests");
		List<LoanRequest> loans = (List<LoanRequest>) session.getAttribute("loanRequests");
		if (loans == null || loans.isEmpty()) {
		%>
		<p class="no-data-message">There are no Loan Applications at the
			moment.</p>
		<%
		} else {
		int applicationCount = 1; // Initialize application counter
		for (LoanRequest loan : loans) {
			String statusClass = "status-rejected";
			if (!"Rejected".equalsIgnoreCase(loan.getLoanStatus())) {
				statusClass = "status-approved";
			}
		%>
		<section class="loanContainer">
			<h1>
				Application:
				<%=applicationCount++%></h1>
			<div class="loan-grid">
				<div>
					<h2>Loan ID:</h2>
					<p><%=loan.getLoanId()%></p>
				</div>
				<div>
					<h2>Customer ID:</h2>
					<p><%=loan.getCid()%></p>
				</div>
				<div>
					<h2>Customer Name:</h2>
					<p><%=loan.getcName()%></p>
				</div>
				<div>
					<h2>Customer Email:</h2>
					<p><%=loan.getEmail()%></p>
				</div>
				<div>
					<h2>Contact Number:</h2>
					<p><%=loan.getContact()%></p>
				</div>
				<div>
					<h2>Loan Amount:</h2>
					<p><%=loan.getLoanAmount()%></p>
				</div>
				<div>
					<h2>Loan Duration:</h2>
					<p><%=loan.getLoanDuration()%></p>
				</div>
				<div>
					<h2>Application Status:</h2>
					<p class="<%=statusClass%>"><%=loan.getLoanStatus()%></p>
				</div>
				<div>
					<h2>Application Date:</h2>
					<p><%=loan.getApplicationDate()%></p>
				</div>
				
			</div>

			<hr class="marginDiv"/> 
			<div class="commentDiv">
					<h2>Manager's Remark:</h2>
					<p><%=loan.getComment()%></p>
				</div>
		</section>
		<%
		}
		}
		%>
	</div>
		<footer>
		<h3>Aces Bank</h3>
		<p>&copy; 2024 Bank Name. All Rights Reserved.</p>
		<p>
			<a href="privacy_policy.jsp">Privacy Policy</a> | <a
				href="terms of service.jsp">Terms of Service</a> | <a
				href="about us.jsp">About Us</a>
		</p>
	</footer>
</body>
</html></html>