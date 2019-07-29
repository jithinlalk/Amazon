<!-- Cart page -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.stream.Stream"%>
<%@ page import="com.androjlk.web.Product" %>
<%@ page import="com.androjlk.web.User" %>
<%@ page import="com.androjlk.web.UserDao" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazon</title>
        <style>
            .phone {
            width: 30px;
            height: 40px;
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            }
            .center {
            height: min-content;
            width: min-content;
            background-color: powderblue;
            border: 3px solid #000000;
            padding: 20px;
            }
            .num {
            width: 50px;
            color: transparent;
            text-shadow: 0 0 0 #2196f3;
            &:focus {
            outline: none;
            }
            }
        </style>
    </head>
    <body>
    	<!-- Get user data from session variable -->
        <% User user = (User) session.getAttribute("user"); UserDao userD = new UserDao(); %>
        <div style="display:flex;">
            <h1 class="center">AMAZON</h1>
            <div style="margin:auto;">
                <table border="1" cellpadding="5" id="tab">
                    <caption>
                        <h2>Cart</h2>
                    </caption>
                    <tr>
                        <th>Image</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Count</th>
                        <th>Total</th>
                    </tr>
                    <!-- Get list of products from session variable -->
                    <%  List<Product> productList = (ArrayList)session.getAttribute("productList");
                        String cart = user.getCart();
                        
                        // Hashtable for storing number of units of product corresponding to product id
                        Hashtable<Integer, String> h = new Hashtable<Integer, String>(); 
                        
                        if(cart.length()>0){
                        String carts[] = cart.substring(1).split("-");
                        Stream<String> stream = Arrays.stream(carts);
                        stream.forEach(c -> {
                        	String q[] = c.split(",");
                        h.put(Integer.parseInt(q[0]),q[1]);
                        }); 
                        }
                        
                        // Loop through the products list which are added to cart
                        for (int i = 1; i <= productList.size(); i++) { Product product = productList.get(i-1);
                        if(cart.contains("-"+product.getId())){ %>
                        
                    <tr>
                        <td class = "phone" background="<%= product.getImageURL() %>">
                            <c:out value=""  />
                        </td>
                        <td>
                            <c:out value="<%= product.getName() %>" />
                        </td>
                        <td>
                            <c:out value="<%= product.getPrice() %>" />
                        </td>
                        <!-- Update number of units of a product in cart
                             Call function 'updateCart' on changing the number of units -->
                        <td><input class="num" type="number" min="1" max="20" onKeyDown="return false" 
                            value="<%= h.get(product.getId()) %>"
                            onChange="updateCart(this,'<%= product.getId() %>','<%= product.getPrice() %>','<%=i%>')"/>
                            </td>
                        <td>
                        	<!-- Total price of a product -->
                            <% int tot = product.getPrice()*Integer.parseInt(h.get(product.getId())); %>
                            <div id="<%=i%>"> <%= tot %> </div>
                        </td>
                    </tr>
                    <% }} %>
                </table>
                <br>
                <!-- Total price of all the products -->
                <%
                    int total=0;
                    for (int i = 1; i <= productList.size(); i++) { Product product = productList.get(i-1);
                    if(cart.contains("-"+product.getId())){
                    total += product.getPrice()*Integer.parseInt(h.get(product.getId()));
                    
                    }} %>
                    
                <div id = "total">
                    <h3>Total = <%= total %></h3>
                </div>
            </div>
            <div style="width:200px;">
                <h4>Welcome <%= user.getUsername() %> </h4>
                <form>
                    <input type="button" value="Home" onclick="window.location.href='Home.jsp?uId=<%= user.getId() %>'" />
                </form>
                <br>
                <a href="index.jsp">Logout</a>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script>
            var request;  
            
            function updateCart(t,pId,pPrice,i) {
            	
            	// Total price of a product is updated
            	document.getElementById(i).innerHTML = parseInt(pPrice)*parseInt(t.value);
            	
            	// Total price of all the products id stored in 'tot'
            	var tot = 0;
            	var table = document.getElementById("tab");
            	for (var i = 1, row; row = table.rows[i]; i++) {
            		tot += parseInt(row.cells[4].innerText);
            	}
            	
            	// Total price of all the products is updated
            	document.getElementById("total").innerHTML = "<h3>Total = "+ tot+"</h3";
            	
            	var url="updateCart.jsp?uId="+<%= user.getId() %>+"&pId="+pId+"&flag="+t.value; 
            	 
            	if(window.XMLHttpRequest){  
            		request=new XMLHttpRequest();  
            		}  
            		else if(window.ActiveXObject){  
            		request=new ActiveXObject("Microsoft.XMLHTTP");  
            		}  
            	  
            	try{  
            	 	request.onreadystatechange=getInfo;  
            	 	request.open("GET",url,true);  
            	 	request.send();  
            	 	}catch(e){alert("Unable to connect to server");}  
            	}  
            	   
            function getInfo(){  
            	if(request.readyState==4){  
            	var val=request.responseText;    
            	}  
            }  
            	   
        </script>
    </body>
</html>

