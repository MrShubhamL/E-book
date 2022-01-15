package com.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.UserDao;
import com.entity.User;



@WebServlet("/userAddress")
public class AddressServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int uid = Integer.parseInt(req.getParameter("uid"));
			String Address = req.getParameter("address");
			String Landmark = req.getParameter("landmark");
			String City = req.getParameter("city");
			String State = req.getParameter("state");
			String Zip = req.getParameter("pincode");
			
			System.out.println(Address + Landmark + City + State + Zip);
			
			User u = new User();
			u.setId(uid);
			u.setAddress(Address);
			u.setLandmark(Landmark);
			u.setCity(City);
			u.setState(State);
			u.setZip(Zip);
			
			UserDao dao = new UserDao(DBConnection.getConnection());
			boolean f = dao.updateUserAddress(u);
			HttpSession session = req.getSession();
			if(f) {		
				session.setAttribute("Successfull", "Address Updated Successfully.");
				resp.sendRedirect("manageAddress.jsp");
			}
			else {
				session.setAttribute("Error", "Server Error!.");
				resp.sendRedirect("manageAddress.jsp");
			}
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
