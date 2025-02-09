
<%@page import="com.Model.LoanRequest"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loan Requests</title>
<style>
/* Your existing styles */
body {
    font-family: Arial, sans-serif;
    background:#e4e7ff ;
    margin: 0;
    padding: 0;
    font-size:15px
}
.container {
    max-width: 1200px;
    margin: 12% auto;
    background: #fff;
    padding: 20px;
    border-radius: 25px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
}
h1 {
    text-align: center;
}
input, button {
    width: 95%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
}
th, td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}
th {
    background-color: #007bff;
    color: #fff;
}
tr:nth-child(even) {
    background-color: #f9f9f9;
}
tr:hover {
    background-color: #d6ebff;
}
button {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}
button:hover {
    background-color: #0056b3;
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
<div class="container">
    <h1 style="color: #004b8d; text-decoration: none; margin-top: auto; font-size: 35px;">Loan Request Details</h1>
    <input type="text" id="search-bar" placeholder="Search here..." onkeyup="filterTable()">
    <table id="loan-table">
        <thead>
            <tr>
                <th>Loan ID</th>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Loan Amount (&#8377;)</th>
                <th>Loan Duration</th>
                <th>Loan Status</th>
                <th>Application Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<LoanRequest> loanRequests = (List<LoanRequest>) session.getAttribute("loanRequests");
            if (loanRequests != null && !loanRequests.isEmpty()) {
                for (LoanRequest loan : loanRequests) {
            %>
            <tr>
                <td><%=loan.getLoanId()%></td>
                <td><%=loan.getCid()%></td>
                <td><%=loan.getcName()%></td>
                <td><%=loan.getEmail()%></td>
                <td><%=loan.getContact()%></td>
                <td><%=loan.getLoanAmount()%></td>
                <td><%=loan.getLoanDuration()%></td>
                <td><%=loan.getLoanStatus()%></td>
                <td><%=loan.getApplicationDate()%></td>
                <td>
                    <form action="LoanUpdate.jsp" method="get">
                        <input type="hidden" name="loanId" value="<%=loan.getLoanId()%>">
                        <button type="submit">Update Loan Request</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="10" style="text-align:center;">No Loan Requests Available</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>


   <footer>
      <h3>Aces Bank</h3>
      <p>&copy; 2024 Bank Name. All Rights Reserved.</p>
      <p>
        <a href="privacy_policy.jsp">Privacy Policy</a> | <a href="terms of service.jsp">Terms of Service</a> |
        <a href="about us.jsp">About Us</a>
      </p>
    </footer>

<script>
function filterTable() {
    const input = document.getElementById("search-bar");
    const filter = input.value.toUpperCase();
    const rows = document.querySelectorAll("#loan-table tbody tr");

    rows.forEach(row => {
        const cells = row.getElementsByTagName("td");
        let match = false;

        for (let i = 0; i < cells.length; i++) {
            const txtValue = cells[i].textContent || cells[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                match = true;
                break;
            }
        }

        row.style.display = match ? "" : "none";
    });
}
</script>
</body>
</html>