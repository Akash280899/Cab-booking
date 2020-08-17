<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>V Cabs</title>
<link rel="icon" href="/assests/lg3.png" type="image/png" sizes="16x16">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all">
<link href="css/wickedpicker.css" rel="stylesheet" type='text/css' media="all" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="//fonts.googleapis.com/css?family=Amaranth:400,400i,700,700i" rel="stylesheet">
<style>
body {
    background:url("../assests/cabAdmin.jpg") fixed;
    background-size: cover;
	text-align:center;
}
.book-form input[type="text"], .book-form input[type="email"], .book-form input[type="password"] {
    width: 92%;
    outline: none;
    font-size: 0.9em;
    padding: 13px 10px;
    border: 1px solid #fff;
    font-weight: 100;
    -webkit-appearance: none;
    margin-bottom: 1.4em;
    background: rgba(0, 0, 0, 0.69);
    font-family: 'Amaranth', sans-serif;
}
.book-form input[type="text"], .book-form input[type="email"], .book-form input[type="password"]{
	color: #fff;
}
.book-form input[type="text"], .book-form input[type="text"], .book-form input[type="password"]{
	color: #bbb9b9;
}
</style>
</head>
<body>
<div class="header">
	<h1>Login Form</h1>
</div>
 <p class="alert" style="color:red">${error }</p> 
 <br>
<div class="w3-main">
	<div class="about-bottom">
		<div class="w3l_about_bottom_right two">
		<h2 class="tittle"><span>Admin Login</span></h2>
		<div class="book-form">
			
			   <form method="post" action="${pageContext.request.contextPath }/loginAdmin">
					<div class="form-date-w3-agileits">
						<div class="form-agileits">
							<label> Name :</label>
						</div>
						<div class="form-agileits-2">
							<input type="text" name="username" placeholder="Your Name" required="" autocomplete="off">
						</div>
						<div class="clear"> </div>
					</div>
					<div class="form-date-w3-agileits second-agile">
						<div class="form-agileits">
							<label> Password :</label>
						</div>
						<div class="form-agileits-2">
							<input type="password" name="password" placeholder="Your Password" required="" autocomplete="off">
						</div>
						<div class="clear"> </div>
					</div>
					
					<div class="make">
						  <input type="submit" value="Login">
					</div>
				</form>
			</div>
		</div>
		<div class="clear"> </div>
	</div>
</div>
		<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
	
	
</body>
</html>
