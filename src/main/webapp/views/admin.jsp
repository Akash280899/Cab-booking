<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
    <link rel="icon" type="image/gif" href="/assests/lg3.png" sizes="16x16" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <title>V CABS</title>

    <style type="text/css">
                                                                      
        .head{
             height: 540px;
             background-image: url("/assests/landimg3.jpg");
             background-size: cover;
             box-sizing: border-box;
             background-repeat: no-repeat;
             background-position: center center;
             margin-bottom: 30px;
             text-align: center;                                                                   
           }

     .head h1{
       size: 500px;
       font-family: 'Lato', sans-serif;
       font-weight: 700;
        text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
     
                      0px 8px 3px rgba(0,0,0,0.1),
     
                      0px 18px 23px rgba(0,0,0,0.1); 
     
       letter-spacing: 5px;
       display: inline-block;
       color: white;
     }

     .head p{
       font-size: 28px;
       padding-left: 13px;
       color: white;
       
     }

     .head img{
       width: 120px;
       height: 120px;
       margin-right: auto;
       margin-left: auto;
       margin-top: 90px;
       margin-bottom: 5px;

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
     
     .mybtn span {
       cursor: pointer;
       display: inline-block;
       position: relative;
       transition: 0.5s;
     }
     
        .mybtn span:after {
         content: '\00bb';
         position: absolute;
         opacity: 0;
         top: 0;
         right: -20px;
         transition: 0.5s;
      }
     
      .mybtn:hover span {
          padding-right: 25px;
       }
     
      .mybtn:hover span:after {
       opacity: 1;
       right: 0;
     }
     
       </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="/admin">
              <img src="/assests/lg3.png" width="30" height="30" class="d-inline-block align-top" ><strong> V CABS</strong></a>
          </nav>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
   <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" id="pass" href="/admin"><i class="fas fa-home"></i><strong> HOME <span class="sr-only">(current)</span></strong></a>
      </li>
    </ul>
   <p class="nav_p">
   <c:set var="log" scope="session" value="${sessionScope.logged2 }"/>  
   <c:choose>
  <c:when test="${log == 'yes'}">
    	 <p class="nav_p"><img src="../assests/lg3.png" width="35" height="35" class="d-inline-block align-top" ><strong style=" font-family: lato;">  HI..  </strong><span>${sessionScope.Adminusername }</span>
         <button onclick="location.href='${pageContext.request.contextPath }/logoutAdmin'" type="button" class="btn btn-danger mybtn">Log Out</button></p>
  </c:when>

  <c:otherwise>
    <button onclick="location.href='/loginAdmin'" type="button" class="btn btn-primary mybtn">Login</button>
  </c:otherwise>
</c:choose>
   </p>
  </div>
</nav>
          <div class="head ">
            <img class= "bounceIn animated" src="/assests/lg3.png"><br>
            <h1 class="bounceIn animated" >V CABS</h1>
          <c:choose>
          	<c:when test="${log == 'yes'}">
            <p class="bounceIn animated">Experience the best Rides in your city.</p> 
            <button type="button" class="btn btn-success btn-lg mybtn" style="vertical-align:middle" data-toggle="modal" data-target="#exampleModalCenter"><span>Add Driver</span></button> 
            <button type="button" class="btn btn-danger btn-lg mybtn" style="vertical-align:middle" data-toggle="modal" data-target="#exampleModalCenter1"><span>Delete Driver</span></button>
             <button onclick="location.href='/userDetails';" type="button" class="btn btn-primary btn-lg mybtn" style="vertical-align:middle" ><span>See Booking Details</span></button>
          	</c:when>
          	<c:otherwise>
          		<p class="bounceIn animated">Login to Continue...</p> 
          	</c:otherwise>
          </c:choose>
           </div>
    
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Create Driver Profile</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <div class="modal-body">
        <form action="driver-data" method="post">
	  <div class="form-group">
	    <label for="inputAddress">Driver Id</label>
	    <input type="text" class="form-control" id="inputLocation" placeholder="Enter Driver Id.." name="driverId" autocomplete="off">
	  </div>
	  <div class="form-group">
	    <label for="inputAddress">Username</label>
	    <input type="text" class="form-control" id="driverName" placeholder="Enter Driver name.." name="username" autocomplete="off">
	  </div>
	  <div class="form-group">
	    <label for="inputAddress">Password</label>
	    <input type="text" class="form-control" id="inputLocation" placeholder="Enter Driver password" name="password" autocomplete="off">
	  </div>
	  <input type="hidden" name="status" value="pending" />
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="btnAdd" type="submit" class="btn btn-primary">Sign Up</button>
        </div>
        </form>
        </div>
      </div>
    </div>
  </div>
  
    <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Delete Driver Profile</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <div class="modal-body">
        <form action="delete-driver" method="post">
	  <div class="form-group">
	    <label for="inputAddress">Driver Id</label>
	    <input type="text" class="form-control" id="driverId" placeholder="Enter Driver Id to delete.." name="driverId1" autocomplete="off">
	  </div>
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="btnDelete" type="submit" class="btn btn-success">Submit</button>
        </div>
        </form>
        </div>
      </div>
    </div>
  </div>
  <script>
	$("#btnAdd").click(function(){
		var name = document.getElementById('driverName').value;
		alert("Driver " + name +" added successfully.");
		});
	$("#btnDelete").click(function() {
		var id = document.getElementById('driverId').value;
		alert("DriverId: " + id +" deleted successfully.");
		})
  </script>
</body>
</html>
