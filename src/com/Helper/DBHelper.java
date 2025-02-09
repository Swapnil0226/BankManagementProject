package com.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public final class DBHelper {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	
	private static final String URI = "jdbc:derby:D:/Users/2786946/MyDB;create=true";
//	private static final String URI = "jdbc:derby:D:/Users/2794161/MyDB;create=true";
//	private static final String URI = "jdbc:derby:D:/Users/2784673/MyDB;create=true";
//	private static final String URI = "jdbc:derby:D:/Users/2785590/MyDB;create=true";
//	private static final String URI = "jdbc:derby:D:/Users/2784773/MyDB;create=true";
//	private static final String URI = "jdbc:derby:D:/Users/2806504/MyDB;create=true";


	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException{
		
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		DBHelper.connection = DriverManager.getConnection(DBHelper.URI);
		DBHelper.preparedStatement = DBHelper.connection.prepareStatement(sql);
		return DBHelper.preparedStatement;
		
	}
	
	public static void close() throws SQLException {
		DBHelper.preparedStatement.close();
		DBHelper.connection.close();
	}

}