<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<html>
	<title>Success!</title>
	<body>
		<h1>Your reservation has been processed.</h1>
		<%
				String url = "jdbc:mysql://hotel.czssrxz0chgs.us-east-2.rds.amazonaws.com/hoteldatabase";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
				Statement stmt = con.createStatement();

				List<String> list = new ArrayList<String>();
				list = (List<String>)session.getAttribute("Data");
				
				
				// get parameter
				int cid = Integer.parseInt(list.get(0));
				int room_no = Integer.parseInt(list.get(4));
				int hotelid = Integer.parseInt(list.get(3));
				String inDate = list.get(1);
				String outDate = list.get(2);
				int bnum = Integer.valueOf(list.get(5));
				String btype = list.get(6);
				String stype = list.get(7);
				String cnumber = request.getParameter("cnumber");
				
				String expdate = request.getParameter("expdate");
				SimpleDateFormat format = new SimpleDateFormat("MM/yy");
				Date exd = format.parse(expdate);
				
				String ctype = request.getParameter("ctype");
				String seccode = request.getParameter("seccode");
				String name = request.getParameter("name");
				String addr = request.getParameter("addr");
				
				// show hotel location
				String s = "SELECT Location FROM Hotel where HotelID = "+ hotelid;
				ResultSet result = stmt.executeQuery(s);
				result.next();
				String location = result.getString("Location");
				out.print("<li>Hotel location:\t"+location+"</li>");
				//show room number
				out.print("<li>Room Number:\t"+room_no+"</li>");
				
				//show inDate and outDate
				out.print("<li>In Date:\t"+inDate+"</li>");
				out.print("<li>Out Date:\t"+outDate+"</li>");
				
				//show number of days	 
				SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
				Date sd = formater.parse(inDate);
				Date ed = formater.parse(outDate);
				long diff = Math.abs(sd.getTime() - ed.getTime());
				long diffDays = diff / (24 * 60 * 60 * 1000);
				out.print("<li>NoOfDays:\t"+diffDays+"</li>");
				
				//generate and show invoice number
				int invoiceno =  (int) (Math.random() * 10000);
				out.print("<li>Invoice#:\t"+invoiceno+"</li>");
				
				// show price and for discount for room
				String str = "SELECT Price, Discount FROM Has_Room where Has_Room.HotelID = "+ hotelid+ " AND Has_Room.Room_no ="+room_no;
				result = stmt.executeQuery(str);
				result.next();
				float price = result.getFloat("Price");
				float discount = result.getFloat("Discount");
				out.print("<li>price for room per day:\t"+price+"</li>");
				out.print("<li> discount for room:\t"+discount+"</li>");
				
				// show type and number of breakfast
				out.print("<li>type of breakfast:\t"+btype+" Food</li>");
				out.print("<li>number of breakfast:\t"+bnum+"</li>");
				
				// show price of breakfast
				String str2 = "SELECT bPrice FROM Offers_Breakfast where HotelID = "+ hotelid+ " AND bType = \""+btype+" Food\"";
				result = stmt.executeQuery(str2);
				result.next();
				int bprice = result.getInt("bPrice");
				out.print("<li>price per breakfast:\t"+bprice+"</li>");
				out.print("<li>total price of breakfast:\t"+bprice*bnum+"</li>");
				
				// show type of service
				out.print("<li>type of service:\t"+stype+"</li>");
				String str3 = "SELECT sCost FROM Provides_Service where HotelID = "+ hotelid + " AND sType = \""+stype+"\"";
				result = stmt.executeQuery(str3);
				result.next();
				int scost = result.getInt("sCost");
				out.print("<li>cost of service:"+scost+"</li>");
				
				// show total amount
				float totalamt = price*discount*diffDays+bprice*bnum+scost;
				out.print("<li> TotalAmt:\t"+totalamt+"</li>");
				Date ResDate = new java.util.Date();
				
				//show information of customer
				out.print("<li> name:\t"+name+"</li>");
				out.print("<li> cnumber\t"+cnumber+"</li>");
				out.print("<li> expiration date:\t"+expdate+"</li>");
				out.print("<li> security code:\t"+seccode+"</li>");
				out.print("<li> card type:\t"+ctype+"</li>");
				out.print("<li> billing address:\t"+addr+"</li>");
				
				
				//show register date
				out.print("<li> ResDate:\t"+ResDate+"</li>");
				
				//store information into database
				
				// into Reservation
				String insert = "INSERT INTO Reservation (InvoiceNo, ResDate, TotalAmt)"
						+ "VALUES (?, ?, ?)";
				
				PreparedStatement ps = con.prepareStatement(insert);

				
				ps.setInt(1, invoiceno);
				ps.setDate(2, new java.sql.Date(ResDate.getTime()));
				ps.setFloat(3, totalamt);

				ps.executeUpdate();
				//into Reserves
				String insert2 = "INSERT INTO Reserves (HotelID, Room_No, InvoiceNo, OutDate, InDate, NoOfDays)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				
				PreparedStatement ps2 = con.prepareStatement(insert2);

				
				ps2.setInt(1, hotelid);
				ps2.setInt(2, room_no);
				ps2.setInt(3, invoiceno);
				ps2.setDate(4, new java.sql.Date(ed.getTime()));
				ps2.setDate(5, new java.sql.Date(sd.getTime()));
				ps2.setInt(6, (int)diffDays);
				ps2.executeUpdate();
				
				//into Contain
				String insert3 = "INSERT INTO Contain(HotelID, sType, InvoiceNo)"
						+ "VALUES (?, ?, ?)";
				
				PreparedStatement ps3 = con.prepareStatement(insert3);

				
				ps3.setInt(1, hotelid);
				ps3.setString(2, stype);
				ps3.setInt(3, invoiceno);
				
				ps3.executeUpdate();
				
				//into Include
				String insert4 = "INSERT INTO Include(HotelID, bType, InvoiceNo)"
						+ "VALUES (?, ?, ?)";
				
				PreparedStatement ps4 = con.prepareStatement(insert4);

				ps4.setInt(1, hotelid);
				ps4.setString(2, btype+" Food");
				ps4.setInt(3, invoiceno);
				
				ps4.executeUpdate();
				
				//into CreditCard
				String insert5 = "INSERT INTO CreditCard(Cnumber, ExpDate, Type, SecCode, Name, BillingAddr)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				
				PreparedStatement ps5 = con.prepareStatement(insert5);
				ps5.setString(1, cnumber);
				ps5.setDate(2, new java.sql.Date(exd.getTime()));
				ps5.setString(3, ctype);
				ps5.setString(4, seccode);
				ps5.setString(5, name);
				ps5.setString(6, addr);
				
				ps5.executeUpdate();
				
				//into makes
								String insert6 = "INSERT INTO makes(InvoiceNo, CID, Cnumber)"
						+ "VALUES (?, ?, ?)";
				
				PreparedStatement ps6 = con.prepareStatement(insert6);

				ps6.setInt(1, invoiceno);
				ps6.setInt(2, cid);
				ps6.setString(3, cnumber);
				
				ps6.executeUpdate();
				
				//update is value in this row
				String update = "UPDATE makes SET isRoomReviewed=0,  isBreakfastReviewed=0, isServiceReviewed=0 WHERE InvoiceNo="+invoiceno+" and CID="+cid;
				stmt.execute(update);
		%>
		<%
		//request.setAttribute("cid", cid);
		//request.getRequestDispatcher("hello.jsp").forward(request,response);
		%>
		<form action = "reserved_back.jsp">
			<input type = "submit" value = "Finish">
		</form>
		
		
			
			
		
		
	</body>
</html>