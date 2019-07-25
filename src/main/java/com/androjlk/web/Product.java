package com.androjlk.web;

public class Product {
	private String name, manufacturer, imageURL;
	private int id, price;
	
	public Product(int id, String name, String manufacturer, int price, String imageURL) {
		this.id = id;
		this.name = name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.imageURL = imageURL;
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
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
