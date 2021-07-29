<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>   
<%@page import="java.util.Date" %>   
<%@page import="java.text.SimpleDateFormat"%>   
        <div class="container-fluid">
           <h1 class="mt-4">Withdraw</h1>

				<%
	           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	        	String username = "root";
	        	String password = "12345678"; 

				String pin=request.getParameter("pin");
				String cust_id=request.getParameter("cust_id");
				String acc_no2=request.getParameter("acc_no");
				String remark=request.getParameter("remark");
				String pinselect ="select PIN,ACC_NO,AMOUNT from accounts  where CUST_ID=?";
				String accselect ="select ACC_NO from accounts where ACC_NO=?";
				if (pin != null || cust_id != null) {
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 

				    Connection con = DriverManager.getConnection(url, "root", "12345678");
				    Connection con1 = DriverManager.getConnection(url, "root", "12345678");
				    Connection con2 = DriverManager.getConnection(url, "root", "12345678");
				    
					PreparedStatement statement2 = con2.prepareStatement(accselect);
					statement2.setString(1,request.getParameter("acc_no"));
					ResultSet rs2 = statement2.executeQuery();
					if(rs2.next())
					{
						out.println("check");
						PreparedStatement statement = con.prepareStatement(pinselect);
						statement.setString(1,cust_id);
						ResultSet rs = statement.executeQuery();
						if(rs.next())
						{
							String newpin = rs.getString(1);
							String acc_no=String.valueOf(rs.getInt(2));
							int amount=Integer.parseInt(request.getParameter("amount"));
							int oldamount=rs.getInt(3);
							if(pin.equals(newpin))
							{
								if((oldamount-1000) >= amount && acc_no2!=acc_no)
								{
								SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd");
								String t_date=dateTimeInGMT.format(new Date());
								Class.forName("com.mysql.jdbc.Driver").newInstance(); 
								String transInsert ="INSERT INTO transaction (`ACC_NO1`,`ACC_NO2`,`AMOUNT`,`REMARK`,`DATE`) VALUES (?,?,?,?,?)";
								PreparedStatement statement1 = con1.prepareStatement(transInsert);
								statement1.setString(1,acc_no);
								statement1.setString(2,acc_no2);
								statement1.setString(3,request.getParameter("amount"));
								statement1.setString(4,remark);
								statement1.setString(5,t_date);
								 int count = statement1.executeUpdate();
								if(count>0) 
									out.println("<label style='color:green'>Amount is Withdrawn!!!</label>");
								else
									out.println("<label style='color:red'>Amount is not Withdrawn Try Again !!!</label>");
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
					else
						out.println("<label style='color:red'>Account Number Invalid  !!!</label>");
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
       			<label class="small mb-1" for="inputEmailAddress">TRANSFER TO ACCOUNT</label>
                <input type="number" maxlength="7" minlength="7"  name="acc_no" required class="form-control form-control-user" id="newpin" placeholder="Enter Account Number">                                
            </div>
            <div class="form-group ">
       			<label class="small mb-1" for="inputEmailAddress">Amount</label>
                <input type="number" maxlength="7"  name="amount" required class="form-control form-control-user" id="newpin" placeholder="Enter Amount">                                
            </div>
           	<div class="form-group ">
				<label class="small mb-1" for="inputEmailAddress">CURRENT PIN<small> ( Default Pin is 390039 if Not Updated)</small></label>
				<input type="password" maxlength="6" minlength="6" name="pin" required class="form-control form-control-user" id="exampleFirstName" placeholder="Enter Current Pin">                                                                
			</div>
           	<div class="form-group ">
				<label class="small mb-1" for="inputEmailAddress">REMARK</label>
				<input type="text" name="remark" maxlength="80" required class="form-control form-control-user" placeholder="Enter Remark" />                                                                
			</div>
           <input type="submit" class="btn btn-primary btn-user btn-block" value="Transfer Funds"/>
           	</form>
			</div>
			</div>
		</div>
              
<%@include file="footer.jsp" %>