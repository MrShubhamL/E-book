package com.entity;

public class BookOrder {

	private int id;
	private int orderId;
	private String sellerContact;
	private String name;
	private String email;
	private String contact;
	private String address;
	private String landmark;
	private String city;
	private String state;
	private String pin;
	private String bookName;
	private String bookImage;
	private String author;
	private Double price;
	private String payment;
	private String status;
	
	
	public BookOrder() {
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
	
	
	public String getSellerContact() {
		return sellerContact;
	}
	
	public void setSellerContact(String sellerContact) {
		this.sellerContact = sellerContact;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getLandmark() {
		return landmark;
	}


	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getPin() {
		return pin;
	}


	public void setPin(String pin) {
		this.pin = pin;
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


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}

	
	

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", sellerContact=" + sellerContact + ", name=" + name
				+ ", email=" + email + ", contact=" + contact + ", address=" + address + ", landmark=" + landmark
				+ ", city=" + city + ", state=" + state + ", pin=" + pin + ", bookName=" + bookName + ", bookImage="
				+ bookImage + ", author=" + author + ", price=" + price + ", payment=" + payment + ", status=" + status
				+ "]";
	}



	
	
	

	

	
	
	

	
	
	
	
	
}
