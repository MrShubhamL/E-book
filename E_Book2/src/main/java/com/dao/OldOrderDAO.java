package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class OldOrderDAO {
	private Connection conn;

	public OldOrderDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addOrder(BookOrder b) {
		boolean f = false;
		try {
			String sql = "insert into old_book_order (OrderId, SellerContact, CustomerName, Email, Contact, Address, State, City, Zip, BookName, BookImage, BookAuthor, Price, OrderStatus)"
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, b.getOrderId());
				ps.setString(2, b.getSellerContact());
				ps.setString(3, b.getName());
				ps.setString(4, b.getEmail());
				ps.setString(5, b.getContact());
				ps.setString(6, b.getAddress());
				ps.setString(7, b.getState());
				ps.setString(8, b.getCity());
				ps.setString(9, b.getPin());
				ps.setString(10, b.getBookName());
				ps.setString(11, b.getBookImage());
				ps.setString(12, b.getAuthor());
				ps.setDouble(13, b.getPrice());
				ps.setString(14, b.getStatus());
				
				int i = ps.executeUpdate();
				if(i==1) {
					f = true;
				}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return f;
	}
	
	public List<BookOrder> getOrderBySeller(String email) {
		List<BookOrder> list4 = new ArrayList<BookOrder>();
		BookOrder b = null;
		double total = 0;
		try {
			String sql = "select * from old_book_order where SellerContact=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getInt(2));
				b.setSellerContact(rs.getString(3));
				b.setName(rs.getString(4));
				b.setEmail(rs.getString(5));
				b.setContact(rs.getString(6));
				b.setAddress(rs.getString(7));
				b.setState(rs.getString(8));
				b.setCity(rs.getString(9));
				b.setPin(rs.getString(10));
				b.setBookName(rs.getString(11));
				b.setBookImage(rs.getString(12));
				b.setAuthor(rs.getString(13));
				
				b.setPrice(rs.getDouble(14));
				total = total + rs.getDouble(14);
				b.setPrice(total);
				b.setStatus(rs.getString(15));
				
//				b.setPayment(rs.getString(15));
//				b.setStatus(rs.getString(16));
				list4.add(b);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error");
		}
		
		return list4;
		
	}
	
}
