<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			//Create a connection string
			String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			// register username		
			String username = request.getParameter("register_username");
			// register email
			String email = request.getParameter("register_email");
			// register cid
			String cidstr = request.getParameter("register_cid");
			// register address
			String address = request.getParameter("register_parameter");
			// register phone number
			String phone = request.getParameter("register_phone");
			// register password
			String password = request.getParameter("register_password");
			
			// check if the password's length is 1-16
			if (password.length() > 16){
				response.sendRedirect("password_error.jsp");
			}
			
			// check if the input are correct
			if (username.equals("") || password.equals("") || cidstr.equals("")){
				response.sendRedirect("wronginput.jsp");
			}
			
			int cid = Integer.valueOf(cidstr);
			
			// check if database already has this user
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM Customer";
			ResultSet result = stmt.executeQuery(str);
			boolean isFoundUser = false;
			while (result.next()){
				if (result.getInt("CID") == cid){
					isFoundUser = true;
					response.sendRedirect("already_has_user.jsp");
					break;
				}
			}
			if (isFoundUser == false){
				/* insert value into database */
				String insertSQL = "INSERT INTO Customer(CID, Email, Address, Phone_no, Name, password)"
								 + "VALUES(?,?,?,?,?,?)";
				
				PreparedStatement st = con.prepareStatement(insertSQL);
				st.setInt(1, cid);
				st.setString(2, email);
				st.setString(3, address);
				st.setString(4, phone);
				st.setString(5, username);
				st.setString(6, password);
				
				st.executeUpdate();
			}
			
			// registered successfully
			request.setAttribute("success_username", username);
			request.setAttribute("success_password", password);
			request.setAttribute("success_cid", cid);
			request.getRequestDispatcher("register_success.jsp").forward(request,response);


			//response.sendRedirect("register_success.jsp");
			con.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>