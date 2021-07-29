<%@include file="header.jsp" %>	
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.Connection" %>   
	<script>

    function Validate() {
        var password = document.getElementById("newpin").value;
        var confirmPassword = document.getElementById("confpin").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
	</script>      
        <div class="container-fluid">
           <h1 class="mt-4">Update Pin</h1>

				<%
	           	String url= "jdbc:mysql://127.0.0.1:3306/banksystem";
	        	String username = "root";
	        	String password = "12345678"; 
				
				String newpin=request.getParameter("newpin");
				String oldpin=request.getParameter("oldpin");
				String cust_id=request.getParameter("cust_id");
				String pinupdate ="update accounts set PIN=? where PIN=? and CUST_ID=?";
				if (newpin != null ||oldpin != null ||cust_id != null) {
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				    
				    Connection con = DriverManager.getConnection(url, "root", "12345678");
					PreparedStatement statement = con.prepareStatement(pinupdate);
					statement.setString(1,newpin);
					statement.setString(2,oldpin);
					statement.setString(3,cust_id);

					int count = statement.executeUpdate();
					if(count>0)
						out.println("<label style='color:green'>Pin Updated Successfully !!!</label>");
					else
						out.println("<label style='color:red'>Pin is Not Updated  !!!</label>");
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
				<input type="password" maxlength="6" minlength="6" name="oldpin" required class="form-control form-control-user" id="exampleFirstName" placeholder="Enter Current Pin">                                                                
			</div>
            <div class="form-group ">
       			<label class="small mb-1" for="inputEmailAddress">New Pin</label>
                <input type="password" maxlength=6 minlength="6" name="newpin" required class="form-control form-control-user" id="newpin" placeholder="Enter New Pin">                                
            </div>
            <div class="form-group ">
                <label class="small mb-1" for="inputEmailAddress">Confirm Pin</label>
                <input type="password" maxlength=6 minlength="6" name="confpin" required class="form-control form-control-user" id="confpin" placeholder="Enter confirm Pin">                                
            </div>
           <input type="submit" onclick="return Validate()" class="btn btn-primary btn-user btn-block"/>
           	</form>
			</div>
			</div>
		</div>
              
<%@include file="footer.jsp" %>