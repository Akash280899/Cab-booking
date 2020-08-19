<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <meta http-equiv="refresh" content="10" />
	 <title>V CABS</title>
	 <link rel="icon" href="/assests/lg3.png" type="image/png" sizes="16x16">
     <meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body{
  background-image: url('assests/img3.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}
#overlay {
  background: #ffffff;
  color: #666666;
  position: fixed;
  height: 100%;
  width: 100%;
  z-index: 5000;
  top: 0;
  left: 0;
  float: left;
  text-align: center;
  padding-top: 25%;
  opacity: .80;
}
.spinner {
    margin: 0 auto;
    height: 64px;
    width: 64px;
    animation: rotate 0.8s infinite linear;
    border: 5px solid firebrick;
    border-right-color: transparent;
    border-radius: 50%;
}
@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
</style>
</head>
<body>
<div id="overlay" style="display:none;"> 
    <div class="spinner"></div>
    <br/>
    Searching for cab drivers... 
 </div> 

	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
function check() {
	<%
	String status = null;
	String random = null;
	Statement statement = null;
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
	statement = connection.createStatement(); 
	String query = "SELECT * From booking,customer where booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ;
	ResultSet resultset = statement.executeQuery(query); 
	       
	        while(resultset.next()){ 
			status = resultset.getString(17);
			random = resultset.getString(15);} %>
			var ans1 = "<%=status %>";
			var ans2 = "<%=random %>";
			console.log("ans" + ans1);
			console.log("ans" + ans2);
			var book = "booked";
			if(ans1.localeCompare(book)==0) {
				window.location = "/CustomerFinal";
				}
			else {
	    		    $('#overlay').fadeIn(); 
				}
 }
        var myVar = setInterval(check, 2000);
</script>
</body>
</html>
