<%@ page import="com.Dao.CustomerDAO, com.Model.Customer"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<%
	if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		System.out.println("htll" + i);
%>

<head>

<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<title>Customer Details</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: cyan;
	background: #e4e7ff;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 8% auto;
	background: #fff;
	padding: 20px;
	border-radius: 25px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}

h1, h2 {
	text-align: center;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input, select, textarea, button {
	width: 95%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	resize: none;
}

#signup {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
	margin: 10px;
}

#signup:hover {
	background-color: #0056b3;
}

.success {
	color: green;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
}

.row {
	display: flex;
	gap: 15px;
}

.row .form-group {
	flex: 1;
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
	font-size: 45px;
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


	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">
		<section class="">
			<div class="container">
				<div class="">
					<h2 style="color: #004b8d; margin-top: auto; font-size: 35px;">Customer Details</h2>


					<%
						Customer customer = null;

							try {
								int cid = i;
								CustomerDAO dao = new CustomerDAO();

								List<Customer> customers = dao.get();
								for (Customer c : customers) {
									if (c.getCid() == cid) {
										customer = c;
										break;
									}
								}
							} catch (Exception e) {
								System.out.println(e.getMessage());
							}
					%>

					<%
						if (customer != null) {
					%>

					<p>
						<b>Customer ID:</b>
						<%=customer.getCid()%></p>
					<p>
						<b>Customer Name:</b>
						<%=customer.getCname()%></p>
					<p>
						<b>Age:</b>
						<%=customer.getAge()%></p>
					<p>
						<b>Balance:</b>
						<%=customer.getAccountBalance()%></p>
					<p>
						<b>Gender:</b>
						<%=customer.getGender()%></p>

					<p>
						<b>City:</b>
						<%=customer.getCity()%></p>

					<p>
						<b>Account Type:</b>
						<%=customer.getAtype()%></p>

					<p>
						<b>Account Number:</b>
						<%=customer.getAccNumber()%></p>


					<input type="hidden" name="cid" value="<%=customer.getCid()%>">


					<%
						}
					%>
				</div>
			</div>
		</section>
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
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>