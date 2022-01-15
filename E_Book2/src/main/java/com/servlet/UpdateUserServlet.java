package com.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.conn.DBConnection;
import com.dao.UserDao;
import com.entity.User;



@WebServlet("/updateUser")
@MultipartConfig
public class UpdateUserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(req.getParameter("uid"));
			String name = req.getParameter("name");
			Part part = req.getPart("ProfileImg");
			String filename = part.getSubmittedFileName();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String contact = req.getParameter("contact");
			
			System.out.println(uid + name + filename + email + password + contact);
			
			User u = new User();
			u.setId(uid);
			u.setName(name);
			u.setPhoto(filename);
			u.setEmail(email);
			u.setPassword(password);
			u.setContact(contact);
			
			UserDao dao = new UserDao(DBConnection.getConnection());
			boolean f = dao.updateUser(u);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				String path = getServletContext().getRealPath("") + "Userprofile";
				File file = new File(path);
				part.write(path + File.separator + filename);
				
				session.setAttribute("Successfull", "User Updated Successfully.");
				resp.sendRedirect("userProfile.jsp");
			}
			else {
				session.setAttribute("Error", "Server Error!.");
				resp.sendRedirect("userProfile.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
	
}
