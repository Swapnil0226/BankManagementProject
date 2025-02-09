<%@page import="com.Model.Customer"%>
<%@page import="java.util.List"%>

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
<title>Customer Details</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: cyan;
	background: #e4e7ff;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1000px;
	margin: 9% auto;
	background: #fff;
	padding: 20px;
	border-radius: 25px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}

h1, h2 {
	text-align: center;
	color: #004b8d;
	text-decoration: none;
	margin-top: auto;
	font-size: 35px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input, button {
	width: 95%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#search {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
}

#search:hover {
	background-color: #0056b3;
}

table {
	width: 100%;
	border-width: 10%;
	margin-top: 20px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #333;
	background-color: #fff;
	border-radius: 10px;
	overflow: hidden;
}

th, td {
	border: none;
	padding: 12px 15px;
	text-align: center;
}

th {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 0.03em;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:nth-child(odd) {
	background-color: #eef6fd;
}

tr:hover {
	background-color: #d6ebff;
	transition: background-color 0.3s ease;
}

td {
	border-bottom: 1px solid #ddd;
}

thead {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

tbody tr:last-child td {
	border-bottom: none;
}

.back-button-container {
	position: absolute;
	top: 20px;
	left: 20px;
}

#back-button {
	display: inline-block;
	text-decoration: none;
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

#back-button:hover {
	background-color: #0056b3;
}

.no-data-message {
	text-align: center;
	font-size: 18px;
	color: #ff0000;
	margin-top: 20px;
}

.button {
	color: blue;
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
s
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


	<%
		if (session.getAttribute("customers") != null) {
				List<Customer> customers = (List<Customer>) session.getAttribute("customers");
				if (customers.isEmpty()) {
	%>
	<div class="container">
		<!-- <h1>No Customer Data Available</h1>-->
		<p class="no-data-message">There are no customer records to
			display at the moment.</p>
	</div>
	<%
		} else {
	%>
	<div class="container">
		<h1>Customer Details</h1>

		<!-- <div class="back-button-container">
			<a href="Cregistration.jsp" id="back-button"><i
				class="fas fa-arrow-left"></i></a>
		</div>-->

		<div style="text-align: center; margin: 10px 0;">
			<input type="text" id="search-bar"
				placeholder="Search here..." onkeyup="filterTable()"
				style="width: 95%; font-size: 14px; border: 1px solid #ccc; border-radius: 5px;">
		</div>

		<div id="result">
			<table id="customer-table">
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Customer Name</th>
						<th>Age</th>
						<th>Account Number</th>
						<th>Account Balance</th>
						<th>Gender</th>
						<th>City</th>
						<th>Account Type</th>
						<th>Action</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Customer customer : customers) {
					%>
					<tr>
						<td><%=customer.getCid()%></td>
						<td><%=customer.getCname()%></td>
						<td><%=customer.getAge()%></td>
						<td><%=customer.getAccNumber()%></td>
						<td><%=customer.getAccountBalance()%></td>
						<td><%=customer.getGender()%></td>
						<td><%=customer.getCity()%></td>
						<td><%=customer.getAtype()%></td>
						<td><a class="button"
							href="/Bank_Management_System_Grp23/cupdate?action=update&id=<%=customer.getCid()%>"
							style=" background-color:#0066b2 ; /* Green */
  border: none;
  color: white;
  padding: 8px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  border-radius: 5px;">Update</a></td>
  						<td><a class="button"
							href="/Bank_Management_System_Grp23/cdelete?action=delete&id=<%=customer.getCid()%>"
							style=" background-color:#0066b2 ; /* Green */
  border: none;
  color: white;
  padding: 8px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  border-radius: 5px;">Delete</a></td>
					</tr>
					<%
						}
								}
							} else {
								response.sendRedirect("cregister");
							}
					%>
				</tbody>
			</table>
		</div>
	</div>

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
		document.addEventListener("DOMContentLoaded", function() {
			
			function filterTable() {

				const input = document.getElementById("search-bar");
				const filter = input.value.toUpperCase();
				const table = document.getElementById("customer-table");
				const rows = table.getElementsByTagName("tr");

				for (let i = 1; i < rows.length; i++) {
	                let row = rows[i];
	                let cells = row.getElementsByTagName("td");
	                let rowMatch = false;

	                // Check all cells in the row
	                for (let j = 0; j < cells.length; j++) {
	                    let cell = cells[j];
	                    if (cell) {
	                        let txtValue = cell.textContent || cell.innerText;
	                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                            rowMatch = true;
	                            break;
	                        }
	                    }
	                }

	                // Show or hide the row based on match
	                row.style.display = rowMatch ? "" : "none";
	            }
	        }

			const searchBar = document.getElementById("search-bar");
			if (searchBar) {
				searchBar.addEventListener("keyup", filterTable);
			}

		});
	</script>

</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>