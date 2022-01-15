package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class NewBooksDAO {
private Connection conn;

public NewBooksDAO(Connection conn) {
	super();
	this.conn = conn;
}

public List<BookDetails> getAllNewBooks(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql3 = "select * from book_details where BookCategory=? and BookStatus=? order by BookId DESC";
		PreparedStatement ps = conn.prepareStatement(sql3);
		ps.setString(1, "New");
		ps.setString(2, "Active");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
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
