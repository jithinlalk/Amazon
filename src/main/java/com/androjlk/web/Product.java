package com.androjlk.web;

public class Product {
	private String name, manufacturer, imageURL;
	private int price;
	
	public Product(String name, String manufacturer, int price, String imageURL) {
		this.name = name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.imageURL = imageURL;
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
