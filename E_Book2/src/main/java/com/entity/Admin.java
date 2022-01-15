package com.entity;

public class Admin {
int id;
String adminName;
String adminEmail;
String adminContact;
String adminPass;
String adminPhoto;


public Admin(int id, String adminName, String adminEmail, String adminContact, String adminPass, String adminPhoto) {
	super();
	this.id = id;
	this.adminName = adminName;
	this.adminEmail = adminEmail;
	this.adminContact = adminContact;
	this.adminPass = adminPass;
	this.adminPhoto = adminPhoto;
}


public Admin() {
	// TODO Auto-generated constructor stub
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getAdminName() {
	return adminName;
}


public void setAdminName(String adminName) {
	this.adminName = adminName;
}


public String getAdminEmail() {
	return adminEmail;
}


public void setAdminEmail(String adminEmail) {
	this.adminEmail = adminEmail;
}


public String getAdminContact() {
	return adminContact;
}


public void setAdminContact(String adminContact) {
	this.adminContact = adminContact;
}


public String getAdminPass() {
	return adminPass;
}


public void setAdminPass(String adminPass) {
	this.adminPass = adminPass;
}


public String getAdminPhoto() {
	return adminPhoto;
}


public void setAdminPhoto(String adminPhoto) {
	this.adminPhoto = adminPhoto;
}


@Override
public String toString() {
	return "Admin [id=" + id + ", adminName=" + adminName + ", adminEmail=" + adminEmail + ", adminContact="
			+ adminContact + ", adminPass=" + adminPass + ", adminPhoto=" + adminPhoto + "]";
}




}
