<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aces Bank</title>
</head>
<style>
 *{
      	font-family: sans-serif;
      }
body {
    font-family: Arial, sans-serif;
  background: #e4e7ff ;    margin: 0;
    padding: 0;
}

.container {
    max-width: 400px;
    margin: 10% auto;
    background: #fff;
    padding: 20px;
    border-radius: 25px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}

h1 {
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

input, button {
    width: 95%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

#signin {
    background-color: #c82333;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    border: none;
    margin: 10px;
}

#signin:hover {
    background-color: #e74c3c;
}

.success {
    color: green;
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
}

.hidden {
    display: none;
}
</style>
<body>

<div class="container">
    <h1>Customer Login</h1>

    <form method="post" action="customerlogin" class="login-form" id="loginForm">
    	<input type="hidden" name="action" value="clogin" />
    
        <div class="form-group">
            <label for="customerId">Customer ID <span style="color:red;">*</span></label>
            <input type="text" name="customerId" id="customerId" maxlength="10" required />
        </div>

        <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
    </form>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js">
function validateForm() {
   const employeeId = document.getElementById("customerId").value.trim();
   if (!/^\d{7}$/.test(customerId)) {
      alert("Employee number must be exactly 7 digits.");
      return false;
   }
   return true;
}
</script>

</body>
</html>