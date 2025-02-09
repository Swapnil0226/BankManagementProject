package com.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Helper.DBHelper;
import com.Model.Customer;

public class CustomerDAO {

	public int insert(Customer customer) throws ClassNotFoundException, SQLException {
		int numberOfRecords = -1;

		String sql = "insert into customer values (?,?, ?, ? , ? , ?, ?,?,?)";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		preparedStatement.setInt(1, customer.getCid());
		preparedStatement.setString(2, customer.getCname());
		preparedStatement.setInt(3, customer.getAge());
		preparedStatement.setFloat(4, customer.getAccountBalance());
		preparedStatement.setString(5, customer.getGender());
		preparedStatement.setString(6, customer.getCity());
		preparedStatement.setString(7, customer.getAtype());
		preparedStatement.setString(8, customer.getPassword());
		preparedStatement.setString(9, customer.getAccNumber());

		numberOfRecords = preparedStatement.executeUpdate();

		DBHelper.close();

		return numberOfRecords;
	}
	// delete customer

	public boolean delete(int cid) throws ClassNotFoundException, SQLException {
		boolean rowDeleted = false;

		String sql = "DELETE FROM customer WHERE cid = ?";
		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		preparedStatement.setInt(1, cid);
		int rowsAffected = preparedStatement.executeUpdate();

		if (rowsAffected > 0) {
			rowDeleted = true;
		}

		DBHelper.close();
		return rowDeleted;
	}

	// View customer by id
	public Customer get(int id) throws ClassNotFoundException, SQLException {
		List<Customer> customers = new ArrayList<Customer>();

		String sql = "select * from customer where cid=?";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		preparedStatement.setInt(1, id);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			int cid = resultSet.getInt("cid");
			String password = resultSet.getString("password");
			String accNum=resultSet.getString("accNumber");
			String cname = resultSet.getString("cname");
			int age = resultSet.getInt("age");
			float accountbalance = resultSet.getFloat("accountBalance");
			String gender = resultSet.getString("gender");
			String city = resultSet.getString("city");
			String accountType = resultSet.getString("atype");

			Customer temp = new Customer(cid, cname, age, accountbalance, gender, city, accountType, password,accNum);
			customers.add(temp);
		}

		if (customers.size() <= 0) {
			return null;
		}

		DBHelper.close();
		System.out.println(customers);
		return customers.get(0);
	}

	// update customer
	public int update(Customer customer) throws ClassNotFoundException, SQLException {
		int numberOfRecords = -1;

		String sql = "UPDATE customer SET cname = ?, age = ?, accountBalance = ?, gender = ?, city = ?, atype = ? WHERE cid = ?";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		preparedStatement.setString(1, customer.getCname());
		preparedStatement.setInt(2, customer.getAge());
		preparedStatement.setFloat(3, customer.getAccountBalance());
		preparedStatement.setString(4, customer.getGender());
		preparedStatement.setString(5, customer.getCity());
		preparedStatement.setString(6, customer.getAtype());
		preparedStatement.setInt(7, customer.getCid());

		numberOfRecords = preparedStatement.executeUpdate();

		DBHelper.close();

		return numberOfRecords;
	}

	// View all customers
	public List<Customer> get() throws ClassNotFoundException, SQLException {
		List<Customer> customers = new ArrayList<Customer>();

		String sql = "select * from customer";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {

			int cid = resultSet.getInt("cid");
			String password = resultSet.getString("password");
			String accNum=resultSet.getString("accNumber");
			String cname = resultSet.getString("cname");
			int age = resultSet.getInt("age");
			float accBal = resultSet.getFloat("accountBalance");
			String gender = resultSet.getString("gender");
			String city = resultSet.getString("city");
			String atype = resultSet.getString("atype");

			Customer temp = new Customer(cid, cname, age, accBal, gender, city, atype, password,accNum);
			customers.add(temp);

		}

		DBHelper.close();

		return customers;

	}

	public Customer findByCustIdAndPassword(int customerId, String pass) throws ClassNotFoundException, SQLException {
		Customer customer = null;

		String sql = "SELECT * FROM customer WHERE cid = ? AND TRIM(password) = ?";
		System.out.println("Executing query: " + sql);

		try (PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql)) {
			if (preparedStatement == null) {
				System.out.println("PreparedStatement is null. Check DBHelper connection.");
				return null;
			}

			// Set parameters
			preparedStatement.setInt(1, customerId);
			preparedStatement.setString(2, pass);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				if (rs.next()) {
					// Retrieve data
					String cname = rs.getString("cname");
					int age = rs.getInt("age");
					float accountBalance = rs.getFloat("accountBalance");
					String gender = rs.getString("gender");
					String city = rs.getString("city");
					String atype = rs.getString("atype");
					String password = rs.getString("password");
					String accNum=rs.getString("accNumber");

					// Create Customer object
					customer = new Customer(customerId, cname, age, accountBalance, gender, city, atype, password,accNum);
					System.out.println("Customer found: " + customer);
				} else {
					System.out.println("No record found for customerId: " + customerId + ", password: " + pass);
				}
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception occurred: " + e.getMessage());
			e.printStackTrace();
		} finally {
			DBHelper.close(); // Ensure the DB connection is closed
		}

		return customer;
	}

	public int updatePassword(int cid, String newPassword) throws ClassNotFoundException, SQLException {

		int numberOfRecords = -1;

		String sql = "UPDATE customer SET password = ? WHERE cid = ?";

		PreparedStatement preparedStatement = DBHelper.getPreparedStatement(sql);

		preparedStatement.setString(1, newPassword);
		preparedStatement.setInt(2, cid);

		numberOfRecords = preparedStatement.executeUpdate();
		DBHelper.close();
		return numberOfRecords;
	}
}