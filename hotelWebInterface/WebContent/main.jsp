<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%		
	
		try {
			
			//Create a connection string
			String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			// get the uername from welcome.jsp
			
			// Need to check if the database contains this username
			String username_entity = "Customer";
			String str = "SELECT * FROM " + username_entity;
			ResultSet result = stmt.executeQuery(str);
			
			// get the user password
			String password = request.getParameter("password");
			
			
			// get the input username
			String username = request.getParameter("username");
			// get the input cid
			
			String cid_str = request.getParameter("cid");
			if (password.equals("") || username.equals("")){
				response.sendRedirect("no_such_user.jsp");
			}else {
				
				// holds the redirect link
				String redirectLink = null;
				// falg for checking if the database has this user
				boolean isFoundUser = false;
				/* Check if this is admin */
				if (username.equals("admin") && password.equals("admin")){
					response.sendRedirect("Data.jsp");
				} else {
					while (result.next()){
						
						/* Check if database has this user */
						if (result.getString("Name").equals(username) && result.getString("password").equals(password)){
							// get the cid
							int cid = Integer.valueOf(result.getString("CID"));
							isFoundUser = true;
							
							request.setAttribute("cid", cid);
							request.getRequestDispatcher("hello.jsp").forward(request,response);
							
							break;
						}
					}
					if (isFoundUser == false){
						/* direct to the error page */
						response.sendRedirect("no_such_user.jsp");
					}
				}
				
			}
			
			
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>