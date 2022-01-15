package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.OrderDAO;



@WebServlet("/removeOrder")
public class RemoveOrderServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int oid = Integer.parseInt(req.getParameter("oid"));
		String ue = req.getParameter("ue");
		try {
			OrderDAO dao = new OrderDAO(DBConnection.getConnection());
			boolean f = dao.deleteOrder(oid, ue);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("Success", oid + " Book Order Removed from Order list of customer " + ue);
				resp.sendRedirect("Admin/orders.jsp");
			}
			else {
				
				session.setAttribute("Failed", "Please try again after some time");
				resp.sendRedirect("Admin/orders.jsp");
			}
			
		} catch (Exception e) {
			System.err.println(e);
		}
	}

}
