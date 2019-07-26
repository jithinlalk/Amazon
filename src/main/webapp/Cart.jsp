<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="com.androjlk.web.Product" %>
<%@ page import="com.androjlk.web.User" %>
<%@ page import="com.androjlk.web.UserDao" %>
<%@page import= "java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@page import ="java.io.PrintWriter" %>
<%@page import="java.util.*" %>

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
</style>
</head>
<body>
<% User user = (User) session.getAttribute("user"); UserDao userD = new UserDao(); %>
<div style="display:flex;">
<h1 class="center">AMAZON</h1>



<div style="margin:auto;">
	<table border="1" cellpadding="5">
        <caption><h2>Cart</h2></caption>
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Price</th>
                <th>Count</th>
                <th>Total</th>
            </tr>
            
 <% List<Product> productList = (ArrayList)session.getAttribute("productList");
 	String cart = user.getCart();
 	
 	Hashtable<Integer, String> h = new Hashtable<Integer, String>(); 
 	
 	String carts[] = cart.substring(1).split("-");
	for(int i=0;i<carts.length;i++){
			String q[] = carts[i].split(",");
			h.put(Integer.parseInt(q[0]),q[1]);
	}
 	
 	
 	
 	
 	
 	
 	for (int i = 1; i <= productList.size(); i++) { Product product = productList.get(i-1);
 	if(cart.contains("-"+product.getId())){
 	
 	%>

<tr>
                    <td class = "phone" background="<%= product.getImageURL()%>"><c:out value=""  /></td>
                    <td><c:out value="<%= product.getName() %>" /></td>
                    <td><c:out value="<%= product.getPrice() %>" /></td>
                    <td><c:out value="" />
                    <div style="display:flex;" >
                    <button id="<%= i %>0" onclick="updateCart(this.id,0,'<%= product.getId() %>','<%=h.get(product.getId())%>')">-</button>
                    <div style="padding:5px;" id="<%= i %>"><%= h.get(product.getId()) %></div>
                    <button id="<%= i %>00" onclick="updateCart(this.id,1,'<%= product.getId() %>','<%=h.get(product.getId())%>')">+</button>
                    </div>
                    </td>      
                    
                    <td><c:out value="" /> 
                    <% int tot = product.getPrice()*Integer.parseInt(h.get(product.getId())); %>
                    <div> <%= tot %> </div>
                    </td>
                    
                    
                    <td><c:out value="" />
                   <input type="checkbox" onclick="myFunction(this,'<%= product.getId() %>')"
                   <% if(user.getCart().contains("-"+product.getId())) 
                	   {
                	   %>
                	   checked
                	  <% }%>
                   >
                     </td>
                </tr>
                

<% }} %>
          
        </table>
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

function updateCart(t,a,pId,i) {

	 var url="updateCart.jsp?uId="+<%= user.getId() %>+"&pId="+pId+"&flag="+a; 
	 
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