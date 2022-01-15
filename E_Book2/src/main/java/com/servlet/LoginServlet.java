package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.AdminDAO;
import com.dao.UserDao;
import com.entity.Admin;
import com.entity.User;



@WebServlet("/userlogin")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			AdminDAO dao2 = new AdminDAO(DBConnection.getConnection());
			UserDao dao = new UserDao(DBConnection.getConnection());
			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			Admin a = dao2.login(email, password);
			if(a != null)
			{
				session.setAttribute("userObj", a);
				resp.sendRedirect("Admin/home.jsp");
			}else {
				
				User u = dao.login(email, password);
				if(u != null) {
					session.setAttribute("user", u);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("invalid", "Invalid Username or Password!.");
					resp.sendRedirect("index.jsp");
				}
							
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
}
