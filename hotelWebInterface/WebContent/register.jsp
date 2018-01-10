<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel | Register</title>
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<style>
	h1{
	padding-top: 2cm;
	 font-size: 300%;
	 font-weight: bold;
	 text-align: center;
	 font-family: 'VT323', monospace;
	}
	
	.form {
		text-align: center;
	}
	
	nav {
		font-family: 'Quicksand', sans-serif;
		 font-size: 18px;
	    height: 50px;
	    display: inline;
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
	    background-color: white;
	    position: fixed;
	    top: 0;
	    width: 100%;
	    border-bottom:1px solid black;
	}

	ul {
	  list-style-type: none;
	  padding-right: 80px;
	}
	
	 li {
	    float: right;
	 }
	
	 li a {
	    color: black;
	    text-align: center;
	    padding: 14px 16px;
	    padding-right: 30px;
	    text-decoration: none;
	 }
	
	 li a:hover {
	  color: #040CFC;
	 }
	
	.tag {
	  text-decoration: none;
	  float: left;
	  display: inline;
	  text-align: left;
	  padding-top: 14px;
	  margin-left: 60px;
	 }
	 
	 .button{
		background-color: #4CAF50; /* Green */
	    border: none;
	    color: white;
	    padding: 8px 10px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 12px;
	    margin: 4px 2px;
	    -webkit-transition-duration: 0.4s; /* Safari */
	    transition-duration: 0.4s;
	    cursor: pointer;
	}
	
	
	.button5 {
		background-color: white;
	    color: black;
	    border: 2px solid #e7e7e7;
	    
	}
	
	.button5:hover {
	    background-color: #e7e7e7;
	}
	 
	 
</style>

</head>
<body>

	<nav>            
			<div class="tag">Welcome | Hotel 336</div>
            <ul>
                <li><a href="#contact">Contact</a></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a class="active" href="welcome.jsp">Home</a></li>
            </ul>           
	</nav>
	
	<h1>Register</h1>
	<div class="form">
		<!-- register -->
		<form action = "register_control.jsp" method = "post">
			Username: <input type = "text" name = "register_username">
		    <br />
		    Email: <input type = "text" name = "register_email">
		    <br />
		    Driver License: <input type = "text" name = "register_cid">
		    <br />
		    Address: <input type = "text" name = "register_addr">
		    <br />
		    Phone Number: <input type = "text" name = "register_phone">
		    <br />
		    Password: <input type = "password" name = "register_password" />
		    <br>
		    *Password length should between 1-16.
		    <br>
	    <input class="button button5" type = "submit" value = "Register" />
		</form>
	</div>
</body>
</html>