<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success! | Hotel 336</title>
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">

<style>
	h1{
		 font-size: 170%;
		 font-weight: bold;
		 text-align: center;
		 font-family: 'VT323', monospace;
		 color: red;
	}
	
	.form {
		text-align: center;
	}
	
	div{
		font-size: 140%;
		text-align: center;
		font-family: 'VT323', monospace;
	}
	.note{
		text-align: center;
		font-family: 'VT323', monospace;
		color: red;
	}
	
	
	#menuList li {
	    float: right;
	}
	
	#menuList li a {
	    color: black;
	    text-align: center;
	    padding: 14px 16px;
	    padding-right: 30px;
	    text-decoration: none;
	}
	
	#menuList li a:hover {
	  color: #737CA1;
	}
	
	
	.archivesContent ul {
	  display: inline-block;
	  list-style-type: none;
	}
	
	.archivesContent a:link, a:visited {
	  font-family: 'Quicksand', sans-serif;
	  text-decoration: none;
	  font-size: 15px;
	  background-color: white;
	    color: black;
	    border: 2px solid #000000;
	    padding: 10px 20px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	}
	
	.archivesContent a:hover, a:active {
	    background-color: #2B3856;
	    color: white;
	}
</style>

</head>
<body>
	<%
		String username = request.getAttribute("success_username").toString();
		String password = request.getAttribute("success_password").toString();
		int cid = Integer.valueOf(request.getAttribute("success_cid").toString());
	%>
	<h1>You have successfully registered!</h1>
	<div>Your username: <%out.print(username); %></div>
	<div>Your Driver License: <%out.print(cid); %></div>
	<div>Your password: <%out.print(password); %></div>
	<div class="note">Please Note: the username is case sensitive! <br> You are ready to login!</div>
	
	<div class="archivesContent">
		<ul>
			<li><a href="welcome.jsp">Login</a></li>
		</ul>
	</div>
</body>
</html>