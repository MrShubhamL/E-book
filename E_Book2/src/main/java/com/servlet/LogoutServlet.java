package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/userlogout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest  req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.removeAttribute("userObj");
		
		session.setAttribute("Logout", "Logout Successfully!..");
		resp.sendRedirect("index.jsp");
	}

	
}
