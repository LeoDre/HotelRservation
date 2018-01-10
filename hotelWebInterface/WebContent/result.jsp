<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<html>
	<head><title>Result</title></head>
	<body>
		<h1>A list of rooms:</h1>
			<%
				String sDate = request.getParameter("sDate");
				String eDate = request.getParameter("eDate");  
				SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
				Date sd = null;
				Date ed = null;
				try{
					sd = formater.parse(sDate);
					ed = formater.parse(eDate);
				}catch(ParseException e){
					response.sendRedirect("dateError.jsp");
					return;
				}

				Date ResDate = new java.util.Date();
				if(sd.compareTo(ed)>=0 || sd.compareTo(ResDate)<0)
				{
					response.sendRedirect("dateError.jsp");
				}
				String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com/hoteldatabase";
				Class.forName("com.mysql.jdbc.Driver");	
				Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
				Statement stmt = con.createStatement();
				
				String entity = request.getParameter("hotelid");
				String str = "SELECT * FROM Has_Room where Has_Room.HotelID = "+entity;
				ResultSet result = stmt.executeQuery(str);
				out.print("<table cellspacing = 30>");
				out.print("<tr>");
				out.print("<td>");
				out.print("room number");
				out.print("</td>");
				out.print("<td>");
				out.print("type of rooms");
				out.print("</td>");
				out.print("<td>");
				out.print("Original Price(per day)");
				out.print("</td>");
				out.print("<td>");
				out.print("Discount");
				out.print("</td>");
				out.print("<td>");
				out.print("Price afer discont(per day)");
				out.print("</td>");
				out.print("</tr>");
				while (result.next()) {
					out.print("<tr>");
					out.print("<td>");
					out.print(result.getInt("Room_no"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Type"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getFloat("Price"));				
					out.print("</td>");
					out.print("<td>");
					out.print(result.getFloat("Discount"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getFloat("Price") * result.getFloat("Discount"));
					out.print("</td>");
					out.print("</tr>");

				}
				out.print("</table>");
				con.close();
			%>
			<form action = "service.jsp">
				Make your choice:
				<select name = "room_no" size=1>
					<option value = "-1"> select room</option>
					<% 
					List<String> list = new ArrayList<String>();
					list = (List<String>)session.getAttribute("Data");
					list.add(sDate);
					list.add(eDate);
					list.add(request.getParameter("hotelid").toString());
					try {
						url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com/hoteldatabase";
						Class.forName("com.mysql.jdbc.Driver");	
						con = DriverManager.getConnection(url, "root", "hotelcs336");
						stmt = con.createStatement();
						entity = request.getParameter("hotelid");
						str = "SELECT * FROM Has_Room where Has_Room.HotelID = "+entity;
						result = stmt.executeQuery(str);
						while(result.next())
						{
							%>
								<option value = <%=result.getInt("Room_no") %>><%=result.getInt("Room_no") %></option>
							<%
						}
						session.setAttribute("Data", list);
						con.close();
					} catch (Exception e) {
						} 	
					%>

						</select>
						
				<input type="submit" value="Continue">
			</form>

	
		<input type="button" value="Back" onClick = "javascript:location.href='search.jsp'">
			
		<input type="button" value="logout" onClick = "javascript:location.href='welcome.jsp'">
	</body>
</html>