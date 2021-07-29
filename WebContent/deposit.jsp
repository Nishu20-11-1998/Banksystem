<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>   
<%@page import="java.util.Date" %>   
<%@page import="java.text.SimpleDateFormat"%>      
        <div class="container-fluid">
           <h1 class="mt-4">Deposit</h1>

				<%
	           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	        	String username = "root";
	        	String password = "12345678"; 

				String pin=request.getParameter("pin");
				String cust_id=request.getParameter("cust_id");
				String amount=request.getParameter("amount");
				String remark="Deposit";
				String pinselect ="select PIN,ACC_NO from accounts  where CUST_ID=?";
				if (pin != null || cust_id != null) {
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 

				    Connection con = DriverManager.getConnection(url, "root", "12345678");
				    Connection con1 = DriverManager.getConnection(url, "root", "12345678");
					PreparedStatement statement = con.prepareStatement(pinselect);
					statement.setString(1,cust_id);
	
					ResultSet rs = statement.executeQuery();
					if(rs.next())
					{
						String newpin = rs.getString(1);
						String acc_no=String.valueOf(rs.getInt(2));
						if(pin.equals(newpin))
						{
							SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd");
							String t_date=dateTimeInGMT.format(new Date());
							Class.forName("com.mysql.jdbc.Driver").newInstance(); 
							String transInsert ="INSERT INTO transaction (`ACC_NO1`,`ACC_NO2`,`AMOUNT`,`REMARK`,`DATE`) VALUES (?,?,?,?,?)";
							PreparedStatement statement1 = con1.prepareStatement(transInsert);
							statement1.setString(1,acc_no);
							statement1.setString(2,acc_no);
							statement1.setString(3,amount);
							statement1.setString(4,remark);
							statement1.setString(5,t_date);
							 int count = statement1.executeUpdate();
							if(count>0) 
								out.println("<label style='color:green'>Amount is Deposited!!!</label>");
							else
								out.println("<label style='color:red'>Amount is not Deposited Try Again !!!</label>");
						}
						else
							out.println("<label style='color:red'>You Entered Incorrect Pin !!!</label>");
					}
					else
						out.println("<label style='color:red'>You Entered Incorrect Pin !!!</label>");
				}
				catch(Exception e)
				{
					System.out.print(e);
					e.printStackTrace();
				}}
				%>
           <hr>
           	<div class="card">
           	<div class="card-body">
           	<form  method="post">
            <div class="form-group ">
                            <label class="small mb-1" for="inputEmailAddress">CUSTOMER ID</label>
                    <input type="text" name="cust_id" readonly value="${cust_id}" required class="form-control form-control-user" id="exampleFirstName" placeholder="Full Name">                           
            </div>
           	<div class="form-group ">
				<label class="small mb-1" for="inputEmailAddress">CURRENT PIN<small> ( Default Pin is 390039 if Not Updated)</small></label>
				<input type="password" maxlength="6" minlength="6" name="pin" required class="form-control form-control-user" id="exampleFirstName" placeholder="Enter Current Pin">                                                                
			</div>
            <div class="form-group ">
       			<label class="small mb-1" for="inputEmailAddress">Amount</label>
                <input type="number" maxlength=7  name="amount" required class="form-control form-control-user" id="newpin" placeholder="Enter Amount">                                
            </div>
           <input type="submit" class="btn btn-primary btn-user btn-block" value="DEPOSIT"/>
           	</form>
			</div>
			</div>
		</div>
              
<%@include file="footer.jsp" %>