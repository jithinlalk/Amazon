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
<%! 
public String asdf(){ return "jlk"; } 
%>
<%!				
   public int calculate(int x, int y, JspWriter jw, HttpServletRequest r1) throws Exception
   {
     jw.println("Hello 1<br>");
     String clientName = r1.getParameter("t1");
     return x * y;
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Amazon</title>
<style>
.phone {
  width: 120px;
  height: 160px;
  background-size: contain;
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
<% User user = (User) request.getAttribute("user"); UserDao userD = new UserDao(); %>
<div style="display:flex;">
<h1 class="center">AMAZON</h1>



<div style="margin:auto;">
	<table border="1" cellpadding="5">
        <caption><h2>List of Products</h2></caption>
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Manufacturer</th>
                <th>Price</th>
                <th>Add to Cart</th>
            </tr>
            
 <% List<Product> productList = (ArrayList)request.getAttribute("productList"); 
 	for (int i = 0; i < productList.size(); i++) { Product product = productList.get(i); %>

<tr>
                    <td class = "phone" background="<%= product.getImageURL()%>"><c:out value=""  /></td>
                    <td><c:out value="<%= product.getName() %>" /></td>
                    <td><c:out value="<%= product.getManufacturer() %>" /></td>
                    <td><c:out value="<%= product.getPrice() %>" /></td>
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
                

<% } %>
          
        </table>
    </div>   





<div style="width:200px;">
<h4>Welcome <%= user.getUsername() %> </h4>

 <form>
<input type="button" value="Cart" onclick="window.location.href='Cart.jsp?uId=<%= user.getId() %>'" />
</form> 
<br>
<a href="index.jsp">Logout</a>
</div>
</div>

 
<script>

var request;  

function myFunction(a,pId) {
  var flag;
	if (a.checked == true){
    flag = 1;
  } else {
	  flag=0;
  }
  
	 var url="updateCart.jsp?uId="+<%= user.getId() %>+"&pId="+pId+"&flag="+flag; 
	 
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