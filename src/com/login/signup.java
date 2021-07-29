package com.login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.SignupDAO;

@WebServlet("/signup")
public class signup extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		SignupDAO signupDAO = new SignupDAO();
		HttpSession session = request.getSession();

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("mobile");
		String uname = request.getParameter("email");
		String pword = request.getParameter("pass");
		
		if(signupDAO.insertData(fname,lname, uname, phone, pword))
		{
			session.setAttribute("insertSuccessful", "You have Signed Up. Log-in to continue");
			response.sendRedirect("login.jsp");
		}
		else {
			session.setAttribute("insertFailed", "Could not insert data! Try again");
			response.sendRedirect("register.jsp");				
		}
	}

}
