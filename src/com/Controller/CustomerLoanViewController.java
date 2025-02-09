
package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.LoanDAO;
import com.Model.LoanRequest;

@WebServlet("/ViewCustomerLoans")
public class CustomerLoanViewController extends HttpServlet {
    private LoanDAO loanDAO;

    public void init() {
        loanDAO = new LoanDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
    	    HttpSession session = request.getSession();
    	    int customerId = Integer.valueOf((String) session.getAttribute("customerId")); // Retrieve as Integer
    	    System.out.println("customerrIID: " + customerId);

    	    if (session.getAttribute("customerId") != null) {
    	        System.out.println("Loan Controller");
    	        List<LoanRequest> loanRequests = loanDAO.getLoanRequestsByCustomerId(customerId); // No need to parse
    	        System.out.println("loannn: " + loanRequests);
    	        session.setAttribute("loanRequests", loanRequests);
    	        response.sendRedirect("CLoanApplication.jsp");
    	    } else {
    	        response.sendRedirect("login.jsp");
    	    }
    	} catch (Exception e) {	
    	    e.printStackTrace();
    	}

    	

    
    }
}
