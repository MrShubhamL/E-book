package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAO {
	private Connection conn;

	public BookDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addBook(BookDetails bd) {
		boolean f = false;
		try {
			String sql = "insert into book_details(BookName, Author, Price, BookCategory, BookStatus, Photo, AdminEmail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bd.getBookName());
			ps.setString(2, bd.getBookAuthor());
			ps.setString(3, bd.getBookPrice());
			ps.setString(4, bd.getBookCategory());
			ps.setString(5, bd.getBookStatus());
			ps.setString(6, bd.getBookPhoto());
			ps.setString(7, bd.getAdminEmail());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return f;
	}
	
	
public List<BookDetails> getAllBooks() {
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	
	try {
		String sql = "select * from book_details";
		PreparedStatement ps = conn.prepareStatement(sql);
		
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

public BookDetails getBookById(int id) {
	BookDetails b = null;
	try {
		String sql = "select * from book_details where BookId = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
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
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return b;
}

public boolean updateBook(BookDetails b) {
	boolean f = false;
	try {
		String sql = "update book_details set BookName=?,Author=?,Price=?,BookCategory=?,BookStatus=?,Photo=? where BookId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, b.getBookName());
		ps.setString(2, b.getBookAuthor());
		ps.setString(3, b.getBookPrice());
		ps.setString(4, b.getBookCategory());
		ps.setString(5, b.getBookStatus());
		ps.setString(6, b.getBookPhoto());
		ps.setInt(7, b.getId());
		
		int i = ps.executeUpdate();
		if( i==1) {
			f = true;
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return f;
}

public boolean deleteBook(int id) {
	boolean f= false;
	try {
		String sql = "delete from book_details where BookId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

public List<BookDetails> getNewBook(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql3 = "select * from book_details where BookCategory=? and BookStatus=? order by BookId DESC";
		PreparedStatement ps = conn.prepareStatement(sql3);
		ps.setString(1, "New");
		ps.setString(2, "Active");
		
		ResultSet rs = ps.executeQuery();
		int i = 1;
		while(rs.next() && i<=4) {
			i++;
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
public List<BookDetails> getRecentBook(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql = "select * from book_details where BookStatus = ? order by BookId DESC";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "Active");	
		ResultSet rs = ps.executeQuery();
		int i = 1;
		while(rs.next() && i<=4) {
			i++;
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

public List<BookDetails> getTotalNewBoks(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql3 = "select * from book_details";
		PreparedStatement ps = conn.prepareStatement(sql3);
		
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while(rs.next()) {
			count++;
			b = new BookDetails();
			list.add(b);
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	return list;
}

public List<BookDetails> getTotalOldBoks(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql3 = "select * from sellbooks";
		PreparedStatement ps = conn.prepareStatement(sql3);
		
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while(rs.next()) {
			count++;
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

public boolean sellBook(BookDetails bd) {
	boolean f = false;
	try {
		String sql = "insert into sellbooks (BookName, AuthorName, Price, BookCategory, BookStatus, BookImage, UserEmail) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, bd.getBookName());
		ps.setString(2, bd.getBookAuthor());
		ps.setString(3, bd.getBookPrice());
		ps.setString(4, bd.getBookCategory());
		ps.setString(5, bd.getBookStatus());
		ps.setString(6, bd.getBookPhoto());
		ps.setString(7, bd.getAdminEmail());
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
	} catch (Exception e) {
		System.out.println(e);
	}	
	return f;
}

public List<BookDetails> getOldBook(){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql = "select * from sellbooks where BookCategory = ? and BookStatus = ? order by sellId DESC";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "Old");	
		ps.setString(2, "Active");	
		ResultSet rs = ps.executeQuery();
		int i = 1;
		while(rs.next() && i<=4) {
			i++;
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

public BookDetails getSellBookById(int id) {
	BookDetails b = null;
	try {
		String sql = "select * from sellbooks where sellId = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
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
		}
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
	return b;
}

public List<BookDetails> getSellBook(String UserEmail){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql = "select * from sellbooks where BookCategory = ? and UserEmail = ? order by sellId DESC";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "Old");	
		ps.setString(2, UserEmail);	
		ResultSet rs = ps.executeQuery();

		while(rs.next() ) {
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

public boolean deletesellBook(int sellId) {
	boolean f= false;
	try {
		String sql = "delete from sellbooks where sellId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, sellId);
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

public List<BookDetails> getBookBySearch(String ch){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql = "select * from book_details where BookName like ? or Author like ? and BookStatus=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+ch+"%");	
		ps.setString(2, "%"+ch+"%");	
		ps.setString(3, "Active");	
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

public List<BookDetails> getOldBookBySearch(String ch){
	List<BookDetails> list = new ArrayList<BookDetails>();
	BookDetails b = null;
	try {
		String sql = "select * from sellbooks where BookName like ? or AuthorName like ? and BookStatus=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+ch+"%");	
		ps.setString(2, "%"+ch+"%");	
		ps.setString(3, "Active");	
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
