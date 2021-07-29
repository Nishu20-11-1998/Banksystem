  <%@include file="header.jsp" %>	
                
        <div class="container-fluid">
            <h1 class="mt-4">My Profile</h1>
            <hr>
            <div>
            
                  <label> <font color="red"> ${updateFailed} </font></label>
					<label> <font color="green"> ${updateSuccessful} </font> </label> 
					<%
						session.removeAttribute("updateFailed");
						session.removeAttribute("updateSuccessful");
					%>
                 	
                 <form action="update" method="post" >
            
                                <div class="form-group ">
                                                <label class="small mb-1" for="inputEmailAddress">CUSTOMER ID</label>
                                        <input type="text" name="cust_id" readonly value="${cust_id}" required class="form-control form-control-user" id="exampleFirstName" placeholder="Full Name">                           
                                </div>
                                <div class="form-group ">
                                                <label class="small mb-1" for="inputEmailAddress">FIRST NAME</label>
                                        <input type="text" name="fname" value="${fname}" required class="form-control form-control-user" id="exampleFirstName" placeholder="Full Name">                           
                                </div>
                                <div class="form-group ">
                                                <label class="small mb-1" for="inputEmailAddress">LAST NAME</label>
                                        <input type="text" name="lname" value="${lname}" required class="form-control form-control-user" id="exampleFirstName" placeholder="Full Name">                           
                                </div>
                                <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                    <input type="email" name="email" readonly value="${uname}" required class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
                                </div>
                                <div class="form-group ">
                                                <label class="small mb-1" for="inputEmailAddress">MOBILE</label>
                                        <input type="tel" maxlength=10 minlength="10" value="${mobile}" name="mobile" required class="form-control form-control-user" id="exampleFirstName" placeholder="Mobile Number">                                
                                </div>
                                <div class="form-group ">
                                                <label class="small mb-1" for="inputEmailAddress">ADDRESS</label>
                                        <input type="text" name="address" maxlength=110 value="${address}" required class="form-control form-control-user" id="exampleFirstName" placeholder="Full Name">                           
                                </div>
                                <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">PASSWORD</label>
                                        <input type="password" name="pass" value="${pword}" required minlength="4" class="form-control form-control-user" id="pass" placeholder="Password">                                    
                                </div>
                                <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">CREATED ON</label>
                                        <input type="text" name="cdate" value="${cdate}" required readonly class="form-control form-control-user" id="pass" placeholder="Password">                                    
                                </div>
                               <input type="submit"  class="btn btn-primary btn-user btn-block"/>
                               <br>
                               <p align="center"><a href="dashboard.jsp">Go To Dashboard</a></p>
                   </form>
                 	
				</div>
				
				
				
              </div>
              
<%@include file="footer.jsp" %>