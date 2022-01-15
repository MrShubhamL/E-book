package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User u)
	{
		boolean f = false;
		try {
			String sql = "insert into registration(full_name, email, contact, "
					+ "password, photo, address, landmark, city, state, zip) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getContact());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getPhoto());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getLandmark());
			ps.setString(8, u.getCity());
			ps.setString(9, u.getState());
			ps.setString(10, u.getZip());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return f;
	}
	
public User login(String email, String password) {
	User user = null;
	try {
		String sql = "select * from registration where email=? and password = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setContact(rs.getString(4));
			user.setPassword(rs.getString(5));
			user.setPhoto(rs.getString(6));
			user.setAddress(rs.getString(7));
			user.setLandmark(rs.getString(8));
			user.setCity(rs.getString(9));
			user.setState(rs.getString(10));
			user.setZip(rs.getString(11));
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return user;
}

public boolean updateUser(User u) {
	boolean f = false;
	try {
		String sql = "update registration set full_name =?, email=?, contact=?, password=?, photo=? where id=?" ;
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, u.getName());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getContact());
		ps.setString(4, u.getPassword());
		ps.setString(5, u.getPhoto());
		ps.setInt(6, u.getId());
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return f;
}

public boolean updateUserAddress(User u) {
	boolean f = false;
	try {
		String sql = "update registration set address=?, landmark=?, city=?, state=?, zip=? where id=?" ;
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, u.getAddress());
		ps.setString(2, u.getLandmark());
		ps.setString(3, u.getCity());
		ps.setString(4, u.getState());
		ps.setString(5, u.getZip());
		ps.setInt(6, u.getId());
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return f;
}

public List<User> getAllUsers(){
	List<User> list = new ArrayList<User>();
	User u = null;
	try {
		String sql3 = "select * from registration";
		PreparedStatement ps = conn.prepareStatement(sql3);
		ResultSet rs = ps.executeQuery();
		int Countrow = 0;
		while(rs.next()){
			Countrow++;
			u = new User();
			list.add(u);
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	return list;
}
	
}
