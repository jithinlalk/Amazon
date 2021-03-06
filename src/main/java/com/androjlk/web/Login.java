package com.androjlk.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Verify user credentials
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		UserDao userD = new UserDao();
		User user = userD.verifyUser(new User(0, username, password, ""));
		
		if(user != null){
			// If user exist
			
			ProductDao productD = new ProductDao();
			List<Product> productList = productD.getAllProducts();
			
			// Store user details and product details in session variables
			HttpSession session=request.getSession();  
			session.setAttribute("user", user);
			session.setAttribute("productList", productList);
	       
			// Redirect to Home page
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
			
		}else{
			// If user doesn't exist
			// Show alert box
			response.setContentType("text/html"); 
			PrintWriter out = response.getWriter();
			out.println("<script>");
		    out.println("alert('Invalid Username or Password');");
	    	out.println("location='index.jsp';");
			out.println("</script>");
	
		}
	
	}

}
