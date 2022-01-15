package com.entity;

public class BookDetails {
private int id;
private String bookName;
private String bookAuthor;
private String bookPrice;
private String bookCategory;
private String bookStatus;
private String bookPhoto;
private String adminEmail;

public BookDetails(int id, String bookName, String bookAuthor, String bookPrice, String bookCategory, String bookStatus, String bookPhoto,
		String adminEmail) {
	super();
	this.id = id;
	this.bookName = bookName;
	this.bookAuthor = bookAuthor;
	this.bookPrice = bookPrice;
	this.bookCategory = bookCategory;
	this.bookStatus = bookStatus;
	this.bookPhoto = bookPhoto;
	this.adminEmail = adminEmail;
}


public BookDetails() {
	// TODO Auto-generated constructor stub
}


public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getBookAuthor() {
	return bookAuthor;
}
public void setBookAuthor(String bookAuthor) {
	this.bookAuthor = bookAuthor;
}
public String getBookPrice() {
	return bookPrice;
}
public void setBookPrice(String bookPrice) {
	this.bookPrice = bookPrice;
}

public String getBookCategory() {
	return bookCategory;
}
public void setBookCategory(String bookCategory) {
	this.bookCategory = bookCategory;
}

public String getBookStatus() {
	return bookStatus;
}

public void setBookStatus(String bookStatus) {
	this.bookStatus = bookStatus;
}


public String getBookPhoto() {
	return bookPhoto;
}
public void setBookPhoto(String bookPhoto) {
	this.bookPhoto = bookPhoto;
}
public String getAdminEmail() {
	return adminEmail;
}
public void setAdminEmail(String adminEmail) {
	this.adminEmail = adminEmail;
}




@Override
public String toString() {
	return "BookDetails [id=" + id + ", bookName=" + bookName + ", bookAuthor=" + bookAuthor + ", bookPrice="
			+ bookPrice + ", bookCategory=" + bookCategory + ", bookPhoto=" + bookPhoto + ", adminEmail=" + adminEmail
			+ "]";
}


}
