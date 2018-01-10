<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Analysis</title>
</head>
<body>
	<%
		String fromdate = request.getParameter("fromDate");
		String todate = request.getParameter("toDate");
		SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
		Date sd = null;
		Date ed = null;
		try{
			sd = formater.parse(fromdate);
			ed = formater.parse(todate);
		}catch(ParseException e){
			response.sendRedirect("ddateError.jsp");
			return;
		}
		if(sd.compareTo(ed)>=0){
			response.sendRedirect("ddateError.jsp");
		}
		SimpleDateFormat formater0 = new SimpleDateFormat("yyyy-MM-dd");
		fromdate = formater0.format(sd);
		todate = formater0.format(ed);
		try{
			//Create a connection string
			String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "SELECT r.Rating as rate, hr.Type as type"+ 
					" From RoomReview rr, Has_Room hr, evaluates e, Review r"+
					" Where rr.ReviewID = e.ReviewID"+
					" and r.ReviewID = rr.ReviewID"+ 
					" and e.HotelID = hr.HotelID"+ 
					" and e.Room_no = hr.Room_no"+ 
					" and r.reviewDate<=\'"+todate+"\'"+
					" and r.reviewDate not in"+
					" (SELECT reviewDate From Review Where reviewDate<=\'"+fromdate+"\') ORDER BY rate desc;";
			ResultSet result = stmt.executeQuery(str);
			ArrayList<String> al = new ArrayList<String>();
			int rate = 0;
			while(result.next()){
				int r = result.getInt("rate");
				if(r<rate){
					break;
				}
				rate = r;
				String t = result.getString("type");
				if(al.indexOf(t)<0){
					al.add(t);
				}
			}
			out.print("<p><font size=\"5\"><b>The top rated Room type(s) is/are</b></font></p>");
			for(int i = 0; i<al.size();i++){
				out.print("<p>"+al.get(i)+" room"+"</p>");
			}
			
			str = "SELECT r.Rating as rate, ob.bType as type"+ 
					" From BreakfastReview br, Offers_Breakfast ob, assesses a, Review r"+
					" Where br.ReviewID = a.ReviewID"+
					" and r.ReviewID = br.ReviewID"+ 
					" and a.HotelID = ob.HotelID"+ 
					" and a.bType =ob.bType"+ 
					" and r.reviewDate<=\'"+todate+"\'"+
					" and r.reviewDate not in"+
					" (SELECT reviewDate From Review Where reviewDate<=\'"+fromdate+"\') ORDER BY rate desc;";
			result = stmt.executeQuery(str);
			ArrayList<String> bl = new ArrayList<String>();
			int rate1 = 0;
			while(result.next()){
				int r = result.getInt("rate");
				if(r<rate1){
					break;
				}
				rate1 = r;
				String t = result.getString("type");
				if(bl.indexOf(t)<0){
					bl.add(t);
				}
			}
			out.print("<p><font size=\"5\"><b>The top rated Breakfast type(s) is/are</b></font></p>");
			for(int i = 0; i<bl.size();i++){
				out.print("<p>"+bl.get(i)+"</p>");
			}
			
			str = "SELECT r.Rating as rate, ps.sType as type"+ 
					" From ServiceReview sr, Provides_Service ps, rates rs, Review r"+
					" Where sr.ReviewID = rs.ReviewID"+
					" and r.ReviewID = sr.ReviewID"+ 
					" and rs.HotelID = ps.HotelID"+ 
					" and rs.sType = ps.sType"+ 
					" and r.reviewDate<=\'"+todate+"\'"+
					" and r.reviewDate not in"+
					" (SELECT reviewDate From Review Where reviewDate<=\'"+fromdate+"\') ORDER BY rate desc;";;
			result = stmt.executeQuery(str);
			ArrayList<String> cl = new ArrayList<String>();
			int rate2 = 0;
			while(result.next()){
				int r = result.getInt("rate");
				if(r<rate2){
					break;
				}
				rate2 = r;
				String t = result.getString("type");
				if(cl.indexOf(t)<0){
					cl.add(t);
				}
			}
			out.print("<p><font size=\"5\"><b>The top rated Service type(s) is/are</b></font></p>");
			for(int i = 0; i<cl.size();i++){
				out.print("<p>"+cl.get(i)+"</p>");
			}
			str = "select c.name as name, sum(r.TotalAmt) as spent"+
					" From Customer c, Reservation r, makes m"+
					" Where c.CID = m.CID"+
					" and m.InvoiceNo = r.InvoiceNo"+
					" and r.ResDate<=\'"+todate+"\'"+
					" and r.ResDate not in("+
						" select r.ResDate"+
					    " from Reservation r"+
					    " where r.ResDate<=\'" + fromdate+
					"\')"+
					" group by c.CID"+
					" order by spent desc";
			result = stmt.executeQuery(str);
			ArrayList<String> dl = new ArrayList<String>();
			int indc = 0;
			while(result.next()&&indc<5){
				String s = result.getString("name");
				dl.add(s);
				indc++;
			}
			out.print("<p><font size=\"5\"><b>Our top 5 customers are</b></font></p>");
			for(int i = 0; i<dl.size();i++){
				out.print("<p>"+dl.get(i)+"</p>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<br>
	<br>
	<input type="button" value="Back" onClick = "javascript:location.href='Data.jsp'">
</body>
</html>