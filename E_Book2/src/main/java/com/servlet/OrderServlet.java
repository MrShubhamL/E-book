package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.entity.BookOrder;
import com.entity.Cart;



@WebServlet("/OrderNowServlet")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session = req.getSession();
			int uid = Integer.parseInt(req.getParameter("uid"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String contact = req.getParameter("contact");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zip = req.getParameter("zip");
			String payment = req.getParameter("payment");
			String status = "Pending";
			String noselect = req.getParameter("noselect");
			
			CartDAO dao = new CartDAO(DBConnection.getConnection());
			List<Cart> list =  dao.getBookByUser(uid);
			
			if(list.isEmpty()) 
			{
				session.setAttribute("Empty", "Please add product in your cart!.");
				resp.sendRedirect("cart.jsp");
			}
			else
			{
				OrderDAO dao2 = new OrderDAO(DBConnection.getConnection());
				BookOrder o = null;
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
				Random r = new Random();
				for(Cart c: list) {			
					o = new BookOrder();
					o.setOrderId(r.nextInt(1000));
					o.setName(name);
					o.setEmail(email);
					o.setContact(contact);
					o.setAddress(address);
					o.setLandmark(landmark);
					o.setCity(city);
					o.setState(state);
					o.setPin(zip);
					o.setBookImage(c.getBookImg());
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice());
					o.setPayment(payment);
					o.setStatus(status);
					orderList.add(o);
				}
				
				if("noselect".equals(payment)) {
					session.setAttribute("msg", "Please Select Payment Method");
					resp.sendRedirect("cart.jsp");
				}
				else {
					boolean f = dao2.saveOrder(orderList);
					
					if(f) {
						session.setAttribute("msg2", "Order Successfully Created");
						resp.sendRedirect("orderList.jsp");
					}
					else
					{
						System.out.println("Order Failed..");
					}
				}
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
