<%@ page import="com.Dao.CustomerDAO, com.Model.Customer"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("customer") != null) {
		Customer customer = (Customer) session.getAttribute("customer");
		String id = request.getParameter("id");
		//System.out.println(id);
		//System.out.println(customer);
%>
<%
	if (session.getAttribute("name") != null) {
			String i = (String) session.getAttribute("name");
			System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Customer</title>

<style>
 *{
      	font-family: sans-serif;
      }
body {
	font-family: Arial, sans-serif;
	background: #e4e7ff ;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 9% auto;
	background: #fff;
	padding: 20px;
	border-radius: 25px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}

h1, h2 {
	text-align: center;
	color: #004b8d; 
	text-decoration:none; 
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
	padding: 12px;
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
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f4f4f4;
}

#fetch {
	background-color: #0066b2;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
	margin: 20px;
	width: 85%;
	margin-left: 50px;
    display: block;
}

#fetch:hover{
background-color:#005A9C;
}

#delete {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	border: none;
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


	<%
		String message = "";
		String error = "";
		/*Customer customer = null;

		if (request.getParameter("fetch") != null) {
			try {
				int cid = Integer.parseInt(request.getParameter("cid"));
				CustomerDAO dao = new CustomerDAO();

				List<Customer> customers = dao.get();
				for (Customer c : customers) {
					if (c.getCid() == cid) {
						customer = c;
						break;
					}
				}

				if (customer == null) {
					error = "Customer not found with ID: " + cid;
				}

			} catch (Exception e) {
				error = "Invalid ID. Please enter a numeric value.";
			}
		}*/

		if (request.getParameter("delete") != null) { 
			try {
				int cid = Integer.parseInt(request.getParameter("cid"));
				CustomerDAO dao = new CustomerDAO();

			
			    if (dao.delete(cid)) {
			        message = "Customer deleted successfully!";
			%>
		        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            swal({
                title: "Success!",
                text: "<%=message%>",
                icon: "success",
                button: "OK",
            }).then(() => {
                window.location.href = "/Bank_Management_System_Grp23/cget";
            });
        </script>
<% 
    } else {
        error = "Failed to delete customer. Please try again.";
    }


			} catch (Exception e) {
				error = "Invalid request. Please try again.";
			}
		}
	%>

	<div class="container">
		<h2>Delete Customer</h2>
		<!-- <form method="POST" id="fetchCustomerForm" action="delete">
		<input type="hidden" name="action" value="cdelete" /> 
			<label for="cid">Enter Customer ID </label> 
			<input type="hidden" name="cid" id="cid" value="<%=customer.getCid()%>" />
			<button type="submit" id="fetch" name="fetch">Fetch Customer</button>
		</form> --> 

		<%
			if (customer != null) {
		%>
		<form method="POST" id="deleteForm" class="register-form" id="register-form">
			<h3>Customer Details</h3>
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
				<b>Account Number:</b>
				<%=customer.getAccNumber()%></p>
			<p>
				<b>Balance:</b>
				<%=customer.getAccountBalance()%></p>
			<p>
				<b>Account Type:</b>
				<%=customer.getAtype()%></p>
			<input type="hidden" name="cid" value="<%=customer.getCid()%>">
			<button type="submit" id="delete" name="delete"
				onclick="return confirm('Are you sure you want to delete this customer?');">
				Delete Customer</button>
		</form>
		<%
			}
		%>

		<%
			if (!message.isEmpty()) {
		%>
		<p class="success"><%=message%></p>
		<%
			}
		%>
		<%
			if (!error.isEmpty()) {
		%>
		<p class="error"><%=error%></p>
		<%
			}
		%>
	</div>
	
	<footer>
      <h3>Aces Bank</h3>
      <p>&copy; 2024 Aces Bank. All Rights Reserved.</p>
      <p>
        <a href="privacy_policy.jsp">Privacy Policy</a> | <a href="terms of service.jsp">Terms of Service</a> |
        <a href="about us.jsp">About Us</a>
      </p>
    </footer>
	
	
	<script>
		//const deleteForm = document.getElementById("deleteCustomerForm");
		//const fetchCustomerForm = document.getElementById("fetchCustomerForm");

		
	</script>
</body>
</html>
<%
	}
	}else{
		response.sendRedirect("login.jsp");
		
	}
%>