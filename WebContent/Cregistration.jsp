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
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<title>Customer Registration</title>

<style>
* {
	font-family: sans-serif;
}

body {
	font-family: Arial, sans-serif;
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

</section>


	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<section class="signup">

			<div class="container">

				<div class="signup-content">

					<div class="signup-form">

						<h2
							style="color: #004b8d; text-decoration: none; margin-top: auto; font-size: 35px;">Customer
							Registration Form</h2>

						<form method="post" action="cregister" class="register-form"
							id="register-form">
							<input type="hidden" name="action" value="cregister" />
							<div class="row">
								<div class="form-group">
									<label for="cname">Customer Name <span
										style="color: red;">*</span></label> <input type="text" name="cname"
										id="cname" placeholder="Enter Customer name" />
								</div>
								<div class="form-group">
									<label for="dob">DOB <span style="color: red;">*</span></label>
									<input type="date" name="dob" id="dob" max="2014-01-01" min ="1900-01-01"
										placeholder="Enter DOB" />
								</div>
							</div>

							<div class="form-group">
								<label for="accountBalance">Account Balance <span
									style="color: red;">*</span></label> <input type="number"
									name="accountBalance" id="accountBalance"
									placeholder="Enter Account Balance" />
							</div>

							<div class="row">
								<div class="form-group">
									<label for="gender">Gender <span style="color: red;">*</span></label>
									<select name="gender" id="gender">
										<option value="" disabled selected>Select Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>
									</select>
								</div>
								<div class="form-group">
									<label for="city">City<span style="color: red;">*</span></label>
									<select name="city" id="city">
										<option value="" disabled selected>Select City</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Pune">Pune</option>
										<option value="Chennai">Chennai</option>
										<option value="Bengalaru">Bengalaru</option>
										<option value="Hyderabad">Hyderabad</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="atype">Account Type<span style="color: red;">*</span></label>
								<select name="atype" id="atype">
									<option value="" disabled selected>Select Account Type</option>
									<option value="Current">Current</option>
									<option value="Savings">Savings</option>
								</select>
							</div>


							<div class="form-group form-button">
								<button type="submit" name="signup" id="signup"
									onclick="validateRegistrationForm()" class="form-submit">Register</button>
							</div>

						</form>
					</div>
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

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
function validateRegistrationForm(formId) {

    const form = document.getElementById(formId);

    // Fetch form input values
    const cname = document.getElementById("cname").value.trim();
    const dob = document.getElementById("dob").value.trim();
    const accountBalance = document.getElementById("accountBalance").value.trim();
    const gender = document.getElementById("gender").value;
    const city = document.getElementById("city").value;
    const atype = document.getElementById("atype").value;

    // Validation regex patterns
    const nameRegex = /^[a-zA-Z\s]+$/; // Only letters and spaces
    const balanceRegex = /^\d+(\.\d{1,2})?$/; // Valid number with up to 2 decimals

    // Check if fields are empty
    if (!cname || !dob || !accountBalance || !gender || !city || !atype) {
    	event.preventDefault(); // Prevent submission

        swal("Invalid Input", "All fields are required.", "error");
        return;
    }

    // Validate customer name
    if (!nameRegex.test(cname)) {
    	event.preventDefault(); // Prevent submission

        swal("Invalid Input", "Customer name must only contain letters and spaces.", "error");
        return;
    }

    // Validate date of birth
    const maxDate = new Date("2014-01-01");
    const minDate = new Date("1904-01-01");
    const dobDate = new Date(dob);
    
    if (dobDate <= minDate) {
    	event.preventDefault(); // Prevent submission
        swal("Invalid DOB", "Date of Birth over 120 years.", "error");
        return;
    }
    
    
    if (dobDate >= maxDate) {
    	event.preventDefault(); // Prevent submission
        swal("Invalid DOB", "Date of Birth must indicate age 10 or older.", "error");
        return;
    }

    // Validate account balance
    if (!balanceRegex.test(accountBalance) || parseFloat(accountBalance) < 2000) {
    	event.preventDefault(); // Prevent submission

        swal("Invalid Input", "Account Balance must be a valid number greater than 2000.", "error");
        return;
    }
    event.preventDefault(); // Prevent submission


    // Show success message and submit the form
    swal("Success", "Customer registered successfully!", "success").then(() => {
    	document.getElementById("register-form").submit(); // Submit the form after showing success message
    });
}
</script>



</body>

</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>