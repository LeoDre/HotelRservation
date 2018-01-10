<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//List<String> list = new ArrayList<String>();
	List<String> tmp = new ArrayList<String>();
	tmp = (List<String>)session.getAttribute("Data");
	int cid = Integer.parseInt(tmp.get(0));
	request.setAttribute("cid", cid);
	request.getRequestDispatcher("hello.jsp").forward(request,response);
	%>
</body>
</html>