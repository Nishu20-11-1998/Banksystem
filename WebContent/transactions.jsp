<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>         
        <div class="container-fluid">              
        <div class="container-fluid">
            <h1 class="mt-4">Transactions</h1>
            <hr>
            <div><div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               Transaction Details
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>TRANS ID</th>
                                                <th>FROM ACCOUNT</th>
                                                <th>TO ACCOUNT</th>
                                                <th>AMOUNT</th>
                                                <th>REMARK</th>
                                                <th>DATE</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>TRANS ID</th>
                                                <th>FROM ACCOUNT</th>
                                                <th>TO ACCOUNT</th>
                                                <th>AMOUNT</th>
                                                <th>REMARK</th>
                                                <th>DATE</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
            <% 
           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
        	String username = "root";
        	String password = "12345678"; 
           	String sqlSelect ="SELECT * FROM transaction where ACC_NO1 = (SELECT ACC_NO FROM accounts where CUST_ID=?) OR ACC_NO2 = (SELECT ACC_NO FROM accounts where CUST_ID=?) ORDER BY DATE ;"; 
			
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    
		    Connection con = DriverManager.getConnection(url, "root", "12345678");
			PreparedStatement statement = con.prepareStatement(sqlSelect);
			statement.setString(1,(String)session.getAttribute("cust_id"));
			statement.setString(2,(String)session.getAttribute("cust_id"));
			ResultSet rs = statement.executeQuery();
			while(rs.next())
			{
           	%>
                                            <tr>
                                                <td><% out.print(rs.getInt(1)); %></td>
                                                <td><% out.print(rs.getString(2)); %></td>
                                                <td><% out.print(rs.getString("ACC_NO2")); %></td>
                                                <td><% out.print(rs.getString("AMOUNT")); %></td>
                                                <td><% out.print(rs.getString("REMARK")); %></td>
                                                <td><% out.print(rs.getString("DATE")); %></td>
                                            </tr>
                      <%} %>                                        
                      </tbody>
              </table>
                                </div>
                            </div>
                        </div>   	
				</div>
				
				
				
              </div>
              
<%@include file="footer.jsp" %>