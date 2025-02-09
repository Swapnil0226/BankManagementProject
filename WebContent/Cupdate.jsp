<%@ page import="com.Dao.CustomerDAO, com.Model.Customer"%>
<%@ page import="java.util.List"%>

<%
	if (session.getAttribute("customer") != null) {
		Customer customer = (Customer) session.getAttribute("customer");
		String id = request.getParameter("id");
		System.out.println(id);
		System.out.println(customer);
%>
<%
	if (session.getAttribute("name") != null) {
			String i = (String) session.getAttribute("name");
			System.out.println("htll" + i);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<title>Customer Update</title>

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

#update {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
	margin: 10px;
}

#update:hover {
	background-color: #0056b3;
}

.response-message {
	margin-top: 20px;
	font-weight: bold;
	text-align: center;
}

.success {
	color: green;
}

.error {
	color: red;
}

.readonly {
	background-color: #f4f4f4;
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

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<section class="signup">

			<div class="container">

				<div class="signup-content">

					<div class="signup-form">

						<h2
							style="color: blue; text-decoration: underline; margin-top: auto;">Edit
							Customer Information</h2>
						<form method="post" action="cupdate" class="register-form"
							id="register-form">
							<input type="hidden" name="action" value="cupdate" /> <input
								type="hidden" name="cid" value="<%=customer.getCid()%>" />
							<div class="row">
								<div class="form-group">
									<label for="cname">Customer Name <span
										style="color: red;">*</span></label> <input type="text" name="cname"
										value="<%=customer.getCname()%>" id="cname" required />
								</div>
								<div class="form-group">
									<label for="age">Age<span style="color: red;">*</span></label>
									<input type="text" value="<%=customer.getAge()%>" name="age"
										id="age" readonly required />
								</div>
							</div>

							<!-- <div class="row">
								<div class="form-group">
									<label for="email">Email <span style="color: red;">*</span></label>
									<input type="email" name="email" id="email"
										placeholder="Enter Email" required />
								</div>
								<div class="form-group">
									<label for="contactNumber">Contact Number <span
										style="color: red;">*</span></label> <input type="text"
										name="contactNumber" id="contactNumber"
										placeholder="Enter Phone number" maxlength="10" pattern="\d*"
										required />
								</div>
							</div>

							<div class="row">
								<div class="form-group">
									<label for="accountNumber">Account Number <span
										style="color: red;">*</span></label> <input type="text"
										name="accountNumber" id="accountNumber"
										placeholder="Enter Account number" required />
								</div>
								<div class="form-group">
									<label for="ifscCode">IFSC Code <span
										style="color: red;">*</span></label> <input type="text" id="ifscCode"
										name="ifscCode" placeholder="Enter IFSC code" required />
								</div>
							</div> -->

							<div class="form-group">
								<label for="accountBalance">Account Balance <span
									style="color: red;">*</span></label> <input type="number"
									name="accountBalance" id="accountBalance"
									value="<%=customer.getAccountBalance()%>" required />
							</div>

							<!-- <div class="row">
								<div class="form-group">
									<label for="aadhaarCard">Aadhaar Card Number <span
										style="color: red;">*</span></label> <input type="text"
										name="aadhaarCard" id="aadhaarCard"
										placeholder="Enter Aadhaar card number" required />
								</div>
								<div class="form-group">
									<label for="panCard">PAN Card Number <span
										style="color: red;">*</span></label> <input type="text" name="panCard"
										id="panCard" placeholder="Enter Pan card number" required />
								</div>
							</div>
							<div class="form-group">
								<label for="dob">Date of Birth <span style="color: red;">*</span></label>
								<input type="date" name="dob" id="dob" placeholder="Enter DOB"
									required />
							</div>-->

							<div class="row">
								<div class="form-group">
									<label for="gender">Gender <span style="color: red;">*</span></label>
									<!-- <input type="text" value="<%=customer.getGender()%>"
										name="gender" id="gender" required /> -->
									<select name="gender" id="gender">
    									<option value="" disabled>Select Gender</option>
    									<option value="Male" <%= "Male".equals(customer.getGender()) ? "selected" : "" %>>Male</option>
    									<option value="Female" <%= "Female".equals(customer.getGender()) ? "selected" : "" %>>Female</option>
    									<option value="Other" <%= "Other".equals(customer.getGender()) ? "selected" : "" %>>Other</option>
									</select>
								</div>
								<div class="form-group">
									<label for="city">City<span style="color: red;">*</span></label>
									<!-- <input type="text" value="<%=customer.getCity()%>"
										name="city" id="city" required /> -->
									<select name="city" id="city">
    									<option value="" disabled>Select City</option>
    									<option value="Mumbai" <%= "Mumbai".equals(customer.getCity()) ? "selected" : "" %>>Mumbai</option>
    									<option value="Pune" <%= "Pune".equals(customer.getCity()) ? "selected" : "" %>>Pune</option>
    									<option value="Chennai" <%= "Chennai".equals(customer.getCity()) ? "selected" : "" %>>Chennai</option>
    									<option value="Bengalaru" <%= "Bengalaru".equals(customer.getCity()) ? "selected" : "" %>>Bengalaru</option>
    									<option value="Hyderabad" <%= "Hyderabad".equals(customer.getCity()) ? "selected" : "" %>>Hyderabad</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="atype">Account Type<span style="color: red;">*</span></label>

								<!-- <input type="text" value="<%=customer.getAtype()%>"
									name="atype" id="atype" required /> -->
								<select name="atype" id="atype">
    								<option value="" disabled>Select Account Type</option>
    								<option value="Current" <%= "Current".equals(customer.getAtype()) ? "selected" : "" %>>Current</option>
    								<option value="Savings" <%= "Savings".equals(customer.getAtype()) ? "selected" : "" %>>Savings</option>
								</select>
							</div>


							<div class="form-group form-button">
								<input type="submit" name="update" id="update"
									class="form-submit" value="Update" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    document.getElementById("register-form").addEventListener("submit", function (event) {
        // Fetch form input values
        const cname = document.getElementById("cname").value.trim();
        const age = document.getElementById("age").value.trim();
        const accountBalance = document.getElementById("accountBalance").value.trim();

        const nameRegex = /^[a-zA-Z\s]+$/; // Only letters and spaces
        const ageRegex = /^\d+$/; // Only integers
        const balanceRegex = /^\d+(\.\d+)?$/; // Only valid decimal numbers

        // Validate customer name
        if (!nameRegex.test(cname)) {
            event.preventDefault();
            swal("Invalid Input", "Customer name must only contain letters and spaces.", "error");
            return;
        }
        
        // Validate age (integer)
        if (!ageRegex.test(age)) {
            event.preventDefault();
            swal("Invalid Input", "Age must be positive number greater than 10.", "error"); 
            return;
        }
        if (age<10 || age>120) {
            event.preventDefault();
            swal("Invalid Input", "Age must be greater than 10 and less than 120.", "error"); 
            return;
        }

        // Validate account balance (double)
        if (!balanceRegex.test(accountBalance)) {
            event.preventDefault();
            swal("Invalid Input", "Account Balance must be a valid number.", "error");
            return;
        }
        if (accountBalance<2000) {
            event.preventDefault();
            swal("Invalid Input", "Minimum account balance should be 2000.", "error");
            return;
        }
 
        // Show success message before submission
        event.preventDefault(); // Temporarily prevent form submission
        swal("Success", "Customer details updated successfully!", "success").then(() => {
            document.getElementById("register-form").submit(); // Submit the form after showing success message
        });
    });
</script>

</body>

</html>
<%
	}
	} else {
		response.sendRedirect("Cview.jsp");
	}
%>