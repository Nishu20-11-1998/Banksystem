package com.update.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateDAO {
	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	String username = "root";
	String password = "12345678"; //Set your own MYSQL password
	String sqlUpdateData = "CALL update_acc(?,?,?,?,?,?,?);";
	/*String sqlUpdateData = "UPDATE customers\r\n" + 
			"SET\r\n" + 
			"`FNAME` = ?,\r\n" + 
			"`LNAME` = ?,\r\n" + 
			"`PASS` = ?,\r\n" + 
			"`MOBILE` = ?,\r\n" + 
			"`EMAIL` = ?,\r\n" + 
			"`ADDRESS` =?\r\n" + 
			"WHERE `CUST_ID` = ?;";*/
	public boolean insertData(String cust_id,String fname,String lname, String uname, String phone, String pword, String address, String cdate)
	{
		try {
			if(fname==null )
				return false;
			else
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				PreparedStatement statement = con.prepareStatement(sqlUpdateData);
				

				statement.setString(1,cust_id);
				statement.setString(2,fname);
				statement.setString(3,lname);
				statement.setString(4, pword);
				statement.setString(5, phone);
				statement.setString(6, uname);
				statement.setString(7, address);
				/*statement.setString(1,fname);
				statement.setString(2,lname);
				statement.setString(3, pword);
				statement.setString(4, phone);
				statement.setString(5, uname);
				statement.setString(6, address);
				statement.setString(7,cust_id);*/
				
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
