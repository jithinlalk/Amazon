    <%@ page import="java.sql.*"%>  
      
    <%  
    String pId = request.getParameter("pId"); 
    String uId = request.getParameter("uId"); 
    String flag = request.getParameter("flag"); 
    String cart = "";
    
    
    try{  
    Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
    PreparedStatement ps=con.prepareStatement("select cart from user where id=?");  
    ps.setString(1,uId);  
    ResultSet rs=ps.executeQuery();
    
    while(rs.next()){  
    cart = rs.getString("cart");
    }  
    
	if(flag.equals("1")){
    	if(!cart.contains("-"+pId)){
    		
    		cart += "-"+pId;
    		
    		PreparedStatement ps1=con.prepareStatement("update user set cart = \""+cart+"\" where id=?");  
    	    ps1.setString(1,uId);  
    	    ps1.execute();
    		
    	}
    }else{
    	
    	if(cart.contains("-"+pId)){
    		
    		cart = cart.replace("-"+pId,"");
    		PreparedStatement ps2=con.prepareStatement("update user set cart = \""+cart+"\" where id=?");  
    	    ps2.setString(1,uId);  
    	    ps2.execute();
    		
    	}
    	
    }
    
    
    
    con.close();  
    }catch(Exception e){e.printStackTrace();}  
      
    %>  >