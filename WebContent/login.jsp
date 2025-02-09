<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Employee Login</title>

<link rel="stylesheet"
    href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<style>
* {
    font-family: sans-serif;
    font-weight: 500;
}

body {
    font-family: Arial, sans-serif;
    background: #e4e7ff;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 400px;
    margin: 5% auto;
    background: #fff;
    padding: 20px;
    border-radius: 25px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}

h1 {
    text-align: center;
    font-weight: 700;
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

#signin {
    background-color: #0066b2;
    color: #fff;
    font-size: 20px;
    cursor: pointer;
    border: none;
    margin: 10px;
}

.selectBtn {
    background-color: #0066b2;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    border: none;
    margin: 10px;
    transition: background-color 0.3s ease;
}

.selectBtn.active {
    background-color: #005cb3;
    border:1px solid #004687;
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 2);
}

.selectBtn:hover {
    background-color: #004687;
}

#signin:hover {
    background-color: #004687;
}

.loginPage {
    display: none;
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
            <h1>ACES BANK</h1>
            <p>Your trusted partner for all financial needs.</p>
        </div>
    </section>

    <input type="hidden" id="status"
        value="<%=request.getAttribute("status")%>">

    <div class="container">
        <div style="display: flex; justify-content: space-around;">
            <button id="employeeButton" onclick="openLoginPage('employeeLogin', 'employeeButton', 'customerButton')" class="selectBtn active">Employee</button>
            <button id="customerButton" onclick="openLoginPage('customerLogin', 'customerButton', 'employeeButton')" class="selectBtn">Customer</button>
        </div>

        <!-- Employee Login -->
        <div class="loginPage" id="employeeLogin" style="display: block;">
            <h1>Employee Login</h1>
            <form id="employeeForm" method="post" action="eregister">
                <input type="hidden" name="action" value="elogin" />
                <div class="form-group">
                    <label for="employeeId">Employee ID <span style="color: red;">*</span></label>
                    <input type="text" id="employeeId" name="empId" />
                </div>
                <div class="form-group">
                    <label for="employeePassword">Password <span style="color: red;">*</span></label>
                    <input type="password" id="employeePassword" name="password" />
                </div>
                <button id="signin" type="button" onclick="validateForm('employeeForm')">Log in</button>
            </form>
        </div>

        <!-- Customer Login -->
        <div class="loginPage" id="customerLogin">
            <h1>Customer Login</h1>
            <form id="customerForm" method="post" action="customerlogin">
                <input type="hidden" name="action" value="clogin" />
                <div class="form-group">
                    <label for="customerId">Customer ID <span style="color: red;">*</span></label>
                    <input type="text" id="customerId" name="customerId" />
                </div>
                <div class="form-group">
                    <label for="password">Password <span style="color: red;">*</span></label>
                    <input type="password" id="password" name="password" />
                </div>
                <button id="signin" type="button" onclick="validateForm('customerForm')">Log in</button>
            </form>
        </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function openLoginPage(loginPageId, activeButtonId, inactiveButtonId) {
            // Toggle Login Page
            document.getElementById("employeeLogin").style.display = "none";
            document.getElementById("customerLogin").style.display = "none";
            document.getElementById(loginPageId).style.display = "block";

            // Toggle Button Active State
            document.getElementById(activeButtonId).classList.add("active");
            document.getElementById(inactiveButtonId).classList.remove("active");
        }

        function validateForm(formId) {
            console.log("Validating form:", formId);
            const form = document.getElementById(formId);
            let idField, passwordField;

            if (formId === 'employeeForm') {
                idField = document.getElementById('employeeId');
                passwordField = document.getElementById('employeePassword');
            } else {
                idField = document.getElementById('customerId');
                passwordField = document.getElementById('password');
            }

            const idRegex = /^\d{7}$/;
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/;

            if (!idField.value || !passwordField.value) {
                swal("Login Failed", "Fields cannot be empty.", "error");
                return;
            }

            if (!idRegex.test(idField.value)) {
                swal("Invalid ID", "The ID must be exactly 7 digits.", "error");
                return;
            }

            if (!passwordRegex.test(passwordField.value) && formId === 'employeeForm') {
                swal("Invalid Password", "Please check your credentials.", "error");
                return;
            }

            form.submit();
        }

        const status = document.getElementById("status").value;
        if (status === "failed") {
            swal("Login Failed", "Please check your credentials.", "error");
        }
    </script>
    
</body>
</html>
