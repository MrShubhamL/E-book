package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Admin;
import com.entity.User;

public class AdminDAO {
	private Connection conn;

	public AdminDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean adminRegister(Admin a) {
		boolean f = false;
		
		try {
			String sql = "insert into admin(AdminName,AdminEmail,AdminContact,AdminPassword,AdminPhoto) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, a.getAdminName());
			ps.setString(2, a.getAdminEmail());
			ps.setString(3, a.getAdminContact());
			ps.setString(4, a.getAdminPass());
			ps.setString(5, a.getAdminPhoto());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return f;
	}
	
	public Admin login(String AdminEmail, String AdminPassword) {
		Admin admin = null;
		try {
			String sql = "select * from admin where AdminEmail=? and AdminPassword = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, AdminEmail);
			ps.setString(2, AdminPassword);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt(1));
				admin.setAdminName(rs.getString(2));
				admin.setAdminEmail(rs.getString(3));
				admin.setAdminContact(rs.getString(4));
				admin.setAdminPass(rs.getString(5));
				admin.setAdminPhoto(rs.getString(6));
		
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return admin;
	}
	
	public List<Admin> getAllAdmins(){
		List<Admin> list = new ArrayList<Admin>();
		Admin u = null;
		try {
			String sql3 = "select * from admin";
			PreparedStatement ps = conn.prepareStatement(sql3);
			ResultSet rs = ps.executeQuery();
			int Countrow = 0;
			while(rs.next()){
				Countrow++;
				u = new Admin();
				list.add(u);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}
