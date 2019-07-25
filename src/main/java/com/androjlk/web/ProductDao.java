package com.androjlk.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

	 public List<Product> getAllProducts() {
		 
		 try{
	        List<Product> productList = new ArrayList<Product>();
	        String sql = "select * from product";
	        Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	         
	        Statement statement = con.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	         
	        while (resultSet.next()) {
	        	int id = resultSet.getInt("id");
	            String name = resultSet.getString("name");
	            String manufacturer = resultSet.getString("manufacturer");
	            int price = resultSet.getInt("price");
	            String imageURL =  resultSet.getString("imageURL");
	            
	            Product product = new Product(id, name, manufacturer, price, imageURL);
	            productList.add(product);
	        }
	         
	        resultSet.close();
	        statement.close();
	         
	        con.close();
	         
	        return productList;
	        
		 }catch(Exception e){ System.out.println(e);}
	 
		 return null;
		 
	    }
	 
}
