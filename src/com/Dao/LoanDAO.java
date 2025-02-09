package com.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Model.LoanRequest;
import com.Helper.DBHelper;

public class LoanDAO {

    public void submitLoan(LoanRequest loan) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO LoanRequest (loanId, cid, cName, email, contact, loanAmount, loanDuration, loanStatus, applicationDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = DBHelper.getPreparedStatement(sql)) {
            pst.setInt(1, loan.getLoanId());
            pst.setInt(2, loan.getCid());
            pst.setString(3, loan.getcName());
            pst.setString(4, loan.getEmail());
            pst.setString(5, loan.getContact());
            pst.setDouble(6, loan.getLoanAmount());
            pst.setInt(7, loan.getLoanDuration());
            pst.setString(8, loan.getLoanStatus());
            pst.setDate(9, Date.valueOf(loan.getApplicationDate()));
            pst.executeUpdate();
        }
    }

    public List<LoanRequest> getAllLoans() throws SQLException, ClassNotFoundException {
        List<LoanRequest> loanRequests = new ArrayList<>();
        String sql = "SELECT * FROM LoanRequest";
        try (PreparedStatement pst = DBHelper.getPreparedStatement(sql);
             ResultSet rs = pst.executeQuery()) {
        	System.out.println("rrrs"+rs);
            while (rs.next()) {
            	
                LoanRequest loan = new LoanRequest(
                    rs.getInt("loanId"),
                    rs.getInt("cid"),
                    rs.getString("cName"),
                    rs.getString("email"),
                    rs.getString("contact"),
                    rs.getDouble("loanAmount"),
                    rs.getInt("loanDuration"),
                    rs.getString("loanStatus"),
                    rs.getDate("applicationDate").toString()
                );
                System.out.println("loan"+loan);
                loanRequests.add(loan);
            }
        }
        return loanRequests;
    }
    public int updateLoanStatus(String loanId, String status, String comment) throws SQLException, ClassNotFoundException {
    	int check = 0 ;
        String query = "UPDATE LoanRequest SET loanStatus = ?, comment = ? WHERE loanId = ?";
        
        try (PreparedStatement pst = DBHelper.getPreparedStatement(query)) {
        	System.out.println("Upppd==");
        	pst.setString(1, status);
        	pst.setString(2, comment);
        	pst.setInt(3, Integer.parseInt(loanId));
             check = pst.executeUpdate();
             System.out.println("check"+check);
             System.out.println("Updatedddd");
        }
        return check;
    }
    public List<LoanRequest> getLoanRequestsByCustomerId(int customerId) throws SQLException, ClassNotFoundException  {
        List<LoanRequest> LoanRequests = new ArrayList<>();
        final String query =
                "SELECT * FROM LoanRequest WHERE cid = ?";

        try (PreparedStatement preparedStatement = DBHelper.getPreparedStatement(query)) {
            preparedStatement.setInt(1, customerId);
            ResultSet rs = preparedStatement.executeQuery();

          
            while (rs.next()) {
            	System.out.println(rs);
                LoanRequest loanRequest = new LoanRequest(rs.getInt("loanId") ,rs.getInt("cid"),rs.getString("cName"),
                		rs.getString("email"),rs.getString("contact"),rs.getDouble("loanAmount"),rs.getInt("loanDuration"),
                		rs.getString("loanStatus"),rs.getString("comment"),rs.getString("applicationDate"));
               
                LoanRequests.add(loanRequest);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("==>"+LoanRequests);
        return LoanRequests;
    }

}