<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="com.androjlk.web.Product" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Amazon</title>
<style>
.phone {
  width: 120px;
  height: 160px;
}
.center {
  margin: auto;
  width: max-content;
  border: 3px solid #000000;
  padding: 20px;
}
</style>
</head>
<body>
<h1 class="center">AMAZON</h1>
<h4 style="margin: auto;width:max-content;">Welcome <%= request.getAttribute("username") %> </h4>

<div align="center">
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
                    <td><c:out value="" /> <input type="checkbox" id="myCheck" onClick="myFunction()" ></td>
                </tr>
                

<% } %>
          
        </table>
    </div>    
<script>
function myFunction() {
  var checkBox = document.getElementById("myCheck");
  var text = document.getElementById("text");
  if (checkBox.checked == true){
    text.style.display = "block";
  } else {
     text.style.display = "none";
  }
}
</script>
</body>
</html>