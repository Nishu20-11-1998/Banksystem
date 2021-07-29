package com.login.dao;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SignupDAO {
	public String name,phone;
	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	String username = "root";
	String password = "12345678"; //Set your own MYSQL password
	/*String sqlInsertData = "INSERT INTO customers \r\n" + 
			"(\r\n" + 
			"FNAME,\r\n" + 
			"LNAME,\r\n" + 
			"PASS,\r\n" + 
			"MOBILE,\r\n" + 
			"EMAIL,\r\n" +  
			"CREATED_ON)\r\n" + 
			"VALUES\r\n" + 
			"(?,?,?,?,?,?);";*/
	String sqlInsertData ="CALL create_acc(?,?,?,?,?,?);";
	public boolean insertData(String fname,String lname, String uname, String phone, String pword)
	{
		try {
			if(fname==null || uname==null || phone==null || pword ==null)
				return false;
			else
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd");
				String t_date=dateTimeInGMT.format(new Date());
				PreparedStatement statement = con.prepareStatement(sqlInsertData);

				statement.setString(1,fname);
				statement.setString(2,lname);
				statement.setString(3, pword);
				statement.setString(4, phone);
				statement.setString(5, uname);
				statement.setString(6, t_date);
				
				int count = statement.executeUpdate();
				if(count>0)
					return true;
				else
					return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
