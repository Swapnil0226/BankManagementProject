package com.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Helper.DBHelper;
import com.Model.Employee;

public class EmployeeDAO {

	public int insert(Employee employee) throws ClassNotFoundException, SQLException {
		int numberOfRecords = -1;
		String sql = "INSERT INTO employee VALUES (?,?,?,?,?,?,?)";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);
		preparedStatement.setString(1, employee.getEmpId());
		preparedStatement.setString(2, employee.getRole());
		preparedStatement.setString(3, employee.getName());
		preparedStatement.setString(4, employee.getContactNumber());
		preparedStatement.setString(5, employee.getEmail());
		preparedStatement.setString(6, employee.getPassword());
		preparedStatement.setString(7, employee.getAddress());

		System.out.println("Executing query: " + preparedStatement);

		numberOfRecords = preparedStatement.executeUpdate();

		// System.out.println("Records inserted: " + numberOfRecords);
		DBHelper.close();

		return numberOfRecords;
	}

	public Employee login(String empId, String password) throws ClassNotFoundException, SQLException {
		Employee employee = null;
		String sql = "SELECT * FROM employee WHERE empId = ? AND password = ?";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);
		preparedStatement.setString(1, empId);
		preparedStatement.setString(2, password);

		ResultSet rs = preparedStatement.executeQuery();
		System.out.println("==>" + rs);
		if (rs.next()) {
			employee = new Employee(rs.getString("name"), rs.getString("email"), rs.getString("password"),
					rs.getString("role"), rs.getString("empId"), rs.getString("address"),
					rs.getString("contactNumber"));
		}

		DBHelper.close();
		return employee;
	}

}
