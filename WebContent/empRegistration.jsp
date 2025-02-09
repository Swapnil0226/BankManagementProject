<!DOCTYPE html>
<%
	if (session.getAttribute("name") != null) {
		String i = (String) session.getAttribute("name");
		System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Employee Registration</title>

<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<style>
/* Same styles as before */
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

.row {
	display: flex;
	gap: 10px;
}

.row .form-group {
	flex: 1;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input, textarea, button, select {
	width: 90%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	resize: none;
}

#signup {
	background-color: #0066b2;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
	margin: 20px;
}

#signup:hover {
	background-color: #005A9C;
}

.success {
	color: green;
	font-weight: bold;
}

.hidden {
	display: none;
}

#acknowledgment {
	text-align: center;
}

.readonly {
	background-color: #f4f4f4;
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

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">


	<div class="main">
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2
							style="color: #004b8d; text-decoration: none; margin-top: auto; font-size: 35px;">Employee
							Registration Form</h2>
						<form method="post" action="eregister" class="register-form"
							id="register-form">

							<input type="hidden" name="action" value="eregister" />

							<div class="form-group">
								<label for="empId">Employee ID <span style="color: red;">*</span></label>
								<input type="text" id="empId" class="readonly" name="empId"
									readonly />
							</div>

							<div class="row">
								<div class="form-group">
									<label for="role">Role <span style="color: red;">*</span></label>
									<select id="role" name="role">
										<option value="">Select a Role</option>
										<!-- <option value="Admin">Admin</option>-->
										<option value="Manager">Bank Manager</option>
										<!-- <option value="Staff">Staff</option>-->
									</select>
								</div>
								<div class="form-group">
									<label for="name">Employee Name <span
										style="color: red;">*</span></label> <input type="text" id="name"
										name="name" style="width:80%" placeholder="Enter employee name" maxlength="100" />
								</div>
							</div>

							<div class="row">
								<div class="form-group">
									<label for="contactNumber">Contact Number <span
										style="color: red;">*</span></label> <input type="text"
										id="contactNumber" name="contactNumber"
										placeholder="Enter phone number" maxlength="10" />
								</div>

								<div class="form-group">
									<label for="email">Email <span style="color: red;">*</span></label>
									<input type="email" id="email" name="email"
										style="width:80%" placeholder="Enter email" />
								</div>
							</div>

							<div class="row">
								<div class="form-group">
									<label for="password">Password <span
										style="color: red;">*</span></label> <input type="password"
										id="password" name="password" maxlength="100"
										placeholder="Enter password" />
								</div>
							</div>

							<div class="form-group">
								<label for="address">Address <span style="color: red;">*</span></label>
								<textarea id="address" name="address"
									placeholder="Enter address" rows="3" data-word-limit="50"></textarea>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />

							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		// Function to generate Employee ID
		const empId = document.getElementById("empId");
		const status = document.getElementById("status").value;

		if (status === "success") {
			swal("Congrats", "Employee Registered Successfully!");
		}

		const generateEmpId = () => Math.floor(1000000 + Math.random() * 9000000);
		empId.value = generateEmpId();
		
	    document.getElementById("register-form").addEventListener("submit", function (event) {
	        event.preventDefault(); // Prevent default form submission

	        // Get form field values
	        const name = document.getElementById("name").value.trim();
	        const contactNumber = document.getElementById("contactNumber").value.trim();
	        const email = document.getElementById("email").value.trim();
	        const password = document.getElementById("password").value.trim();
	        const address = document.getElementById("address").value.trim();
	        const role = document.getElementById("role").value;

	        // Validation patterns
	        const nameRegex = /^[a-zA-Z\s]+$/; // Only alphabets and spaces
	        const contactRegex = /^\d{10}$/; // Exactly 10 digits
	        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Valid email format
	        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/; // Strong password

	        // Validate non-empty fields
	        if (!role || !name || !contactNumber || !email || !password || !address) {
	            swal("Validation Error", "All fields are required.", "error");
	            return;
	        }

	        // Validate name
	        if (!nameRegex.test(name) || name.length <= 5) {
	            swal("Validation Error", "Name must be alphabetic and greater than 5 characters.", "error");
	            return;
	        }

	        // Validate contact number
	        if (!contactRegex.test(contactNumber)) {
	            swal("Validation Error", "Contact number must be exactly 10 digits.", "error");
	            return;
	        }

	        // Validate email
	        if (!emailRegex.test(email)) {
	            swal("Validation Error", "Please enter a valid email address.", "error");
	            return;
	        }

	        // Validate password
	        if (!passwordRegex.test(password)) {
	            swal("Validation Error", "Password must be 8-30 characters long, and include at least one uppercase letter, one lowercase letter, one number, and one special character.", "error");
	            return;
	        }

	        // Validate address
	        const wordCount = address.split(/\s+/).length; // Count words in the address
	        if (wordCount < 5) {
	            swal("Validation Error", "Address must contain at least 5 words.", "error");
	            return;
	        }

	        // All validations passed, show success and submit the form
	        swal({
	            title: "Registration Successful",
	            text: "Employee has been registered successfully!",
	            icon: "success",
	            button: "OK"
	        }).then(() => {
	            document.getElementById("register-form").submit(); // Submit the form programmatically
	        });
	    });

	</script>
</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>