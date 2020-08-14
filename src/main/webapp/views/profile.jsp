<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<html>

  <head>
	 
    <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <title>V CABS</title>
	 <link rel="icon" href="/assests/lg3.png" type="image/png" sizes="16x16">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 		<link rel="stylesheet" href="profile.css">
	
 
    <style type="text/css">
      
      .head{
        height: 500px;
        background-image: url("/assests/carbg.jpg");
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

      .head p{
        font-size: 28px;
        padding-left: 13px;
        color: white;
        
      }

      .location{
        margin-right: 30px;
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
     .fare{
      width: 50%;
     }

     .form-check{
          margin: 20px;
     }
     .controls{
      display: none;
     }

     #map{
      height: 100%;
      width: 100%;
     }
     html {
  scroll-behavior: smooth;
    }
	
	.nav_p{
      font-size: 25px;
      color: white;
      margin-top: 5px;
      font-style: italic;
     }

     .nav_p span{
           text-decoration: bold;
     }
     :disabled:hover {
	  cursor: not-allowed;
	}
    </style>

  </head>
  <body >
 <div id="overlay" style="display:none;">
    <div class="spinner"></div>
    <br/>
    Searching for cab drivers...
</div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="/landing" >
    <img src="assests/lg3.png" width="30" height="30" class="d-inline-block align-top" ><strong>V CABS</strong></a>
</nav>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

      <li class="nav-item active">
        <a class="nav-link" id="pass" href="/"><i class="fas fa-home"></i><strong> HOME <span class="sr-only">(current)</span></strong></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="/profile "><i class="fas fa-user"></i><strong> PROFILE</strong></a>
      </li>

       <li class="nav-item">
        <a class="nav-link" href="#book"><i class="fas fa-car"></i><strong> BOOK CAB</strong></a>
      </li>

       <li class="nav-item">
        <a class="nav-link" href="/aboutUs"><i class="fas fa-globe"></i><strong> ABOUT</strong></a>
      </li>

       <li class="nav-item ">
        <a class="nav-link" href="/review"><i class="fas fa-comments"></i><strong> REVIEW </strong></a>
      </li>
      
    </ul>

   
   <c:set var="log" scope="session" value="${sessionScope.logged1 }"/>  
   <c:choose>
  <c:when test="${log == 'yes'}">
    	 <p class="nav_p"><img src="../assests/lg3.png" width="35" height="35" class="d-inline-block align-top" ><strong style=" font-family: lato;">  Welcome..  </strong><span>${sessionScope.Customerusername }</span>
         <button onclick="location.href='${pageContext.request.contextPath }/logoutCustomer'" type="button" class="btn btn-danger mybtn">Log Out</button></p>
  </c:when>

  <c:otherwise>
    <button onclick="location.href='/loginCustomer'" type="button" class="btn btn-primary mb-2">Login</button>
  	<button type="button" class="btn btn-primary mb-2" style="margin-left: 5px;" data-toggle="modal" data-target="#exampleModalCenter">Sign Up</button>
  </c:otherwise>
</c:choose>


    
  </div>
</nav>
 <c:choose>
<c:when test="${log == 'yes'}">
<div class="container">
	<br><br>
      <div class="row gutters-sm">
        <div class="col-md-4 d-none d-md-block">
          <div class="card">
            <div class="card-body">
              <nav class="nav flex-column nav-pills nav-gap-y-1">
                <a href="#profile" data-toggle="tab" class="nav-item nav-link has-icon nav-link-faded active">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user mr-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>User Profile
                </a>
              </nav>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card">
            <div class="card-header border-bottom mb-3 d-flex d-md-none">
               <ul class="nav nav-tabs card-header-tabs nav-gap-x-1" role="tablist">
                <li class="nav-item">
                  <a href="#profile" data-toggle="tab" class="nav-link has-icon active"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg></a>
                </li>
              </ul> 
            </div>
            <div class="card-body tab-content">
              <div class="tab-pane active" id="profile">
                <h6>YOUR PROFILE INFORMATION</h6>
                <hr>
                <form action="/profileUpdate" method="POST">
                <input type="hidden" name="id" value="${sessionScope.id }" />
                  <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input name="username" type="text" class="form-control" id="fullName" aria-describedby="fullNameHelp" placeholder="Enter your fullname" value="${sessionScope.Customerusername }">
                    <small id="fullNameHelp" class="form-text text-muted">Your name may appear around here where you are mentioned.</small>
                  </div>
                  <input type="hidden" name="password" value="${sessionScope.Password }" />
                  <div class="form-group">
                    <label for="fullName">Email</label>
                    <input name="email" type="text" class="form-control" id="mail" aria-describedby="fullNameHelp" placeholder="Mail" value="${sessionScope.Email }">
                  </div>
                  <div class="form-group">
                    <label for="url">Address</label>
                    <input name="address" type="text" class="form-control" id="address" placeholder="address" value="${sessionScope.Address }">
                  </div>
                  <div class="form-group">
                    <label for="url">City</label>
                    <input name="city" type="text" class="form-control" id="city" placeholder="address" value="${sessionScope.City }">
                  </div>
                  <div class="form-group">
                    <label for="url">State</label>
                    <input name="state" type="text" class="form-control" id="state" placeholder="address" value="${sessionScope.State }">
                  </div>
                  <div class="form-group">
                    <label for="location">Phone Number</label>
                    <input name="phonenumber" type="text" class="form-control" id="phonenumber" placeholder="phone number" value="${sessionScope.Phone }">
                  </div>
                  <div class="form-group small text-muted">
                    All of the fields on this page are provided by the user and this page contains some confidential information.
                  </div>
                  <button name = "letsbutton1" type="submit" class="btn btn-primary">Update Profile</button>
					<div class="form-group small text-muted">
                    	(After made changes please logout and login to see the changes.)
                  </div>
                </form>
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:when>
    <c:otherwise>
    
  

     <div class="container">
 <div class="row">
  <div class="col sm-6 ">
   <div class="card " style="margin-top: 30px;">

    <div class="card-header"><h4>User Profile</h4> </div>
  
      <div class="card-body">
   
    
    <form>
   <div class="form-row">
    <div class="form-group col-md-12">
      <strong>Please login to see your profile..</strong>
    </div>
  </div>
     </form>
    </div>
   </div>
  </div>
 </div>
</div>
</c:otherwise>
</c:choose>
</body>
</html>