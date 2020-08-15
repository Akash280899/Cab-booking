<%@page import="java.util.Locale.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	 <% int current = 0;
    int id;
/* ResultSet rs = null; */
String temp1 =  null;
String temp2 =   null;
String temp3 = null;
String vehicleType = null; 
String bookingid = null;
Statement statement = null;
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
statement = connection.createStatement(); 
String query = "SELECT * FROM driver WHERE status='pending' ORDER BY RAND() LIMIT 1;" ;
ResultSet resultset = statement.executeQuery(query); %>

        <% 
        while(resultset.next()){ 
        temp1 =  resultset.getString(2) ;
        temp2 =  resultset.getString(3); 
       	}%>

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
        <a class="nav-link" href="/profile"><i class="fas fa-user"></i><strong> PROFILE</strong></a>
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

    <form>
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

</form>
    
  </div>
</nav>

 <div class="head">
   
   <h1 class="fadeInUp animated">User Friendly. Safe</h1>
   
  <figure class="figure  float-right location fadeIn animated d-md-none d-lg-block d-sm-none d-none ">

   

</figure>

<p class="fadeInUp animated">Your Trusted Ride for Every Occasion</p>

 </div>






  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Create Profile</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <div class="modal-body">
        <form action="save-user" method="post">
         <div class="form-group">
		    <label for="Name">Name</label>
		    <input type="text" class="form-control" id="name" placeholder="Name" name="username" autocomplete="off">
		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputEmail4">Email</label>
		      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="email" >
		    </div>
		    <div class="form-group col-md-6">
		      <label for="inputPassword4">Password</label>
		      <input type="password" class="form-control" id="inputPassword4" placeholder="Password" name="password">
		    </div>
		  </div>
		  
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputLocation" placeholder="Address" name="address" autocomplete="off">
  </div>

  <div class="form-group">
    <label for="inputAddress">Phone Number</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Mobile number" name="phonenumber" autocomplete="off">
  </div>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" placeholder="City" name="city" autocomplete="off">
    </div> 
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control" name="state" >
        <option selected>Choose...</option>
        <option>Andhra Pradesh</option>
        <option>Arunachal Pradesh</option>
        <option>Assam</option>
        <option>Bihar</option>
        <option>Chandigarh</option>       
        <option>Chhattisgarh</option>
        <option>Dadra and Nagar Haveli</option>        
        <option>Daman and Diu</option> 
        <option>Delhi</option>     
        <option>Goa</option>
        <option>Gujarat</option>
        <option>Haryana</option>
        <option>Himachal Pradesh</option>
        <option>Jammu & Kashmir</option>
        <option>Jharkhand</option> 
        <option>Karnataka</option>        
        <option>Kerala</option>        
        <option>Madhya Pradesh</option>        
        <option>Maharashtra</option>       
        <option>Manipur</option>        
        <option>Meghalaya</option>        
        <option>Mizoram</option>        
        <option>Nagaland</option>        
        <option>Odisha</option> 
        <option>Puducherry</option>        
        <option>Punjab</option> 
        <option>Rajasthan</option>        
        <option>Sikkim</option>       
        <option>Tamil Nadu</option>        
        <option>Telangana</option>        
        <option>Tripura</option>        
        <option>Uttarakhand</option>        
        <option>Uttar Pradesh</option>        
        <option>West Bengal</option>        
        <option>Lakshadweep</option>            
      </select>
    </div>
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Sign Up</button>
        </div>
        
        </form>
        </div>
      </div>
    </div>
  </div>
<div class="content">
<div id="book">
<div class="jumbotron jumbotron-fluid">
  <div class="container">


<!-- Fare Estimater -->

    

<div class="container">
 <div class="row  ">
  <div class="col sm-6 ">
   <div class="card " style="margin-top: 30px;">

    <div class="card-header"><h4>Find Cabs</h4> </div>
  
      <div class="card-body">
   
    

      <form action="customer-data" method="post" id="myForm">   
   <div class="form-row">
    <div class="form-group col-md-12">
      <label ><i class="fas fa-circle" style="color: green;"></i>  Enter Pickup</label>
      <input list="origin" type="text" class="form-control" id="origin-input" placeholder="Pickup" name="pickup">

    </div>
    <div class="form-group col-md-12">
      <label ><i class="fas fa-circle" style="color: red;"></i>  Enter Destination</label>
      <input type="text" class="form-control" id="destination-input" placeholder="Destination" name="destination">
    </div>

    
  </div>
 
  <div class="form-check">
  <input id="auto" value="auto" class="form-check-input" type="radio" name="vehicleType" onclick="initMap()">
  <label for="auto">Auto</label>
   <div id="auto1"></div> 
   <input id="amount" name="fare" type="hidden" value=""/> 
</div>
<hr>
<div class="form-check">
  <input id="micro" value="micro" class="form-check-input" type="radio" name="vehicleType" onclick="initMap()">
  <label for="micro">Micro</label>
  <div id="micro1"></div>
  <input id="amount" name="fare" type="hidden" value=""/> 
</div>
<hr>
<div class="form-check ">
  <input id="mini" value="mini" class="form-check-input" type="radio" name="vehicleType" onclick="initMap()">
  <label for="mini">Mini</label>
  <div id="mini1"></div>
  <input id="amount" name="fare" type="hidden" value=""/> 
</div>
<hr>
<div class="form-check ">
  <input id="suv" value="suv" class="form-check-input" type="radio" name="vehicleType" onclick="initMap()">
  <label for="suv">SUV</label>
  <div id="suv1"></div>
  <input id="amount" name="fare" type="hidden" value=""/> 
</div>
  <hr>
 		<input id="location" name="location" type="hidden" value=""/> 
		<input id="driverName" name="driverName" type="hidden" value="<%=temp2 %>"/> 
		<input id="carNumber" name="carNumber" type="hidden" value=""/>
        <input id="otp" name="otp" type="hidden" value=""/>
        <input id="driverImage" name="driverImage" type="hidden" value=""/>
        <input id="driverId" name="driverId" type="hidden" value="<%=temp1 %>"/>
        <input id="bookingId" name="bookingId" type="hidden" value=""/>
        <input type="submit" value="Sign In" style="display:none">
        <input name="status" value="pending" style="display:none"/>
        <c:choose>
	  <c:when test="${log == 'yes'}">
	    	 <button type="submit" class="btn btn-primary btn-lg btn-block mybtn" style="vertical-align:middle">Book Cab</button>   
	  </c:when>
	
	  <c:otherwise>
	  	<p style="text-align:center">Please Login to book a Cab!</p>
	   <button type="submit" class="btn btn-primary btn-lg btn-block mybtn" style="vertical-align:middle" disabled>Book Cab</button>   
	  </c:otherwise>
	</c:choose>
		
     </form>
    </div>
   </div>
  </div>
   
   <div class="col-sm-6">
     <div class="card" style="margin-top: 30px;">
      <div class="card-body" style="margin: 0;">
         
        <div id="map" class="z-depth-1-half map-container" style="height: 500px"></div>
 
         
      </div>
    </div>
   </div>
 </div>
</div>

 <!-- Fare Estimater Ends Here -->

  </div>
</div>
</div>
</div>
 
<!-- Footer starts-->

<div class="jumbotron jumbotron-fluid" style="background-color: #282C35; color: white;">
</div>




<div class="last">
 &copy; V CABS 2020. All Rights Reserved.
  <div class="footicon" style="margin-bottom: 10px;">
    <a href="" target="_blank"><i style="font-size:28px; margin-right: 10px; " class="fa">&#xf082;</i></a>
    <a href=""><i style="font-size:28px; margin-right: 10px;" class="fa">&#xf099;</i></a>
    <a href=""><i style="font-size:28px;" class="fa">&#xf16d;</i></a>
 </div>

</div>
<%--  </c:when>
</c:choose> --%>

<!--Footer Ends-->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- MAPS-->

     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1R5QWrqEMfU9qPpah3ufkQmeSWBEVtRo&libraries=places&callback=initMap" async defer></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    
      <script type="text/javascript">
      var markers = [];
      function myFunction() {}
      function generateRandomPoints(center, radius, count) {
              var points = [];
              for (var i=0; i<count; i++) {
                points.push(generateRandomPoint(center, radius));
              }
              return points;
      }
      function generateRandomPoint(center, radius) {
              var x0 = center.lng;
              var y0 = center.lat;
              var rd = radius/111300;
              var u = Math.random();
              var v = Math.random();
              var w = rd * Math.sqrt(u);
              var t = 2 * Math.PI * v;
              var x = w * Math.cos(t);
              var y = w * Math.sin(t);
              var xp = x/Math.cos(y0);
              return {'lat': y+y0, 'lng': xp+x0};
        }
      function getLocation(address) {
              var geocoder = new google.maps.Geocoder();
              geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                  var latitude = results[0].geometry.location.lat();
                  var longitude = results[0].geometry.location.lng();
                  }  
              localStorage.setItem("endlat", latitude);
              localStorage.setItem("endlng", longitude);   
        }); 
        var end_lat = localStorage.getItem("endlat");
        var end_lng = localStorage.getItem("endlng");
        console.log("latiude" + end_lat);
        return [end_lat,end_lng];
    }
    function getLocationDest(address) {
              var geocoder = new google.maps.Geocoder();
              geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                  var latitude = results[0].geometry.location.lat();
                  var longitude = results[0].geometry.location.lng();
                  }  
              localStorage.setItem("endlatdest", latitude);
              localStorage.setItem("endlngdest", longitude);   
        }); 
        var end_latdest = localStorage.getItem("endlatdest");
        var end_lngdest = localStorage.getItem("endlngdest");
        console.log("latiude" + end_latdest);
        return [end_latdest,end_lngdest];
    }
      function initMap() {
    	  var drivers = { 1 : {
    		     Car:"TN 01 CB 0256",
    		     Image:"assests/av2.png" },
    		     2 : {
    		   Car: 'TN 10 JB 2258',
    		   Image:"assests/av3.jpg"  },
    		     3: {
    		       Car:'TN 25 JK 5269',
    		       Image:"assests/av1.png" }
    		 };
    	  var  Customerans = drivers[Object.keys(drivers)[Math.floor(Math.random()*Object.keys(drivers).length)]];
    	  var otp = Math.floor(Math.random() * 99999) + 10000;
    	  var result = '';
    	  var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    	  var charactersLength = characters.length;
    	  for ( var i = 0; i < 8; i++ ) {
    	      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    	  }
    	   var keyAns = result;
    	  //document.getElementById('driverName').value = Customerans.Name;
    	  document.getElementById('carNumber').value = Customerans.Car;
    	  document.getElementById('driverImage').value =  Customerans.Image;
    	  //document.getElementById('driverId').value = Customerans.DriverId;
    	  document.getElementById('otp').value = otp;
    	  document.getElementById('bookingId').value = keyAns;
        var location = document.getElementById('inputLocation').value;
        var map = new google.maps.Map(document.getElementById('map'), {
              mapTypeControl: false,
              center: {lat: 11.173019, lng: 77.270387},
              zoom: 13
        });
		
        new AutocompleteDirectionsHandler(map);

        if(document.getElementById("auto").checked) {
          var fare1 ;
          var fare2 ;
          var fare3 ;
          var fare4 ;
          var start = document.getElementById('origin-input').value;
          var dest = document.getElementById('destination-input').value;
          var ans = getLocation(start);
          var destans = getLocationDest(dest);
          var lat = ans[0];
          var lng = ans[1];
          var latdest = destans[0];
          var lngdest = destans[1];
          var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat, lng), new google.maps.LatLng(latdest, lngdest));
          console.log("distance" + distance); 
          var dis = distance/1000;
          dis = dis.toFixed(1);
          if(dis<=4) {
            fare1 = 29;
          }
          else {
            fare1 = dis * 12 ;
            fare1 = Math.round(fare1);
          }	
          document.getElementById("auto1").innerHTML =  "Auto Fare is " + '<b>' + 'Rs'+ fare1 + '/-'+ "</b>" + "<br>" + 'Distance is ' + "<b>" + Math.round(dis)+ "KM"  + "</b>";
          document.getElementById('amount').value = Number(fare1);
          var infowindow =  new google.maps.InfoWindow({});
          var mark, count,temp;
          var lat1 = Number(lat);
          var lng1 = Number(lng);
          console.log("latitudelongtitude"+ lat1 + lng1);
          var icon = {
            url: "assests/auto.png", // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0,0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
          };
          const initialPosition = { lat: lat1, lng: lng1 };
          var map = new google.maps.Map(document.getElementById('map'), {
                  mapTypeControl: false,
                  center: initialPosition,
                  zoom: 13
          });
          markerYour = new google.maps.Marker({
       	   position: new google.maps.LatLng(lat1, lng1),
       	   map: map,
       	   title:"Your Location"
       	});
          //new AutocompleteDirectionsHandler(map);
                  
          for (count = 0; count < 5; count++) {
            var randomGeoPoints = generateRandomPoints({'lat':lat1, 'lng':lng1}, 250, 1);
            for(temp=0;temp<randomGeoPoints.length;temp++) {
              mark = new google.maps.Marker({
              position: new google.maps.LatLng(randomGeoPoints[temp].lat,randomGeoPoints[temp].lng),
              map: map,
              visible: true,
              icon:icon
              //title: 'Your Location'
              });
              markers.push(mark);
            }
           
            google.maps.event.addListener(map, 'mousemove', find_closest_marker);
            function find_closest_marker(event) {
          	  var distances = [];
          	  var closest = -1;
          	  for (i = 0; i < markers.length; i++) {
          		var d = google.maps.geometry.spherical.computeDistanceBetween(markers[i].position, event.latLng);
          		distances[i] = d;
          		if (closest == -1 || d < distances[closest]) {
          		  closest = i;
          		}
          	  }
          	    var myJSON = JSON.stringify(markers[closest].position);
          	  	var str = myJSON;
          	  	var res = str.replace(")","");
          	  	var res = res.replace("(","");
          	    var obj = JSON.parse(res);
				document.getElementById('location').value = obj.lat+","+obj.lng;
          	}
            
          	
             google.maps.event.addListener(map, 'click', function() {
              var result = [lat1, lng1];
              transition(result);
                  });

                  var marker=undefined;
                  var numDeltas = 100;
                  var delay = 10; //milliseconds
                  var i = 0;
                  var deltaLat;
                  var deltaLng;
                  function transition(result){
                      i = 0;
                      deltaLat = (result[0] - lat1)/numDeltas;
                      deltaLng = (result[1] - lng1)/numDeltas;
                      moveMarker();
                  }

                function moveMarker(){
                    lat1 += deltaLat;
                    lng1 += deltaLng;
                    var latlng = new google.maps.LatLng(lat1, lng1);
                    marker.setPosition(latlng);
                    if(i!=numDeltas){
                        i++;
                        setTimeout(moveMarker, delay);
                    }
                }
    }
          }
          if(document.getElementById("micro").checked) {
          var fare2 ;
          var start = document.getElementById('origin-input').value;
          var dest = document.getElementById('destination-input').value;
          var ans = getLocation(start);
          var destans = getLocationDest(dest);
          var lat = ans[0];
          var lng = ans[1];
          var latdest = destans[0];
          var lngdest = destans[1];
          var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat, lng), new google.maps.LatLng(latdest, lngdest));
          console.log("distance" + distance); 
          var dis = distance/1000;
          dis = dis.toFixed(1);
          fare2 = dis * 9 ;
          fare2 = Math.round(fare2);
          document.getElementById("micro1").innerHTML =  "Micro Fare is " + '<b>' + 'Rs'+ fare2 + '/-'+ "</b>" + "<br>" + 'Distance is ' + "<b>" + Math.round(dis)+ "KM"  + "</b>";            
          document.getElementById('amount').value = fare2;
          var infowindow =  new google.maps.InfoWindow({});
          var mark, count,temp;
          var lat1 = Number(lat);
          var lng1 = Number(lng);
          console.log("latitudelongtitude"+ lat1 + lng1);
          var icon = {
            url: "assests/micro.png", // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0,0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
          };
          const initialPosition = { lat: lat1, lng: lng1 };
          var map = new google.maps.Map(document.getElementById('map'), {
                  mapTypeControl: false,
                  center: initialPosition,
                  zoom: 13
          });
          markerYour = new google.maps.Marker({
          	   position: new google.maps.LatLng(lat1, lng1),
          	   map: map,
          	   title:"Your Location"
          	});
             
          for (count = 0; count < 5; count++) {
            var randomGeoPoints = generateRandomPoints({'lat':lat1, 'lng':lng1}, 250, 1);
            for(temp=0;temp<randomGeoPoints.length;temp++) {
              mark = new google.maps.Marker({
              position: new google.maps.LatLng(randomGeoPoints[temp].lat,randomGeoPoints[temp].lng),
              map: map,
              visible: true,
              icon:icon
              //title: 'Your Location'
              });
              markers.push(mark);
            }
            google.maps.event.addListener(map, 'mousemove', find_closest_marker);
            function find_closest_marker(event) {
          	  var distances = [];
          	  var closest = -1;
          	  for (i = 0; i < markers.length; i++) {
          		var d = google.maps.geometry.spherical.computeDistanceBetween(markers[i].position, event.latLng);
          		distances[i] = d;
          		if (closest == -1 || d < distances[closest]) {
          		  closest = i;
          		}
          	  }
          	    var myJSON = JSON.stringify(markers[closest].position);
          	  	var str = myJSON;
          	  	var res = str.replace(")","");
          	  	var res = res.replace("(","");
          	    var obj = JSON.parse(res);
				document.getElementById('location').value = obj.lat+","+obj.lng;
          	}
             google.maps.event.addListener(map, 'click', function() {
               //console.log("latitudelongtitude" +lat1+lng1);
              var result = [lat1, lng1];
              transition(result);
                  });

                  var marker=undefined;
                  var numDeltas = 100;
                  var delay = 10; //milliseconds
                  var i = 0;
                  var deltaLat;
                  var deltaLng;
                  function transition(result){
                      i = 0;
                      deltaLat = (result[0] - lat1)/numDeltas;
                      deltaLng = (result[1] - lng1)/numDeltas;
                      moveMarker();
                  }

                function moveMarker(){
                    lat1 += deltaLat;
                    lng1 += deltaLng;
                    var latlng = new google.maps.LatLng(lat1, lng1);
                    marker.setPosition(latlng);
                    if(i!=numDeltas){
                        i++;
                        setTimeout(moveMarker, delay);
                    }
                }
    }
          }
          if(document.getElementById("mini").checked) {
          var fare3 ;
          var start = document.getElementById('origin-input').value;
          var dest = document.getElementById('destination-input').value;
          var ans = getLocation(start);
          var destans = getLocationDest(dest);
          var lat = ans[0];
          var lng = ans[1];
          var latdest = destans[0];
          var lngdest = destans[1];
          var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat, lng), new google.maps.LatLng(latdest, lngdest));
          console.log("distance" + distance); 
          var dis = distance/1000;
          dis = dis.toFixed(1);
          fare3 = dis * 11 ;
          fare3 = Math.round(fare3);
          document.getElementById("mini1").innerHTML =  "Mini Fare is " + '<b>' + 'Rs'+ fare3 + '/-'+ "</b>" + "<br>" + 'Distance is ' + "<b>" + Math.round(dis)+ "KM"  + "</b>";          
          document.getElementById('amount').value = fare3;
          var infowindow =  new google.maps.InfoWindow({});
          var mark, count,temp;
          var lat1 = Number(lat);
          var lng1 = Number(lng);
          console.log("latitudelongtitude"+ lat1 + lng1);
          var icon = {
            url: "assests/mini.png", // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0,0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
          };
          const initialPosition = { lat: lat1, lng: lng1 };
          var map = new google.maps.Map(document.getElementById('map'), {
                  mapTypeControl: false,
                  center: initialPosition,
                  zoom: 13
          });
          markerYour = new google.maps.Marker({
         	   position: new google.maps.LatLng(lat1, lng1),
         	   map: map,
         	   title:"Your Location"
         	});
                  
          for (count = 0; count < 5; count++) {
            var randomGeoPoints = generateRandomPoints({'lat':lat1, 'lng':lng1}, 250, 1);
            for(temp=0;temp<randomGeoPoints.length;temp++) {
              mark = new google.maps.Marker({
              position: new google.maps.LatLng(randomGeoPoints[temp].lat,randomGeoPoints[temp].lng),
              map: map,
              visible: true,
              icon:icon
              //title: 'Your Location'
              });
              markers.push(mark);
            }
            google.maps.event.addListener(map, 'mousemove', find_closest_marker);
            function find_closest_marker(event) {
          	  var distances = [];
          	  var closest = -1;
          	  for (i = 0; i < markers.length; i++) {
          		var d = google.maps.geometry.spherical.computeDistanceBetween(markers[i].position, event.latLng);
          		distances[i] = d;
          		if (closest == -1 || d < distances[closest]) {
          		  closest = i;
          		}
          	  }
          	    var myJSON = JSON.stringify(markers[closest].position);
          	  	var str = myJSON;
          	  	var res = str.replace(")","");
          	  	var res = res.replace("(","");
          	    var obj = JSON.parse(res);
				document.getElementById('location').value = obj.lat+","+obj.lng;
          	}
             google.maps.event.addListener(map, 'click', function() {
               //console.log("latitudelongtitude" +lat1+lng1);
              var result = [lat1, lng1];
              transition(result);
                  });

                  var marker=undefined;
                  var numDeltas = 100;
                  var delay = 10; //milliseconds
                  var i = 0;
                  var deltaLat;
                  var deltaLng;
                  function transition(result){
                      i = 0;
                      deltaLat = (result[0] - lat1)/numDeltas;
                      deltaLng = (result[1] - lng1)/numDeltas;
                      moveMarker();
                  }

                function moveMarker(){
                    lat1 += deltaLat;
                    lng1 += deltaLng;
                    var latlng = new google.maps.LatLng(lat1, lng1);
                    marker.setPosition(latlng);
                    if(i!=numDeltas){
                        i++;
                        setTimeout(moveMarker, delay);
                    }
                }
    }
          }
          if(document.getElementById("suv").checked) {
          var fare4 ;
          var start = document.getElementById('origin-input').value;
          var dest = document.getElementById('destination-input').value;
          var ans = getLocation(start);
          var destans = getLocationDest(dest);
          var lat = ans[0];
          var lng = ans[1];
          var latdest = destans[0];
          var lngdest = destans[1];
          var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat, lng), new google.maps.LatLng(latdest, lngdest));
          console.log("distance" + distance); 
          var dis = distance/1000;
          dis = dis.toFixed(1);
          fare4 = dis * 13 ;
          fare4 = Math.round(fare4);
          document.getElementById("suv1").innerHTML =  "SUV Fare is " + '<b>' + 'Rs'+ fare4 + '/-'+ "</b>" + "<br>" + 'Distance is ' + "<b>" + Math.round(dis)+ "KM"  + "</b>";        
          document.getElementById('amount').value = fare4;
          var infowindow =  new google.maps.InfoWindow({});
          var mark, count,temp;
          var lat1 = Number(lat);
          var lng1 = Number(lng);
          console.log("latitudelongtitude"+ lat1 + lng1);
          var icon = {
            url: "assests/suv.png", // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0,0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
          };
          const initialPosition = { lat: lat1, lng: lng1 };
          var map = new google.maps.Map(document.getElementById('map'), {
                  mapTypeControl: false,
                  center: initialPosition,
                  zoom: 13
          });
          markerYour = new google.maps.Marker({
         	   position: new google.maps.LatLng(lat1, lng1),
         	   map: map,
         	   title:"Your Location"
         	});
                  
          for (count = 0; count < 5; count++) {
            var randomGeoPoints = generateRandomPoints({'lat':lat1, 'lng':lng1}, 250, 1);
            for(temp=0;temp<randomGeoPoints.length;temp++) {
              mark = new google.maps.Marker({
              position: new google.maps.LatLng(randomGeoPoints[temp].lat,randomGeoPoints[temp].lng),
              map: map,
              visible: true,
              icon:icon
              //title: 'Your Location'
              });
              markers.push(mark);
            }
            google.maps.event.addListener(map, 'mousemove', find_closest_marker);
            function find_closest_marker(event) {
          	  var distances = [];
          	  var closest = -1;
          	  for (i = 0; i < markers.length; i++) {
          		var d = google.maps.geometry.spherical.computeDistanceBetween(markers[i].position, event.latLng);
          		distances[i] = d;
          		if (closest == -1 || d < distances[closest]) {
          		  closest = i;
          		}
          	  }
          	    var myJSON = JSON.stringify(markers[closest].position);
          	  	var str = myJSON;
          	  	var res = str.replace(")","");
          	  	var res = res.replace("(","");
          	    var obj = JSON.parse(res);
				document.getElementById('location').value = obj.lat+","+obj.lng;
          	}

             google.maps.event.addListener(map, 'click', function() {
               //console.log("latitudelongtitude" +lat1+lng1);
              var result = [lat1, lng1];
              transition(result);
                  });

                  var marker=undefined;
                  var numDeltas = 100;
                  var delay = 10; //milliseconds
                  var i = 0;
                  var deltaLat;
                  var deltaLng;
                  function transition(result){
                      i = 0;
                      deltaLat = (result[0] - lat1)/numDeltas;
                      deltaLng = (result[1] - lng1)/numDeltas;
                      moveMarker();
                  }

                function moveMarker(){
                    lat1 += deltaLat;
                    lng1 += deltaLng;
                    var latlng = new google.maps.LatLng(lat1, lng1);
                    marker.setPosition(latlng);
                    if(i!=numDeltas){
                        i++;
                        setTimeout(moveMarker, delay);
                    }
                }
    }
          }
          if ('geolocation' in navigator) {
              navigator.geolocation.getCurrentPosition(function(position) {
                  let lat = position.coords.latitude;
                  let long = position.coords.longitude;
                  //console.log("inside" + latitude + "insie" + longitude);
                  console.log(lat,long);
                  const initialPosition = { lat: lat, lng: long };

                    // var map = new google.maps.Map(document.getElementById('map'), {
                    //         mapTypeControl: false,
                    //         center: initialPosition,
                    //         zoom: 13
                    // });

                  new AutocompleteDirectionsHandler(map);
                  });
               
  }else { alert('Geolocation is not supported by your browser.');}
          
        }
        
        function AutocompleteDirectionsHandler(map) {
          this.map = map;
          this.originPlaceId = null;
          this.destinationPlaceId = null;
          this.travelMode = 'TRANSIT';
          var originInput = document.getElementById('origin-input');
          var destinationInput = document.getElementById('destination-input');
          //var modeSelector = document.getElementById('mode-selector');
          this.directionsService = new google.maps.DirectionsService;
          this.directionsDisplay = new google.maps.DirectionsRenderer;
          this.directionsDisplay.setMap(map);

          var originAutocomplete = new google.maps.places.Autocomplete(
              originInput, {placeIdOnly: true});
              
          var destinationAutocomplete = new google.maps.places.Autocomplete(
              destinationInput, {placeIdOnly: true});

         // this.setupClickListener('changemode-walking', 'WALKING');
          //this.setupClickListener('changemode-transit', 'TRANSIT');
          //this.setupClickListener('changemode-driving', 'DRIVING');

          this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
          this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

       /* this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
          this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
          this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);*/
        }

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
       /* AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
          var radioButton = document.getElementById(id);
          var me = this;
          radioButton.addEventListener('click', function() {
            me.travelMode = mode;
            me.route();
          });
        };*/

        AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
          var me = this;
          autocomplete.bindTo('bounds', this.map);
          autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.place_id) {
              window.alert("Please select an option from the dropdown list.");
              return;
            }

            if (mode === 'ORIG') {
              me.originPlaceId = place.place_id;
            } else {
              me.destinationPlaceId = place.place_id;
            }
            me.route();
          });

        };

        AutocompleteDirectionsHandler.prototype.route = function() {
          if (!this.originPlaceId || !this.destinationPlaceId) {
            return;
          }
          var me = this;

          this.directionsService.route({
            origin: {'placeId': this.originPlaceId},
            destination: {'placeId': this.destinationPlaceId},
            travelMode: this.travelMode
          }, function(response, status) {
            if (status === 'OK') {
              me.directionsDisplay.setDirections(response);
              
            } else {
              window.alert('Directions request failed due to ' + status);
            }
          });
        };

        function showPosition() {
        if(navigator.geolocation) {
          
            navigator.geolocation.getCurrentPosition(showMap, showError);
        } else {
          alert("Sorry, your browser does not support HTML5 geolocation.");
        }
  }

		function redirect() {
			window.location = "/login";
			}



    </script>

   


  </body>
</html>
