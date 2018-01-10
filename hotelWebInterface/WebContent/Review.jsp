<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review</title>
</head>
<body>
<p><font size="7"><b>Review</b></font></p>
<%	
	String s = request.getParameter("category");
	out.print("<p><font size=\"4\""+">"+"Please rate your experience of our "+s+" from 1 to 10"+"</font></p>");
%>
<p>1 represent you are extremely unsatisfied with our service and 10 means you are extremely satisfied with our service</p> 
<br>
<form method="post" action="reviewHandle.jsp">
	<select name="rate" size=1>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>&nbsp;/10
	<br>
	<p>Please enter your comment within 100 characters</p> 
	<br>
	<textarea name = "comment" maxlength="100" rows="6" cols="30">
	</textarea>
	<br>
	<br>
	<input type="hidden" name="cid" value=<%= request.getParameter("cid") %>>
	<input type="hidden" name="InvoiceNo" value=<%= request.getParameter("InvoiceNo") %>>
	<input type="hidden" name="hid" value=<%= request.getParameter("hid") %>>
	<input type="hidden" name="category" value=<%= request.getParameter("category") %>>
	<input type="submit" value="submit" name = "subR">
</form>
<form method="post" action="choose.jsp">
	<input type="hidden" name="cid" value=<%= request.getParameter("cid") %>>
	<input type="hidden" name="InvoiceNo" value=<%= request.getParameter("InvoiceNo") %>>
	<input type="hidden" name="hid" value=<%= request.getParameter("hid") %>>
	<input type="submit" value="Back">
</form>
</body>
</html>