package com.androjlk.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

// User DAO
public class UserDao {

	// Add new user credentials to database
	public void addUser(User user) {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			Statement stmt=con.createStatement();  
			stmt.execute("insert into user (username, password, cart) values (\""+user.getUsername()+"\",\""+user.getPassword()+"\",\"\" )");
			con.close();  
		}catch(Exception e){ System.out.println(e);}  
	}
	
	// Verify user credentials
	public User verifyUser(User user) {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			Statement stmt=con.createStatement();  
			ResultSet rs = stmt.executeQuery("select * from user where username = \""+user.getUsername()+"\"");
			int id = 0;
			String username = "", password = "", cart = "";  
			while (rs.next()) {
				id = rs.getInt("id");
				username = rs.getString("username");
				password = rs.getString("password");
				cart = rs.getString("cart");
				}
			con.close();  
			if(password.equals(user.getPassword())){
				return new User(id, username, password, cart);
			}else{
				return null;
			}
		}catch(Exception e){ System.out.println(e);}
		return null;  
	}
}
