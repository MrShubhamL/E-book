package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.BookOrder;
import com.entity.Cart;

public class OrderDAO {

	private Connection conn;

	public OrderDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	

	
	public boolean saveOrder(List<BookOrder> blist) {
		boolean f = false;
		try {
			String sql = "insert into book_order (order_id, user_name, email, phone, address, landmark, city, state, pin, book_image, book_name, author, price, payment, Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(BookOrder b: blist) {
				ps.setInt(1, b.getOrderId());
				ps.setString(2, b.getName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getContact());
				ps.setString(5, b.getAddress());
				ps.setString(6, b.getLandmark());
				ps.setString(7, b.getCity());
				ps.setString(8, b.getState());
				ps.setString(9, b.getPin());
				ps.setString(10, b.getBookImage());
				ps.setString(11, b.getBookName());
				ps.setString(12, b.getAuthor());
				ps.setDouble(13, b.getPrice());
				ps.setString(14, b.getPayment());
				ps.setString(15, b.getStatus());
				ps.addBatch();
			}
			int [] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return f;
	}
	
	
	
	public List<BookOrder> getAllOrders(){
		List<BookOrder> list3 = new ArrayList<BookOrder>();
		BookOrder b = null;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);	
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getInt(2));
				b.setName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setContact(rs.getString(5));
				b.setAddress(rs.getString(6));
				b.setLandmark(rs.getString(7));
				b.setCity(rs.getString(8));
				b.setState(rs.getString(9));
				b.setPin(rs.getString(10));
				b.setBookImage(rs.getString(11));
				b.setBookName(rs.getString(12));
				b.setAuthor(rs.getString(13));
				b.setPrice(rs.getDouble(14));
				b.setPayment(rs.getString(15));
				b.setStatus(rs.getString(16));
				list3.add(b);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list3;
	}
	
	public List<BookOrder> getOrderByUser(String email) {
		List<BookOrder> list4 = new ArrayList<BookOrder>();
		BookOrder b = null;
		double total = 0;
		try {
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getInt(2));
				b.setBookImage(rs.getString(11));
				b.setBookName(rs.getString(12));
				b.setAuthor(rs.getString(13));
				b.setPrice(rs.getDouble(14));
				total = total + rs.getDouble(14);
				b.setPrice(total);
				b.setPayment(rs.getString(15));
				b.setStatus(rs.getString(16));
				list4.add(b);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error");
		}
		
		return list4;
		
	}
	public boolean deleteOrder(int oid, String ue) {
		boolean f = false;
		try {
			String sql = "delete from book_order where order_id=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, oid);
			ps.setString(2, ue);
			
			int j  = ps.executeUpdate();
			if(j == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Delete sql Errror...");
		}
		
		return f;
		
	}
	
	public boolean ApproveOrder(BookOrder bo) {
		boolean f = false;
		try {
			String sql = "update book_order set Status=? where order_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bo.getStatus());
			ps.setInt(2, bo.getOrderId());
			
			int i = ps.executeUpdate();
			if( i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return f;
	}
	
}
