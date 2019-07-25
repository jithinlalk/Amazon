package com.androjlk.web;

public class User {
	private int id;
	private String username, password, cart;
	public User(int id, String username, String password, String cart) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.cart = cart;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCart() {
		return cart;
	}
	public void setCart(String cart) {
		this.cart = cart;
	}
}
