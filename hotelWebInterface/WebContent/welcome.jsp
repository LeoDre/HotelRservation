<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel</title>

<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<style>

.form {
	text-align: center;
}

h1 {
	padding-top: 2cm;
 	font-size: 400%;
	 font-weight: bold;
	 text-align: center;
	  font-family: 'VT323', monospace;
  /*padding-left: 310px;*/
   -webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
       -moz-animation: fadein 2s; /* Firefox < 16 */
            animation: fadein 3s;
}
@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}
/* Firefox < 16 */
@-moz-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}
/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
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


input[type=text] {
    width: 280px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 17px;
    background-color: white;
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 10px 15px 12px 10px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 30%;
}

input[type=password] {
    width: 280px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 17px;
    background-color: white;
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 10px 15px 12px 10px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=password]:focus {
    width: 30%;
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
			<div class="tag">Welcome | Hotel</div>
            <ul>
                <li><a href="#contact">Contact</a></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a class="active" href="welcome.jsp">Home</a></li>
            </ul>
</nav>


<h1> Welcome to Our Hotel</h1> <!--  HTML way for output -->
<br>
<br>
<div class = "form">
	<!-- Login -->
	<form action = "main.jsp" method = "post">
		<input type = "text" name = "username" placeholder="username"/>
	    <br />
	    <br>
	    <input type = "password" name = "password" placeholder="password"/>
	    <br>
	    <input class="button button5" type = "submit" value = "Login" />
	</form>
	<br>

New user? Register first to login: <br>
<input class="button button5" type = "submit" value = "Register" onClick = "javascript:location.href='register.jsp'"/>
</div>


</body>
</html>
