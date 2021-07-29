<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>             
        <div class="container-fluid">
            <h1 class="mt-4">View Fixed Deposit</h1>
            <%		
           		String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
				String F_ID=request.getParameter("id");
				String F_IDupdate ="update fixed_deposit set STATUS='Completed' where  F_ID=?";
				if (F_ID != null ) {
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				    
				    Connection con1 = DriverManager.getConnection(url, "root", "12345678");
					PreparedStatement statement1 = con1.prepareStatement(F_IDupdate);
					statement1.setString(1,F_ID);

					int count = statement1.executeUpdate();
					if(count>0)
						out.println("<label style='color:green'>FD AMOUNT IS CREATED TO ACCOUNT PLEASE CHECKYOUR BALANCE!!!</label>");
					else
						out.println("<label style='color:red'>SOMETHING WENT WRONG !!!</label>");
				}
				catch(Exception e)
				{
					System.out.print(e);
					e.printStackTrace();
				}}
				%>
            <hr>
            <div><div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               Fixed Deposit Details
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>PRINCIPAL AMOUNT</th>
                                                <th>MATURITY AMOUNT</th>
                                                <th>INTEREST</th>
                                                <th>CREATED ON</th>
                                                <th>STATUS</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>PRINCIPAL AMOUNT</th>
                                                <th>MATURITY AMOUNT</th>
                                                <th>INTEREST</th>
                                                <th>CREATED ON</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
            <% 
           	String sqlSelect ="SELECT * FROM fixed_deposit where CUST_ID = ? ORDER BY CREATED_ON;"; 
			
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    
		    Connection con = DriverManager.getConnection(url, "root", "12345678");
			PreparedStatement statement = con.prepareStatement(sqlSelect);
			statement.setString(1,(String)session.getAttribute("cust_id"));
			ResultSet rs = statement.executeQuery();
			while(rs.next())
			{
           	%>
                                            <tr>
                                            <form method="post">
                                                <td><% out.print(rs.getInt(1)); %></td>
                                                <td><% out.print(rs.getString("AMOUNT")); %></td>
                                                <td><% out.print(rs.getString("FAMOUNT")); %></td>
                                                <td><% out.print(rs.getString("INTEREST")); %></td>
                                                <td><% out.print(rs.getString("CREATED_ON")); %></td>
                                                <td><% out.print(rs.getString("STATUS")); %></td>
                                                <td>
                                                <input type="text" hidden name="id" value="<% out.print(rs.getInt(1)); %>">
                                                <input type="submit" class="btn btn-primary btn-user btn-block" 
                                                <% String status=rs.getString(7);
                                                		String s="Completed";
                                                if (s.equals(status))
                                                	{%>
                                                	disabled
                                                	<%} %>
                                                value="Complete/Break"/>
                                                </td>
                                            </form>
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