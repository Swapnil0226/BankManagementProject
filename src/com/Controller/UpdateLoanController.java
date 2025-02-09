package com.Controller;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.LoanDAO;
@WebServlet("/UpdateLoan")

public class UpdateLoanController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loanId = request.getParameter("loanId");
        String status = request.getParameter("status");
        String comment = request.getParameter("comment");
        System.out.println("Update");
        System.out.println("==> "+loanId+"==>" +status +"-->"+comment);

        try {
            LoanDAO loanDao = new LoanDAO();
           int res= loanDao.updateLoanStatus(loanId, status, comment);
           System.out.println("==>"+res);
           
//            handle error
           if(res != 0){        	   
            response.sendRedirect("LoanView.jsp");
           }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating loan request.");
        }
    }
}