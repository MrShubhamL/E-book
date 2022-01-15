package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.BookDAO;



@WebServlet("/removeSellBook")
public class RemoveSellBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));

		try {
			BookDAO dao = new BookDAO(DBConnection.getConnection());
			boolean f= dao.deletesellBook(bid);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("Success", "Book Removed from your Selling List");
				resp.sendRedirect("UserSoldBooks.jsp");
			}
			else {
				
				session.setAttribute("Failed", "Please try again after some time");
				resp.sendRedirect("UserSoldBooks.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
