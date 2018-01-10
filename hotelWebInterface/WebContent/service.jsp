<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Service</title>
</head>
<body>


	<jsp:include page="header.html"/>
	
	<%
	List<String> list = new ArrayList<String>();
	list = (List<String>)session.getAttribute("Data");

	int room_no = Integer.valueOf(request.getParameter("room_no"));
	int hotelid = Integer.valueOf(list.get(3));
	String sDate = list.get(1);
	String eDate = list.get(2);

	String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com/hoteldatabase";
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
	Statement stmt = con.createStatement();
	
	SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
	Date sd = formater.parse(sDate);
	Date ed = formater.parse(eDate);
	String temp = "SELECT InDate, OutDate FROM Reserves WHERE HotelID = "+ hotelid +" AND Room_No = "+ room_no;
	ResultSet rs = stmt.executeQuery(temp);
	boolean flag = false;
	while(rs.next())
	{
		Date inDate = rs.getDate("InDate");
		Date outDate = rs.getDate("outDate");
		if((sd.compareTo(inDate)>=0 && sd.compareTo(outDate)<=0)||(ed.compareTo(inDate)>=0 && ed.compareTo(outDate)<=0))
		{
			flag = true;
		}
	}
	if(flag)
	{
		response.sendRedirect("dateError.jsp");
	}
	
	%>
		<form action="card.jsp">
			Number of Breakfast:
			<select name="Number" size=1>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			</select>
			Type of Breakfast:
			<select name="Type" size=1>
					<option value = "-1"> select type</option>
					<%	
						try {
								String str = "SELECT bType FROM Offers_Breakfast WHERE HotelID = "+ hotelid;
								ResultSet result = stmt.executeQuery(str);
								while(result.next())
								{
									%>
										<option value = <%=result.getString("bType") %>><%=result.getString("bType") %></option>
									<%
								}
							} catch (Exception e) {
							} 
							
					%>
			</select>&nbsp;<br>


			<br>
			<br>

			Type of Services:
          	<select name="Typeofservices" size=1>
					<option value = "-1"> select type</option>
					<%	
						try {
								String str = "SELECT sType FROM Provides_Service WHERE HotelID = "+ hotelid;
								ResultSet result = stmt.executeQuery(str);
								while(result.next())
								{
									%>
										<option value = <%=result.getString("sType") %>><%=result.getString("sType") %></option>
									<%
								}
								list.add(request.getParameter("room_no"));
								session.setAttribute("Data", list);
								con.close();
							} catch (Exception e) {
							} 
							
					%>
			</select>&nbsp;<br>
	 		<input type="submit" value="confirm">
		</form>
		<br>
	<% 
	
	%>
	
</body>
</html>