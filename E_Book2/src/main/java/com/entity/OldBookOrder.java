package com.entity;

public class OldBookOrder {
private int id;
private int orderId;
private String customerName;
private String customerEmail;
private String contact;
private String address;
private String state;
private String city;
private String zip;
private String bookName;
private String bookImage;
private String BookAuthor;
private Double price;


public OldBookOrder() {
	super();
	// TODO Auto-generated constructor stub
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public int getOrderId() {
	return orderId;
}


public void setOrderId(int orderId) {
	this.orderId = orderId;
}


public String getCustomerName() {
	return customerName;
}


public void setCustomerName(String customerName) {
	this.customerName = customerName;
}


public String getCustomerEmail() {
	return customerEmail;
}


public void setCustomerEmail(String customerEmail) {
	this.customerEmail = customerEmail;
}


public String getContact() {
	return contact;
}


public void setContact(String contact) {
	this.contact = contact;
}


public String getAddress() {
	return address;
}


public void setAddress(String address) {
	this.address = address;
}


public String getState() {
	return state;
}


public void setState(String state) {
	this.state = state;
}


public String getCity() {
	return city;
}


public void setCity(String city) {
	this.city = city;
}


public String getZip() {
	return zip;
}


public void setZip(String zip) {
	this.zip = zip;
}


public String getBookName() {
	return bookName;
}


public void setBookName(String bookName) {
	this.bookName = bookName;
}


public String getBookImage() {
	return bookImage;
}


public void setBookImage(String bookImage) {
	this.bookImage = bookImage;
}


public String getBookAuthor() {
	return BookAuthor;
}


public void setBookAuthor(String bookAuthor) {
	BookAuthor = bookAuthor;
}


public Double getPrice() {
	return price;
}


public void setPrice(Double price) {
	this.price = price;
}


@Override
public String toString() {
	return "OldBookOrder [id=" + id + ", orderId=" + orderId + ", customerName=" + customerName + ", customerEmail="
			+ customerEmail + ", contact=" + contact + ", address=" + address + ", state=" + state + ", city=" + city
			+ ", zip=" + zip + ", bookName=" + bookName + ", bookImage=" + bookImage + ", BookAuthor=" + BookAuthor
			+ ", price=" + price + "]";
}



}
