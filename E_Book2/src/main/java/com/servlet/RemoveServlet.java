package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.CartDAO;



@WebServlet("/removeBook")
public class RemoveServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		try {
			CartDAO dao = new CartDAO(DBConnection.getConnection());
			boolean f = dao.deleteBook(bid,uid);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("Success", "Book Removed from your cart");
				resp.sendRedirect("cart.jsp");
			}
			else {
				
				session.setAttribute("Failed", "Please try again after some time");
				resp.sendRedirect("cart.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
