<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
	<head>
		<title>Search</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<script>
  		$( function() {
    	$( "#datepicker" ).datepicker();
  			} );
  		</script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<script>
  		$( function() {
    	$( "#datepicker2" ).datepicker();
  			} );
  		</script>
	</head>
	<body>
		<h1>Search</h1>
		<br>
		<form action="result.jsp">
			<table>
				<tr>
					<td>
						Location:
						<select name = "hotelid" size=1>
						<option value = "-1"> select location</option>
						<%	
							List<String> list = new ArrayList<String>();
							list.add(request.getParameter("cid"));
							session.setAttribute("Data", list);
							try {
									String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com/hoteldatabase";
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
									Statement stmt = con.createStatement();
									String str = "SELECT * FROM Hotel";
									ResultSet result = stmt.executeQuery(str);
									while(result.next())
									{
										%>
											<option value = <%=result.getInt("HotelID") %>><%=result.getString("Location") %></option>
										<%
									}
									con.close();
								} catch (Exception e) {
								} 
								
						%>

						</select>
					</td>
				</tr>
				<tr>
					<td>
						From:
							<input type="text" id = "datepicker" name = "sDate"/>
					</td>
					<td>
						To:
							<input type="text" id = "datepicker2" name = "eDate"/>
					</td>
				</tr>
			</table><br>
			<input type="submit" value="submit">
			
		</form>
			<input type="button" value="logout" onClick = "javascript:location.href='welcome.jsp'">
	</body>
</html>