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

@WebServlet("/loan")
public class LoanController extends HttpServlet {

    private LoanDAO loanDao;

    public LoanController() {
        this.loanDao = new LoanDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	System.out.println("Loan Controller");
            List<LoanRequest> loanRequests = loanDao.getAllLoans();
            System.out.println("loanRequests"+loanRequests);
            HttpSession session = req.getSession();
            session.setAttribute("loanRequests", loanRequests);
            resp.sendRedirect("LoanView.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving loan data.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int loanId = (int) Math.floor(1000000 + Math.random() * 9000000);
            int cid = Integer.parseInt(req.getParameter("cid"));
            String cName = req.getParameter("cName");
            String email = req.getParameter("email");
            String contact = req.getParameter("contact");
            double loanAmount = Double.parseDouble(req.getParameter("loanAmount"));
            int loanDuration = Integer.parseInt(req.getParameter("loanDuration"));
            String loanStatus = "In Process";

            LocalDateTime currentDate = LocalDateTime.now();
            String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            LoanRequest loan = new LoanRequest(loanId, cid, cName, email, contact, loanAmount, loanDuration, loanStatus, formattedDate);

            loanDao.submitLoan(loan);
            resp.sendRedirect("CustomerHome.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error processing loan submission.");
        }
    }
}