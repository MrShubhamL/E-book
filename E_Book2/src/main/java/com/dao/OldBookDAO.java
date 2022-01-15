package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class OldBookDAO {
	private Connection conn;

	public OldBookDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<BookDetails> getRecentOldBook(){
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from sellbooks where BookStatus = ? order by sellId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");	
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b = new BookDetails();
				b.setId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setBookAuthor(rs.getString(3));
				b.setBookPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhoto(rs.getString(7));
				b.setAdminEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
}
