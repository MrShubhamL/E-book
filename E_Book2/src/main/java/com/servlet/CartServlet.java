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
import com.dao.CartDAO;
import com.entity.BookDetails;
import com.entity.Cart;


@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bookId = Integer.parseInt(req.getParameter("bid"));
			int userId = Integer.parseInt(req.getParameter("uid"));
			
			BookDAO dao = new BookDAO(DBConnection.getConnection());
			BookDetails b = dao.getBookById(bookId);
			
			Cart c = new Cart();
			c.setBookId(bookId);
			c.setUserId(userId);
			c.setBookName(b.getBookName());			
			c.setBookImg(b.getBookPhoto());
			c.setAuthor(b.getBookAuthor());
			c.setPrice(Double.parseDouble(b.getBookPrice()));
			c.setTotalPrice(Double.parseDouble(b.getBookPrice()));
			
			CartDAO dao2 = new CartDAO(DBConnection.getConnection());
			boolean f = dao2.addCart(c);
			HttpSession session = req.getSession();
			if(f) {
				
				session.setAttribute("addCart", "Book Added Successfully");
				resp.sendRedirect("allNewBooks.jsp");
			}
			else {
				
				session.setAttribute("Error", "Server error try again");
				resp.sendRedirect("allNewBooks.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
