<!DOCTYPE html>
<%
	if (session.getAttribute("name") != null) {
		String i = (String) session.getAttribute("name");
		System.out.println("htll" + i);
	} else if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		String cname = (String) session.getAttribute("custName");
		System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Initiate Loan Request</title>
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
	margin: 50px auto;
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

input, textarea, select, button {
	width: 95%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	resize: none;
}

button {
	background-color: #007bff;
	color: #fff;
	font-size: 18px;
	cursor: pointer;
	border: none;
	margin: 10px;
}

button:hover {
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

	<div class="container">
		<h2
			style="color: #004b8d; text-decoration: none; margin-top: auto; font-size: 35px;">Loan
			Request Initiation Form</h2>
				<form id="loanRequestForm" action="loan" class="submitLoan"
			id="submitLoan" method="POST">
			<input type="hidden" name="action" value="loan" />

			<div class="row">
				<div class="form-group">
					<label for="ssnId">Customer SSN ID <span
						style="color: red;">*</span></label> <input type="text" name="cid" readonly
						id="ssnId" placeholder="Enter Customer SSN ID"
						onblur="autofill()" required value="<%=i%>" />
				</div>
				<div class="form-group">
					<label for="customerName">Customer Name <span
						style="color: red;">*</span></label> <input type="text" name="cName" readonly
						id="customerName" value="<%=cname%>"
						title="Only letterns and spaces allowed" />
				</div>
			</div>


			<!-- <div class="form-group">
          <label for="occupation">Occupation <span style="color:red;">*</span></label>
          <input type="text" id="occupation" placeholder="Enter Occupation" maxlength="50" required />
        </div>
        <div class="form-group">
          <label for="employerName">Employer Name <span style="color:red;">*</span></label>
          <input type="text" id="employerName" placeholder="Enter Employee name" maxlength="50" required />
        </div>
        <div class="form-group">
          <label for="employerAddress">Employer Address <span style="color:red;">*</span></label>
          <textarea id="employerAddress" rows="3" placeholder="Enter Employee address" maxlength="100" required></textarea>
        </div> -->


			<div class="form-group">
				<label for="email">Email <span style="color: red;">*</span></label>
				<input type="email" name="email" id="email"
					placeholder="Enter Email" />
			</div>


			<!--
        <div class="form-group">
          <label for="address">Customer Address <span style="color:red;">*</span></label>
          <textarea id="address" rows="3" placeholder="Enter Customer address" maxlength="100" required></textarea>
        </div>
        -->

			<div class="row">
				<!--
            <div class="form-group">
              <label for="maritalStatus">Marital Status <span style="color:red;">*</span></label>
              <select id="maritalStatus" required>
                <option value="" disabled selected>Select Marital Status</option>
                <option value="Single">Single</option>
                <option value="Married">Married</option>
              </select>
            </div>
            -->


				<div class="form-group">
					<label for="contactNumber">Contact Number <span
						style="color: red;">*</span></label> <input type="text" id="contactNumber"
						name="contact" maxlength="10" placeholder="Enter Contact number"
						 />
				</div>
			</div>


			<div class="row">
				<div class="form-group">
					<label for="loanAmount">Loan Amount <span
						style="color: red;">*</span></label> <input type="number"
						name="loanAmount" id="loanAmount" placeholder="Enter Loan amount"
				 />
				</div>

				<div class="form-group">
					<label for="loanDuration">Loan Duration (in years) <span
						style="color: red;">*</span></label> <input type="number"
						name="loanDuration" id="loanDuration"
						placeholder="Enter Loan duration" />
				</div>
			</div>
			<div class="form-group form-button">
				<input type="submit" name="submitLoanBtn" id="submitLoanBtn"
					class="form-submit" value="Submit Loan Request"
					style="background-color: #007bff; color: #fff; font-size: 16px; cursor: pointer; border: none; padding: 10px; border-radious: 5px" />
			</div>
			<!--
        <button type="button" id="submitLoanBtn">Submit Loan Request</button>
        -->
		</form>

		<p id="responseMessage" class="response-message"></p>
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

    document.getElementById("loanRequestForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent form submission for validation

        // Get field values
        const ssnId = document.getElementById("ssnId").value.trim();
        const customerName = document.getElementById("customerName").value.trim();
        const email = document.getElementById("email").value.trim();
        const contactNumber = document.getElementById("contactNumber").value.trim();
        const loanAmount = document.getElementById("loanAmount").value.trim();
        const loanDuration = document.getElementById("loanDuration").value.trim();

        // Email Regex
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Contact Number Regex
        const contactRegex = /^\d{10}$/;

        // Validate non-empty fields
        if (!ssnId || !customerName || !email || !contactNumber || !loanAmount || !loanDuration) {
            swal("Validation Error", "All fields are required.", "error");
            return;
        }

        // Validate Email
        if (!emailRegex.test(email)) {
            swal("Validation Error", "Please enter a valid email address.", "error");
            return;
        }

        // Validate Contact Number
        if (!contactRegex.test(contactNumber)) {
            swal("Validation Error", "Contact number must be exactly 10 digits.", "error");
            return;
        }

        // Validate Loan Amount
        const loanAmountValue = parseFloat(loanAmount);
        if (loanAmountValue < 100000 || loanAmountValue > 8000000) {
            swal("Validation Error", "Loan amount must be between 100,000 and 8,000,000.", "error");
            return;
        }

        // Validate Loan Duration
        const loanDurationValue = parseInt(loanDuration);
        if (loanDurationValue < 1 || loanDurationValue > 30) {
            swal("Validation Error", "Loan duration must be between 1 and 30 years.", "error");
            return;
        }

        // If all validations pass, submit the form
        swal({
            title: "Loan Request Submitted",
            text: "Your loan request has been successfully submitted.",
            icon: "success",
            button: "OK"
        }).then(() => {
            document.getElementById("loanRequestForm").submit();
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