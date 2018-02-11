package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contact")
public class Contact {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="contactId")
	private int contactId;
	
	
	@Column(name="firstName")
	private String firstName;
	@Column(name="middleName")
	private String middleName;
	@Column(name="lastName")
	private String lastName;
	@Column(name="telephone")
	private String telephone;
	@Column(name="email")
	private String email;
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int id) {
		this.contactId = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
