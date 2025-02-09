<!DOCTYPE html>
<html lang="en">
<%
	if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		String cpassword = (String) session.getAttribute("cpassword");
%>

<head>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">


<title>Change Password</title>

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

#changePasswordBtn {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
	margin: 10px;
}

#changePasswordBtn:hover {
	background-color: #0056b3;
}

.success {
	color: green;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
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

	<div class="container">
		<h1 style="color: #004b8d;">Change Password</h1>
		<form method="post" action="customerlogin">
			<input type="hidden" name="action" value="changePassword" />
			<div class="form-group">
				<label for="oldPassword">Old Password <span
					style="color: red;">*</span></label> <input type="password"
					id="oldPassword" name="oldPassword" placeholder="Enter Old Password" required />
			</div>
			<div class="form-group">
				<label for="newPassword">New Password <span
					style="color: red;">*</span></label> <input type="password"
					id="newPassword" name="newPassword"
					placeholder="Enter New Password" 
					/>
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm New Password <span
					style="color: red;">*</span></label> <input type="password"
					id="confirmPassword" name="confirmPassword"
					placeholder="Confirm New Password"  />
			</div>
			<button id="changePasswordBtn" type="submit">Change Password</button>
		</form>
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
    document.querySelector("form").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent form submission for validation

        // Get field values
        const oldPassword = document.getElementById("oldPassword").value.trim();
        const newPassword = document.getElementById("newPassword").value.trim();
        const confirmPassword = document.getElementById("confirmPassword").value.trim();

        // Validation regex for password
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/;

        // Check if fields are empty
        if (!newPassword || !confirmPassword) {
            swal("Validation Error", "All fields are required.", "error");
            return;
        }

        // Validate new password
        if (!passwordRegex.test(newPassword)) {
            swal("Validation Error", "New password must be 8-30 characters long and include at least one numeric value, one uppercase letter, one lowercase letter, and one special character.", "error");
            return;
        }

        // Check if new password and confirm password match
        if (newPassword !== confirmPassword) {
            swal("Validation Error", "New password and confirm password do not match.", "error");
            return;
        }

        // Show success message and submit the form
        swal({
            title: "Password Changed",
            text: "Your password has been successfully updated.",
            icon: "success",
            button: "OK"
        }).then(() => {
            event.target.submit(); // Submit the form after showing success message
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