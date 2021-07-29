<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>   
<%@page import="java.util.Date" %>   
<%@page import="java.text.SimpleDateFormat"%>    
        <div class="container-fluid">
           <h1 class="mt-4">Fixed Deposit</h1>

				<%
	           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	        	String username = "root";
	        	String password = "12345678"; 

				String pin=request.getParameter("pin");
				String cust_id=request.getParameter("cust_id");
				String pinselect ="select PIN,ACC_NO,AMOUNT from accounts  where CUST_ID=?";
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
						int amount=Integer.parseInt(request.getParameter("amount"));
						int interest=Integer.parseInt(request.getParameter("interest"));
						double amt=0;
						if(interest== 6)
							amt=amount+(amount*0.5*interest/100);
						if(interest== 8)
							amt=amount+(amount*1*interest/100);
						if(interest== 10)
							amt=amount+(amount*5*interest/100);
						String samt=Double.toString(amt);
						int oldamount=rs.getInt(3);
						if(pin.equals(newpin))
						{
							if((oldamount-1000) >= amount)
							{
							SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd");
							String t_date=dateTimeInGMT.format(new Date());
							Class.forName("com.mysql.jdbc.Driver").newInstance(); 
							String transInsert ="INSERT INTO fixed_deposit(`CUST_ID`,`ACC_NO`,`AMOUNT`,`INTEREST`,`FAMOUNT`,`CREATED_ON`)VALUES(?,?,?,?,?,?)";
							PreparedStatement statement1 = con1.prepareStatement(transInsert);
							statement1.setString(1,cust_id);
							statement1.setString(2,acc_no);
							statement1.setString(3,request.getParameter("amount"));
							statement1.setString(4,request.getParameter("interest"));
							statement1.setString(5,samt);
							statement1.setString(6,t_date);
							 int count = statement1.executeUpdate();
							if(count>0) 
								out.println("<label style='color:green'>Fixed Deposit Is Created!!!</label>");
							else
								out.println("<label style='color:red'>Something Went Wrong Try Again !!!</label>");
							}
							else
								out.println("<label style='color:red'>Insufficient Balance In Account !!!</label>");
						}
						else
							out.println("<label style='color:red'>You Entered Incorrect Pin !!!</label>");
					}
					else
						out.println("<label style='color:red'>You Entered Incorrect Pin  !!!</label>");
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
            <div class="form-group ">
       			<label class="small mb-1" for="inputEmailAddress">Interest</label>
				<select name="interest"    class="form-control form-control-user">
                	<option value="6">6% For 6 Months *</option>
                	<option value="8">8% For 1 Year *</option>
                	<option value="10">10% For 5 Year *</option>
                </select>                            
            </div>
           <input type="submit" class="btn btn-primary btn-user btn-block" value="Create Fixed Deposit"/>
           	</form>
			</div>
			</div>
		</div>
              
<%@include file="footer.jsp" %>