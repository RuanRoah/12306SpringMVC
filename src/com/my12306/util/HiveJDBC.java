package com.my12306.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
public class HiveJDBC {
	static String driverName = "org.apache.hive.jdbc.HiveDriver";
	static String url = "jdbc:hive2://192.168.92.132:10010/default";
	static  Object classforname() throws ClassNotFoundException{
		return Class.forName(driverName);		
	}
	public PreparedStatement statement(String sql) throws SQLException{
		return connection().prepareStatement(sql);
	}
	static  Connection connection() throws SQLException{
		return DriverManager.getConnection(url, "root", "sure");	
	}		
}