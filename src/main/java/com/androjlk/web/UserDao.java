package com.androjlk.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDao {

	public void addUser(User user) {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			Statement stmt=con.createStatement();  
			stmt.execute("insert into user (username, password) values (\""+user.getUsername()+"\",\""+user.getPassword()+"\")");
			con.close();  
		}catch(Exception e){ System.out.println(e);}  
	}
	
	public boolean varifyUser(User user) {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			Statement stmt=con.createStatement();  
			ResultSet rs = stmt.executeQuery("select password from user where username = \""+user.getUsername()+"\"");
			String password = "not";  
			while (rs.next()) {
				password = rs.getString("password");
				}
			con.close();  
			if(password.equals(user.getPassword())){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){ System.out.println(e);}
		return false;  
	}
	
}
