<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>         
        <div class="container-fluid">
           <h1 class="mt-4">Account Details</h1>
           <hr>
           <div class="card">
           	<% 
           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
        	String username = "root";
        	String password = "12345678"; 
           	String sqlSelect ="SELECT * FROM customers C join accounts A on A.CUST_ID=C.CUST_ID where C.CUST_ID=?;"; 

        	 String fname,lname,mobile,cust_id,cdate,email,address,acc_no,amount,pin;
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    
		    Connection con = DriverManager.getConnection(url, "root", "12345678");
			PreparedStatement statement = con.prepareStatement(sqlSelect);
			statement.setString(1,(String)session.getAttribute("cust_id"));
			ResultSet rs = statement.executeQuery();
			if(rs.next())
			{
				cust_id=String.valueOf(rs.getInt(1));
				fname=rs.getString(2);
				lname=rs.getString(3);
				mobile = rs.getString(5);
				email = rs.getString(6);
				address= rs.getString(7);
				cdate = rs.getString(8);
				acc_no=rs.getString(10);
				amount=rs.getString(11);
				pin = rs.getString(12);
           	%>
				
            <div class="card-body">
			<table class="table table-borderless">
			<tbody>
			<tr>
				<th>FIRST NAME</th>
				<td><%	
				out.print(fname); %></td>
			
				<th>LAST NAME</th>
				<td><%	
				out.print(lname); %></td>
			</tr>
			<tr>
				<th>MOBILE</th>
				<td><%	
				out.print(mobile); %></td>
			
				<th>EMAIL</th>
				<td><%	
				out.print(email); %></td>
			</tr>
			<tr>
				<th colspan="2">ADDRESS </th>
				<td colspan="2"><%	
				out.print(address); %></td>
			</tr>
			<tr>
				<th>CUSTOMER ID</th>
				<td><%	
				out.print(cust_id); %></td>
			
				<th>DATE CREATED</th>
				<td><%	
				out.print(cdate); %></td>
			</tr>
			<tr>
				<th colspan="2">ACCOUNT NUMBER </th>
				<td colspan="2"><%	
				out.print(acc_no); %></td>
			</tr>
			<tr>
				<th>BALANCE</th>
				<td><%	
				out.print(amount); %></td>
			
				<th>MIN. BALANCE <br>REQUIRED</th>
				<td>1000.00</td>
			</tr>
			</tbody>
			</table>
			NOTE: Your Default Transaction Pin Is Set As 390039 Please Update It.
           <a href="update_pin.jsp"  class="btn btn-primary ">UPDATE PIN</a>
		</div><%}
           	%>
			</div>
		</div>
              
<%@include file="footer.jsp" %>