<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose</title>
</head>
<body>
	<h1>Choose a category to review</h1>
	<%	
		try
		{	
			String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			Statement stmt = con.createStatement();
			int cid = Integer.parseInt(request.getParameter("cid"));
			String InvoiceNo = request.getParameter("InvoiceNo");
			String str = "select * from makes where CID = " + cid + " and InvoiceNo = " + InvoiceNo;
			ResultSet result = stmt.executeQuery(str);
			result.next();
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("Category");
			out.print("</td>");
			out.print("</tr>");
		
			
			if (result.getInt("isRoomReviewed") != 1)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Room Review");
				out.print("</td>");
				out.print("<td>");
				%>
				<form method="get" action="Review.jsp" enctype=text/plain>
				<input type = "hidden" name = "cid" value = <%=request.getParameter("cid")%>>
				<input type = "hidden" name = "InvoiceNo" value = <%=request.getParameter("InvoiceNo")%>>
				<input type = "hidden" name = "hid" value = <%=request.getParameter("hid")%>>
				<input type = "hidden" name = "category" value = "room">
 				<input type = "submit" value = "Review"/>
				</form>
				<%
				out.print("</td>");
				out.print("</tr>");
			}
			else
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Room is reviewed.");
				out.print("</td>");
				out.print("</tr>");
			}
			
			if (result.getInt("isBreakfastReviewed") != 1)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Breakfast Review");
				out.print("</td>");
				out.print("<td>");
				%>
				<form method="get" action="Review.jsp" enctype=text/plain>
				<input type = "hidden" name = "cid" value = <%=request.getParameter("cid")%>>
				<input type = "hidden" name = "InvoiceNo" value = <%=request.getParameter("InvoiceNo")%>>
				<input type = "hidden" name = "hid" value = <%=request.getParameter("hid")%>>
				<input type = "hidden" name = "category" value = "breakfast">
 				<input type = "submit" value = "Review"/>
				</form>
				<%
				out.print("</td>");
				out.print("</tr>");
			}
			else
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Breakfast is reviewed.");
				out.print("</td>");
				out.print("</tr>");
			}
			
			if (result.getInt("isServiceReviewed") != 1)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Service Review");
				out.print("</td>");
				out.print("<td>");
				%>
				<form method="get" action="Review.jsp" enctype=text/plain>
				<input type = "hidden" name = "cid" value = <%=request.getParameter("cid")%>>
				<input type = "hidden" name = "InvoiceNo" value = <%=request.getParameter("InvoiceNo")%>>
				<input type = "hidden" name = "hid" value = <%=request.getParameter("hid")%>>
				<input type = "hidden" name = "category" value = "service">
 				<input type = "submit" value = "Review"/>
				</form>
				<%
				out.print("</td>");
				out.print("</tr>");
			}
			else
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Service is reviewed.");
				out.print("</td>");
				out.print("</tr>");
			}
			
			out.print("</table>");
			con.close();
		}
		catch (Exception e) 
		{
			out.print("Function is not available.");
		}
	%>
	<br>

<br>	
<pre>						<form action = "review_back.jsp">
							<input type = "hidden" name = "cid" value = <%= request.getParameter("cid")%>>
							<input type = "submit" value = "Back">
							</form> </pre>
<pre>							<input type="button" value="Logout" onClick = "javascript:location.href='welcome.jsp'"> </pre>
</body>
</html>