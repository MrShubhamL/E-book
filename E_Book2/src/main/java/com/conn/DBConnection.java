package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;

	public static Connection getConnection() throws Exception {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ebook";
		String username = "root";
		String password = "shubh96S@";
		conn = DriverManager.getConnection(url,username,password);	
		
		
		return conn;
	}
	
}
