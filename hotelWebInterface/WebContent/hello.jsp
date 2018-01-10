<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello</title>
</head>
<body>
	<h1>Hello!  Here are your reservation info:</h1>
	<%
		try 
		{
			String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			Statement stmt = con.createStatement();
			String entity = request.getAttribute("cid").toString();
			String str = "select m.InvoiceNo, h.HotelID, h.Location from makes m, Hotel h, Contain c where h.HotelID = c.HotelID and m.InvoiceNo = c.InvoiceNo and m.CID = " + entity;
			ResultSet result = stmt.executeQuery(str);
			if (!result.next() ) {
			    out.println("No reservations available.");
			}
			else
			{
				out.print("<table>");
				out.print("<tr>");
				out.print("<td>");
				out.print("InvoiceNo");
				out.print("</td>");
				out.print("<td>");
				out.print("HotelID");
				out.print("</td>");
				out.print("<td>");
				out.print("Location");
				out.print("</td>");
				out.print("</tr>");
				
				do
				{
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current InvoiceNo:
					out.print(result.getInt("InvoiceNo"));
					out.print("</td>");
					//make a column
					out.print("<td>");
					//Print out current Hotel ID:
					out.print(result.getInt("HotelID"));
					out.print("</td>");
					out.print("<td>");
					//Print out current Hotel Location:
					out.print(result.getString("Location"));
					out.print("</td>");
					out.print("<td>");
					%>
						<form method="get" action="choose.jsp" enctype=text/plain>
						<input type = "hidden" name = "cid" value = <%=request.getAttribute("cid").toString()%>>
						<input type = "hidden" name = "InvoiceNo" value = <%=result.getInt("InvoiceNo")%>>
						<input type = "hidden" name = "hid" value = <%=result.getInt("HotelID")%>>
						<input type = "submit" value = "Review"/>
						</form>
					<%
					out.print("</td>");
					out.print("</tr>");
				} while(result.next());
				out.print("</table>");
			}
			con.close();
		} 
		catch (Exception e) 
		{
			out.print("Function is not available.");
		}
	%>
	<br>
	<br>
	<form method="get" action="search.jsp" enctype=text/plain>
	<input type = "hidden" name = "cid" value = <%=request.getAttribute("cid").toString()%>>
	Start a new reservation <input type = "submit" value = "Start"/>
	</form>
	<br>
	<pre>					<input type="button" value="Logout" onClick = "javascript:location.href='welcome.jsp'"> </pre>
</body>
</html>