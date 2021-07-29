package com.update;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.SignupDAO;
import com.update.dao.UpdateDAO;

@WebServlet("/update")
public class update extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		UpdateDAO updateDAO = new UpdateDAO();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String cust_id = request.getParameter("cust_id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("email");
		String phone = request.getParameter("mobile");
		String pword = request.getParameter("pass");
		String address = request.getParameter("address");
		String cdate = request.getParameter("cdate");
		
		if(updateDAO.insertData( cust_id, fname, lname,  uname,  phone,  pword,  address,  cdate))
		{
			session.setAttribute("updateSuccessful", "Values updated successfully");


			session.setAttribute("cust_id", cust_id);
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("uname", uname);
			session.setAttribute("pword", pword);
			session.setAttribute("mobile", phone);
			session.setAttribute("address", address);
			session.setAttribute("cdate", cdate);
			session.setAttribute("updateSuccessful", "Profile Updated Successfully");
			response.sendRedirect("profile.jsp");
		}
		else {
			session.setAttribute("updateFailed", "Could not update data! Try again");
			response.sendRedirect("profile.jsp");				
		}
	}

}
