package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDAO {
	private Connection conn;

	public CartDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
public boolean addCart(Cart c) {
	boolean f = false;
	try {
		String sql = "insert into cart (bookId,userId,bookName, bookImg, author,price,totalPrice) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, c.getBookId());
		ps.setInt(2, c.getUserId());
		ps.setString(3, c.getBookName());
		ps.setString(4, c.getBookImg());
		ps.setString(5, c.getAuthor());
		ps.setDouble(6, c.getPrice());
		ps.setDouble(7, c.getTotalPrice());
		
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}

	} catch (Exception e) {
		System.out.println(e);
	}

	return f;
}
	
public List<Cart> getBookByUser(int userId) {
	List<Cart> list = new ArrayList<Cart>();
	Cart c = null;
	double total = 0;
	try {
		String sql = "select * from cart where userId = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			c = new Cart();
			c.setCartId(rs.getInt(1));
			c.setBookId(rs.getInt(2));
			c.setUserId(rs.getInt(3));
			c.setBookName(rs.getString(4));
			c.setBookImg(rs.getString(5));
			c.setAuthor(rs.getString(6));
			c.setPrice(rs.getDouble(7));
			total = total + rs.getDouble(8);
			c.setTotalPrice(total);
			list.add(c);
		}
		
	} catch (Exception e) {
		System.out.println(e);
		System.out.println("Error");
	}
	
	
	return list;
	
}
	
public boolean deleteBook(int bid, int uid) {
	boolean f = false;
	try {
		String sql = "delete from cart where bookId=? and userId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, bid);
		ps.setInt(2, uid);
		
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
}
