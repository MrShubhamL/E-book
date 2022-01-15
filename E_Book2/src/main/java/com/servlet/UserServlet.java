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



@WebServlet("/userregister")
@MultipartConfig
public class UserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String contact = req.getParameter("contact");
		String password = req.getParameter("password");
		Part part = req.getPart("myimg");
		String filename = part.getSubmittedFileName();
		
		String address = req.getParameter("address");
		String landmark = req.getParameter("landmark");
		String city  = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		
		
		User u = new User();
		u.setName(name);
		u.setEmail(email);
		u.setContact(contact);
		u.setPassword(password);
		u.setPhoto(filename);
		u.setAddress(address);
		u.setLandmark(landmark);
		u.setCity(city);
		u.setState(state);
		u.setZip(zip);
		
		HttpSession session = req.getSession();
		
		try {
			UserDao dao = new UserDao(DBConnection.getConnection());
			boolean f = dao.userRegister(u);
			
			if(f) {
				
				String path = getServletContext().getRealPath("") + "Userprofile";
				File file = new File(path);
				part.write(path + File.separator + filename);
				
				session.setAttribute("Successfull", "User Register Successfully.");
				resp.sendRedirect("register.jsp");
			}
			else {
				session.setAttribute("Error", "User Already Exist.");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
