package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.BookDAO;
import com.dao.OldOrderDAO;
import com.entity.BookDetails;
import com.entity.BookOrder;
import com.entity.OldBookOrder;



@WebServlet("/oldBookOrderServlet")
public class OldOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int oid = Integer.parseInt(req.getParameter("oid"));
			
			BookDAO dao = new BookDAO(DBConnection.getConnection());
			BookDetails b = dao.getBookById(oid);
			
			String sellerContact = b.getAdminEmail();
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String contact = req.getParameter("contact");
			String address = req.getParameter("address");
			String state = req.getParameter("state");
			String city = req.getParameter("city");
			String zip = req.getParameter("zip");
			String bookname = b.getBookName();
			String bookimage = b.getBookPhoto();
			String bookauthor = b.getBookAuthor();
			double price = Double.parseDouble((b.getBookPrice()));
			String OrderStatus = "Pendding";
			System.out.println(name + " " + email + " "  + contact + address + state + city + zip +
					bookname + bookimage + bookauthor + price);
			
			Random r = new Random();
			BookOrder ob = new BookOrder();
			
			ob.setOrderId(r.nextInt(1000));
			ob.setSellerContact(sellerContact);
			ob.setName(name);
			ob.setEmail(email);
			ob.setContact(contact);
			ob.setAddress(address);
			ob.setState(state);
			ob.setCity(city);
			ob.setPin(zip);
			ob.setBookName(bookname);
			ob.setBookImage(bookimage);
			ob.setAuthor(bookauthor);
			ob.setPrice(price);
			ob.setStatus(OrderStatus);
			
			OldOrderDAO dao2 = new OldOrderDAO(DBConnection.getConnection());
			boolean f = dao2.addOrder(ob);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("Successfull", "Order send Successfully.");
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("invalid", "Order Already Exist.");
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error..");
		}
	}

}
