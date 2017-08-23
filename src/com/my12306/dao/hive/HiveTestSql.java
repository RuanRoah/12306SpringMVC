package com.my12306.dao.hive;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.my12306.util.HiveJDBC;
import com.my12306.vo.mapreduce.*;
public class HiveTestSql {
	static String driverName = null;
	static String url =null;
	Connection connection=null;
	public void init(){
		try {
			String driverName = "org.apache.hive.jdbc.HiveDriver";
			String url ="jdbc:hive2://192.168.92.132:10010/default";
			Class.forName(driverName);
			Connection connection = DriverManager.getConnection(url, "root", "sure");
			System.out.println(connection);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}					
	}		
	public ArrayList<TrainCount> getcountofsex() throws SQLException{	
		init();
		ArrayList<TrainCount> tc=new ArrayList<TrainCount>();
		String sql="select * from tabletest";		
		if(connection==null){
			connection=DriverManager.getConnection("jdbc:hive2://192.168.92.132:10010/default", "root", "sure");
		}
		PreparedStatement ps=connection.prepareStatement(sql);
		//ps.setString(1, username);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			String res=rs.getString("tel");
			int test=Integer.parseInt(res);
			TrainCount t=new TrainCount(rs.getString("userid"),test);
			tc.add(t);
		}
		
		return tc;		
	}	
}