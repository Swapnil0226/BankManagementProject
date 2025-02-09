<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Loan Request</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #e4e7ff ;
    margin: 0;
    padding: 0;
}
.container {
    max-width: 600px;
    margin: 10% auto;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}
h1 {
    margin-bottom: 20px;
}
input, select, textarea, button , .textArea{
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
}
button {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}
button:hover {
    background-color: #0056b3;
}
.btn{
display:flex;
justify-content : left;
width: 80px;
text-align:center;
}
label{
text-align:left;
}
h1{
text-align:center;
}
.form-group{
display:flex;
margin-bottom:20px;
margin-top:20px;
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
<script>
function showSuccessMessage() {
    alert("Status updated successfully!");
    window.location.href = "LoanView.jsp";
}
</script>
</head>
<body>

 <!-- Hero Section -->
    <section class="hero">
      <div>
        <h1>Welcome to ABC Bank</h1>
        <p>Your trusted partner for all financial needs.</p>
      </div>
    </section>
<div class="container">
 <!-- <% out.print(request.getParameter("loanId")); %> --> 
    <h1 style="color: #004b8d; text-decoration: none; margin-top: auto; font-size: 35px;">Update Loan Request</h1>
    <button type="button" class="btn" onclick="window.history.back()">Go Back</button>
<form action="UpdateLoan" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="loanId" value="<%= request.getParameter("loanId") %>">
    <div class="form-group">
        <label for="loanAmount"><strong> Loan ID:<span style="color:red;"></strong></span></label>
        <label for="loanId"><strong><%= request.getParameter("loanId") %></strong></label>
    </div>
    <label for="status"><strong>Loan Status:<span style="color:red;">*</span></strong></label>
    <select name="status" id="status" >
        <option value="">--Select Status--</option>
        <option value="Accepted">Accept</option>
        <option value="Rejected">Reject</option>
    </select>

    <label for="comment"><strong>Manager's Comment:<span style="color:red;">*</span></strong></label>
    <textarea name="comment" id="comment" rows="3" class="textArea" ></textarea>

    <button type="submit">Update</button>
</form>
</div>


   <footer>
      <h3>ABC Bank</h3>
      <p>&copy; 2024 Bank Name. All Rights Reserved.</p>
      <p>
        <a href="privacy_policy.jsp">Privacy Policy</a> | <a href="terms of service.jsp">Terms of Service</a> |
        <a href="about us.jsp">About Us</a>
      </p>
    </footer>
    
    	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
    function validateForm() {
        const statusField = document.getElementById("status");
        const commentField = document.getElementById("comment");

        // Check if the status is selected
        if (!statusField.value) {
            swal("Validation Error", "Please select a loan status.", "error");
            return false;
        }

        // Check if the manager's comment is empty or less than 5 words
        const comment = commentField.value.trim();
        const wordCount = comment.split(/\s+/).length; // Split by whitespace and count words
        if (!comment || wordCount < 5) {
            swal("Validation Error", "Manager's comment must contain at least 5 words.", "error");
            return false;
        }

        // Show success message and allow form submission
        swal({
            title: "Status Updated",
            text: "Loan status updated successfully!",
            icon: "success",
            buttons: false,
            timer: 2000
        }).then(() => {
            document.querySelector("form").submit();
        });

        return false; // Prevent default form submission for now
    }
</script>

</body>
</html>
