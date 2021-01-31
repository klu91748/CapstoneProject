package com.example.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TableGenerator;

@Entity
public class UserOrder {

	@TableGenerator(name = "gen", initialValue = 1000000000)
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="gen") 
	int orderNumber;
	
	private String street;
	private String city;
	private String state;
	private String country;
	private int zipCode;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user")
	private User user;
	
	public UserOrder() {
		super();
	}
	public UserOrder(String street, String city, String state, String country, int zipCode, User user) {
		super();
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipCode = zipCode;
		this.user = user;
	}
	public int getOrderNumber() {
		return orderNumber;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
