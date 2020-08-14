<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <link rel="icon" href="assests/lg3.png" type="image/gif" sizes="16x16">

  <!--font awesome -->
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   
<!--Animate.css-->
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 

    <title>V Cabs-driver</title>

    <style type="text/css">
      
      .head{
        height: 550px;
        background-image: url("assests/img1.jpg");
        background-size: cover;
        box-sizing: border-box;
        background-repeat: no-repeat;
        background-position: center center;
        margin-bottom: 30px;
        

      }

      .head h1{
        padding-top: 30px;
        padding-left: 10px;
        display: inline-block;
        color: white;
      }

      .head_p{
        font-size: 28px;
        padding-left: 13px;
        color: white;
        
      }

      .location{
        margin-left: 450px;
        margin-top: 30px;
        display: inline-block;
      }

      .logo{
        margin-top: 15px;
        margin-bottom: 15px;

      }


     .footicon{
      float: right;
      display: inline-block;
      size: 20px;
      padding-right: 20px;
     }

     .nav_p{

     
      font-size: 25px;
      color: white;
      margin-top: 5px;
      font-style: italic;
     }

     .nav_p span{
           text-decoration: underline;
     }

     .mybtn{
      
      margin-left: 15px;
      height: 40px;
      font-weight: bold;

     }

     .detail{
      font-weight: bold;
      border-radius: 0;
     }
	.mybtnConfirm span {
       cursor: pointer;
       display: inline-block;
       position: relative;
       transition: 0.5s;
     }
     
        .mybtnConfirm span:after {
         content: '\00bb';
        position: absolute;
         opacity: 0;
        top: 0;
         right: -20px;
         transition: 0.5s;
      }
     
           .mybtnConfirm:hover span {
           padding-right: 25px;
       		}
     
        .mybtnConfirm:hover span:after {
	       opacity: 1;
	       right: 0;
     	}

    </style>

  </head>
  <body>
    <% int current = 0;
ResultSet rs = null;
Statement statement = null;
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
statement = connection.createStatement(); 
/* String query = "SELECT * From booking,customer where booking.driver_id=1 and booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ; */
String query = "SELECT * From booking,customer where booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ;
ResultSet resultset = statement.executeQuery(query); %>
        <% while(resultset.next()){ %>

      <% String temp3 =  resultset.getString(5) ;
        String temp4 =  resultset.getString(6);
        String vehicleType = resultset.getString(7);%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="/landing" >
    <img src="assests/lg3.png" width="30" height="30" class="d-inline-block align-top" ><strong> V CABS</strong></a>
</nav>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

      <li class="nav-item active">
        <a class="nav-link" id="pass" href="/driver"><i class="fas fa-home"></i><strong> HOME <span class="sr-only">(current)</span></strong></a>
      </li>


    </ul>
     
	<p class="nav_p"><img src="../assests/lg3.png" width="35" height="35" class="d-inline-block align-top" ><strong style=" font-family: lato;">  Hello..  </strong><span>${sessionScope.Driverusername }</span>
         <button onclick="location.href='${pageContext.request.contextPath }/logout'" type="button" class="btn btn-danger mybtn">Log Out</button></p>

  
   

  </div>
</nav>

 <div class="head">
   
   <h1 class="fadeInUp animated">Reliable. Safe. Transparent.</h1>
   
  <figure class="figure  float-right location fadeIn animated d-md-none d-lg-block d-sm-none d-none ">

   

</figure>


 </div>
<c:set var="driverId" scope="session" value="${sessionScope.DriverId }"/>  
	<c:set var="ID" scope="session" value="${sessionScope.id }"/>  

  
    
<c:choose>
  <c:when test="${driverId == ID}">	 
<div class="container">
 <div class="row">
  <div class="col sm-6 ">
   <div class="card " style="margin-top: 30px;">

    <div class="card-header"><h4>Completed Ride</h4> </div>
  
      <div class="card-body">
   
    
     <form action="/completeRide" method="post"> 
   <div class="form-row">
    <div class="form-group col-md-12">
      <label ><i class="fas fa-circle" style="color: green;"></i>Picked Location</label> <br>
      <strong><%=resultset.getString(5)  %></strong>
    </div>
    <div class="form-group col-md-12">
      <label ><i class="fas fa-circle" style="color: red;"></i>Reached Location</label> <br>
      <strong><%=resultset.getString(6)  %></strong>
    </div>
  </div>

   <div class="form-row">
    <div class="form-group col-md-12">
      <strong>Click here to complete your ride...</strong>
      <button value="lets" type="submit" class="btn btn-success " style="vertical-align:middle" name="letsButton1">Complete Ride</button>
		<% 
			String idtemp1 =  (String) session.getAttribute("id");
		  if (request.getParameter("letsButton1") != null) {
		    try {
		      Class.forName("com.mysql.jdbc.Driver"); 
		      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
		      Statement stmnt1 = conn.createStatement();
		      stmnt1.executeUpdate("UPDATE driver set status='pending' where driver_id= '"+idtemp1+"'");
		    }
		    catch (Exception e) {
		    } 
		 }       
		  %>   
    </div>
  </div>
<!--   <button id="btnPayment" type="button" class="btn btn-success " style="vertical-align:middle">Proceed to Payment</button> -->
     </form> 
    </div>
   </div>
  </div>
   
   <div class="col-sm-6">
     <div class="card" style="margin-top: 30px;">
      <div class="card-body" style="margin: 0;">
         
          <div class="card-header"><h4>Payment&ensp;<strong>Rs.<%=resultset.getString(8)%>/-</strong></h4> </div>
  
      <div class="card-body">
   <div class="form-row">
    <!-- <div class="form-group col-md-3"> 
      <label ><i class="fa fa-inr" style="color: gray;">&ensp;&ensp;</i>Cash Payment</label> <br>
    </div>
    <div class="form-group col-md-3">
     <a href="/driverPayment"><button type="button" class="btn btn-secondary btn-lg mybtnConfirm" style="vertical-align:middle"><span>Confirm</span></button></a> 
  	</div> -->
  </div>
  <div class="form-row">
  <div class="form-group col-md-3">
      <label ><i class="fas fa-money-check" style="color: gray;">&nbsp;</i>Online Payment</label> <br>
   </div>
    <div class="form-group col-md-3">
     <a href="/driverPayment"><button type="button" class="btn btn-secondary btn-lg mybtnConfirm" style="vertical-align:middle"><span>Confirm</span></button></a> 
  	</div>
   </div>
    </div>
 
         
      </div>
    </div>
   </div>

 </div>
</div>
</c:when>
</c:choose>
<br>
<!-- Footer starts-->

<div class="jumbotron jumbotron-fluid" style="background-color: #282C35; color: white;">
</div>




<div class="last">
 &copy; V CABS 2020. All Rights Reserved.
  <div class="footicon" style="margin-bottom: 10px;">
    <a href="https://www.facebook.com/profile.php?id=100012159498460" target="_blank"><i style="font-size:28px; margin-right: 10px; " class="fa">&#xf082;</i></a>
    <a href=""><i style="font-size:28px; margin-right: 10px;" class="fa">&#xf099;</i></a>
    <a href=""><i style="font-size:28px;" class="fa">&#xf16d;</i></a>
 </div>

</div>

 <% } %>

<!--Footer Ends-->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD1R5QWrqEMfU9qPpah3ufkQmeSWBEVtRo"></script> 
	<script type ="text/javascript" src="js/script.js"></script> 
  </body>
</html>