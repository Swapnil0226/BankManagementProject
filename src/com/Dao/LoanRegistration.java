package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Helper.DBHelper;
import com.Model.LoanRequest;

public class LoanRegistration {

	public int submitLoanRequest(LoanRequest e) throws ClassNotFoundException, SQLException {
		int check = 0;

		String sql = "insert into LoanRequest(loanId,cid,cName,email,contact,loanAmount,loanDuration) values(?,?,?,?,?,?,?)"; // 3

		PreparedStatement pst = DBHelper.getPreparedStatement(sql);


		pst.setInt(1, e.getLoanId());
		pst.setInt(2, e.getCid());
		pst.setString(3, e.getcName());
		pst.setString(4, e.getEmail());
		pst.setString(5, e.getContact());
		pst.setDouble(6, e.getLoanAmount());
		pst.setInt(7, e.getLoanDuration());

		check = pst.executeUpdate(); // 5
		System.out.println(check);

		DBHelper.close();
		return check;

	}
}
