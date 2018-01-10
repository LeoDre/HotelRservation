<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>No Such User | Hotel 336</title>
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
	<h1>Error: No Such User or Wrong password!</h1>
	<form action = "welcome.jsp">
		<input class="button button5" type = "submit" value = "Back to Login"/>
	</form>
</body>
</html>