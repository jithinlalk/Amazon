    <%@ page import="java.sql.*"%>  
    <%@ page import="java.util.Arrays" %>
      
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
    		
    		cart += "-"+pId+",1";
    		
    		PreparedStatement ps1=con.prepareStatement("update user set cart = \""+cart+"\" where id=?");  
    	    ps1.setString(1,uId);  
    	    ps1.execute();
    		
    	}else{
    		String carts[] = cart.substring(1).split("-");
    		for(int i=0;i<carts.length;i++){
    			if(carts[i].startsWith(pId)){
    				String q[] = carts[i].split(",");
    				carts[i] = pId+","+(Integer.parseInt(q[1])+1);
    				break;
    			}
    			
    		}
    		

			cart = "-"+String.join("-", carts);
			PreparedStatement ps3=con.prepareStatement("update user set cart = \""+cart+"\" where id=?");  
    	    ps3.setString(1,uId);  
    	    ps3.execute();
    		
    	}
    }else{
    	
    	if(cart.contains("-"+pId)){
    		
    		String carts[] = cart.substring(1).split("-");
    		for(int i=0;i<carts.length;i++){
    			if(carts[i].startsWith(pId)){
    				String q[] = carts[i].split(",");
    				if(Integer.parseInt(q[1])==1)
    					carts[i] = "";
    				else
    					carts[i] = pId+","+(Integer.parseInt(q[1])-1);
    				break;
    			}
    			
    		}
    		
    		cart="";
			for(int i=0;i<carts.length;i++){
				if(!carts[i].equals(""))
					cart += "-"+carts[i];
			}
			PreparedStatement ps3=con.prepareStatement("update user set cart = \""+cart+"\" where id=?");  
    	    ps3.setString(1,uId);  
    	    ps3.execute();
    		
    	}
    	
    }
    
    
    
    con.close();  
    }catch(Exception e){e.printStackTrace();}  
      
    %>  >