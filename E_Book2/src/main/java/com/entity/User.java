package com.entity;

public class User {
int id;
String name;
String email;
String contact;
String password;
String photo;
String address;
String landmark;
String city;
String state;
String zip;






public User(int id, String name, String email, String contact, String password, String photo, String address,
		String landmark, String city, String state, String zip) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.contact = contact;
	this.password = password;
	this.photo = photo;
	this.address = address;
	this.landmark = landmark;
	this.city = city;
	this.state = state;
	this.zip = zip;
}






public User() {
	// TODO Auto-generated constructor stub
}






public int getId() {
	return id;
}






public void setId(int id) {
	this.id = id;
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






public String getPassword() {
	return password;
}






public void setPassword(String password) {
	this.password = password;
}






public String getPhoto() {
	return photo;
}






public void setPhoto(String photo) {
	this.photo = photo;
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






public String getZip() {
	return zip;
}






public void setZip(String zip) {
	this.zip = zip;
}






@Override
public String toString() {
	return "UserDao [id=" + id + ", name=" + name + ", email=" + email + ", contact=" + contact + ", password="
			+ password + ", photo=" + photo + ", address=" + address + ", landmark=" + landmark + ", city=" + city
			+ ", state=" + state + ", zip=" + zip + "]";
}












}
