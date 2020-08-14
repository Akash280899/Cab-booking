<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


    </style>

  </head>
  <body onload="initialize()">

    <% int current = 0;
    int id;
/* ResultSet rs = null; */
String temp3 =  null;
String temp4 =   null;
String temp5 = null;
String vehicleType = null; 
String bookingid = null;
Statement statement = null;
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
statement = connection.createStatement(); 
/* String query = "SELECT * From booking,customer where booking.driver_id=3 and booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ; */
String query = "SELECT * From booking,customer where booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ;
ResultSet resultset = statement.executeQuery(query); %>

        <% 
        while(resultset.next()){ 
        	 
       //String temp = resultset.getString(1);
       //String temp1 = resultset.getString(2);
        //String temp2 = resultset.getString(3);
        temp3 =  resultset.getString(5) ;
        temp4 =  resultset.getString(9); 
        temp5 = resultset.getString(12); 
         vehicleType = resultset.getString(7);
        bookingid = resultset.getString(15);
        out.println(temp3);out.println(temp4);out.println(temp5);%>
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

      <li class="nav-item">
        <a class="nav-link" href="# "><i class="fas fa-user"></i><strong> PROFILE</strong></a>
      </li>

      
    </ul>
    <p class="nav_p"><img src="assests/lg3.png" width="35" height="35" class="d-inline-block align-top" ><strong style=" font-family: lato;">  Hello..  </strong><span>Driver Name</span>
     <button type="button" class="btn btn-danger mybtn">Log Out</button></p>
  
   

  </div>
</nav>

 <div class="head">
   
   <h1 class="fadeInUp animated">Reliable. Safe. Transparent.</h1>
   
  <figure class="figure  float-right location fadeIn animated d-md-none d-lg-block d-sm-none d-none ">

   

</figure>


 </div>

<% if(resultset.getInt(14)==1) { %>
        	 
     <div class="container">
 <div class="row">
  <div class="col sm-6 ">
   <div class="card " style="margin-top: 30px;">

    <div class="card-header"><h4>Customer Pickup</h4> </div>
  
      <div class="card-body">
   
    
    <form>
   <div class="form-row">
    <div class="form-group col-md-12">
      <label ><i class="fas fa-circle" style="color: green;"></i>Pickup Location</label> <br>
      <strong><%=resultset.getString(5)  %></strong>
      <input type="hidden" name="city" id="city" value=""/>
    </div>
  </div>
<!-- id="btnSubmit" onclick="return calcRoute();"  -->
 <button value="lets" type="submit" class="btn btn-primary " style="vertical-align:middle" name="letsButton">Lets Ride</button>
	<% out.println("button" + request.getParameter("letsButton"));
  if (request.getParameter("letsButton") != null) {
	  out.println("inside");
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
      Statement stmnt = conn.createStatement();
      stmnt.executeUpdate("UPDATE customer set status='booked' ORDER BY customer.id DESC LIMIT 1");
    } catch (Exception e) {
    }
  }
%>
	<button id="modalButton" type="button" class="btn btn-primary">Enter OTP</button>
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
<% } else { %>
     <div class="container">
 <div class="row">
  <div class="col sm-6 ">
   <div class="card " style="margin-top: 30px;">

    <div class="card-header"><h4>Customer Pickup</h4> </div>
  
      <div class="card-body">
   
    
    <form>
   <div class="form-row">
    <div class="form-group col-md-12">
      <%-- <label ><i class="fas fa-circle" style="color: green;"></i>Pickup Location</label> <br>
      <strong><%=resultset.getString(5)  %></strong> --%>
      <strong>No Current customer found for you..</strong>
      <input type="hidden" name="city" id="city" value=""/>
    </div>
  </div>


     </form>
    </div>
   </div>
  </div>
   
   

 </div>
</div>
<% } %>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">OTP VERIFICATION</h5>
      </div>
      
      <div class="modal-body">
        <form action="" method="post">
        
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <input type="text" class="form-control" id="otp" placeholder="Enter customer OTP.." name="otp" autocomplete="off">
		      </div>
		      <span class="input-group-btn">
        <button onclick="verify();" type="button" class="btn btn-primary">Lets Ride</button>
        
 		  </span>
		  </div>
        </form>
        </div>
      </div>
    </div>
  </div>
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
    	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD1R5QWrqEMfU9qPpah3ufkQmeSWBEVtRo"></script> 
	<script type ="text/javascript" src="js/script.js"></script> 
	<script>
	$(document).ready(function() {
	 	   $('#modalButton').prop('disabled', true);
	 });
	 <%-- $('#btnSubmit').click(function(){
	 	   $(this).prop('disabled', true);
	 	   $('#modalButton').prop('disabled', false);	
	 	    <% 
	 	    Statement statement1 = null;
	 	 	statement1 = connection.createStatement();
	 	   String query1 = "UPDATE customer set status='booked' ORDER BY customer.id DESC LIMIT 1";
	 	   	Integer resultset1 = statement1.executeUpdate(query1); %>   
	 	}); --%>

	    $('#modalButton').click(function(){
	 	   $('#myModal').modal('show');
	 	});
	
	
     </script>
	  <% 
	connection.close();
    statement.close();
    resultset.close();%>
	<script>
	
	 	
	var cityName = "";
	var value = "<%= temp4 %>";
	var vehicleType = "<%= vehicleType%>";
	var pickupDest = "<%=temp3 %>";
	console.log("pik"+pickupDest);
	/* alert(pickupDest); */
	var otpValue = "<%= temp5 %>";
	console.log("otp" + otpValue);
	console.log(typeof(value) + "value");
	var value = value.split(",");
	var lat1 = value[0];
	var lng1 = value[1]; 
	 var lat=lat1;
    var lon=lng1;
    var ansvalue;
    
    displayLocation(lat,lon);
    
  
    
    const autoAns =  vehicleType.localeCompare("auto");
	const microAns = vehicleType.localeCompare("micro");
	const miniAns = vehicleType.localeCompare("mini");
	const suvAns = vehicleType.localeCompare("suv");
	if(autoAns==0) {
		 var car = "M17.402,0H5.643C2.526,0,0,3.467,0,6.584v34.804c0,3.116,2.526,5.644,5.643,5.644h11.759c3.116,0,5.644-2.527,5.644-5.644 V6.584C23.044,3.467,20.518,0,17.402,0z M22.057,14.188v11.665l-2.729,0.351v-4.806L22.057,14.188z M20.625,10.773 c-1.016,3.9-2.219,8.51-2.219,8.51H4.638l-2.222-8.51C2.417,10.773,11.3,7.755,20.625,10.773z M3.748,21.713v4.492l-2.73-0.349 V14.502L3.748,21.713z M1.018,37.938V27.579l2.73,0.343v8.196L1.018,37.938z M2.575,40.882l2.218-3.336h13.771l2.219,3.336H2.575z M19.328,35.805v-7.872l2.729-0.355v10.048L19.328,35.805z";
		var icon = {
		    path: car,
		    scale: .7,
		    strokeColor: 'white',
		    strokeWeight: .10,
		    fillOpacity: 1,
		    fillColor: '#404040',
		    offset: '5%',
		    // rotation: parseInt(heading[i]),
		    anchor: new google.maps.Point(10, 25) // orig 10,50 back of car, 10,0 front of car, 10,25 center of car
		}; 
	}
	else if(microAns==0) {
		var image = {
				  url: "assests/micro.png",
				  size: new google.maps.Size(81, 81),
				  origin: new google.maps.Point(0, 0),
				  anchor: new google.maps.Point(17, 34),
				  scaledSize: new google.maps.Size(45, 45)
				};
	}
	else if(miniAns==0) {
		var image = {
				  url: "assests/mini.png",
				  size: new google.maps.Size(81, 81),
				  origin: new google.maps.Point(0, 0),
				  anchor: new google.maps.Point(17, 34),
				  scaledSize: new google.maps.Size(45, 45)
				};
	}
	else if(suvAns==0) {
		var image = {
				  url: "assests/suv.png",
				  size: new google.maps.Size(81, 81),
				  origin: new google.maps.Point(0, 0),
				  anchor: new google.maps.Point(17, 34),
				  scaledSize: new google.maps.Size(45, 45)
				};
	}
    
    
   


    function verify() {
		var otp = document.getElementById('otp').value;
		const otpAns =  otpValue.localeCompare(otp);
		if(otpAns==0) {
			window.location = "/DriverFinal";
			}
		else {
			alert("Enter the correct otp..");
			}
        }
    function displayLocation(latitude,longitude){ 
    	var geocoder;
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(latitude, longitude);
        geocoder.geocode(
                {'latLng': latlng}, 
                function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[0]) {
                            var add= results[0].formatted_address ;
         					console.log("add " + add);
                            localStorage.setItem("ansvalue", add);
    					     } } }); 
        } 
    cityName = localStorage.getItem("ansvalue");
	
    var map;
    var directionDisplay;
    var directionsService;
    var stepDisplay;
    var markerArray = [];
    var position;
    var marker = null;
    var polyline = null;
    var poly2 = null;
    var speed = 2,
        wait = 1;
    var infowindow = null;
    var timerHandle = null;

    function createMarker(latlng, label, html) {
        var contentString = '<b>' + label + '</b><br>' + html;
        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: label,
            zIndex: Math.round(latlng.lat() * -100000) << 5
        });
        marker.myname = label;
        google.maps.event.addListener(marker, 'click', function () {
            infowindow.setContent(contentString);
            infowindow.open(map, marker);
        });
        return marker;
    }

    function initialize() {
        infowindow = new google.maps.InfoWindow({
            size: new google.maps.Size(150, 50)
        });
        // Instantiate a directions service.
        directionsService = new google.maps.DirectionsService();

        // Create a map and center it on Manhattan.
        var myOptions = {
            zoom: 13,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);

        address = 'new york';
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            'address': cityName
        }, function (results, status) {
            map.setCenter(results[0].geometry.location);
        });

        // Create a renderer for directions and bind it to the map.
        var rendererOptions = {
            map: map
        };
        directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);

        // Instantiate an info window to hold step text.
        stepDisplay = new google.maps.InfoWindow();

        polyline = new google.maps.Polyline({
            path: [],
            strokeColor: '#FFFF00',
            strokeWeight: 3
        });
        poly2 = new google.maps.Polyline({
            path: [],
            strokeColor: '#FFFF00',
            strokeWeight: 3
        });
    }

    var steps = [];

    function calcRoute() {

        if (timerHandle) {
            clearTimeout(timerHandle);
        }
        if (marker) {
            marker.setMap(null);
        }
        polyline.setMap(null);
        poly2.setMap(null);
        directionsDisplay.setMap(null);
        polyline = new google.maps.Polyline({
            path: [],
            strokeColor: '#FFFF00',
            strokeWeight: 3
        });
        poly2 = new google.maps.Polyline({
            path: [],
            strokeColor: '#FFFF00',
            strokeWeight: 3
        });
        // Create a renderer for directions and bind it to the map.
        var rendererOptions = {
            map: map
        };
        directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);

        var start = cityName;
        var end = pickupDest;
        var travelMode = google.maps.DirectionsTravelMode.DRIVING;

        var request = {
            origin: start,
            destination: end,
            travelMode: travelMode
        };

        // Route the directions and pass the response to a
        // function to create markers for each step.
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);

                var bounds = new google.maps.LatLngBounds();
                var route = response.routes[0];
                startLocation = new Object();
                endLocation = new Object();

                // For each route, display summary information.
                var path = response.routes[0].overview_path;
                var legs = response.routes[0].legs;
                for (i = 0; i < legs.length; i++) {
                    if (i === 0) {
                        startLocation.latlng = legs[i].start_location;
                        startLocation.address = legs[i].start_address;
                        //   marker = createMarker(legs[i].start_location, "start", legs[i].start_address, "green");
                    }
                    endLocation.latlng = legs[i].end_location;
                    endLocation.address = legs[i].end_address;
                    var steps = legs[i].steps;
                    for (j = 0; j < steps.length; j++) {
                        var nextSegment = steps[j].path;
                        for (k = 0; k < nextSegment.length; k++) {
                            polyline.getPath().push(nextSegment[k]);
                            bounds.extend(nextSegment[k]);
                        }
                    }
                }
                polyline.setMap(map);
                map.fitBounds(bounds);
                map.setZoom(18);
                startAnimation();
            }
        });
    }



    var step = 50; // 5; // metres
    var tick = 100; // milliseconds
    var eol;
    var k = 0;
    var stepnum = 0;
    var speed = "";
    var lastVertex = 1;

    //=============== animation functions ======================
    function updatePoly(d) {
        // Spawn a new polyline every 20 vertices, because updating a 100-vertex poly is too slow
        if (poly2.getPath().getLength() > 20) {
            poly2 = new google.maps.Polyline([polyline.getPath().getAt(lastVertex - 1)]);
            // map.addOverlay(poly2)
        }

        if (polyline.GetIndexAtDistance(d) < lastVertex + 2) {
            if (poly2.getPath().getLength() > 1) {
                poly2.getPath().removeAt(poly2.getPath().getLength() - 1);
            }
            poly2.getPath().insertAt(poly2.getPath().getLength(), polyline.GetPointAtDistance(d));
        } else {
            poly2.getPath().insertAt(poly2.getPath().getLength(), endLocation.latlng);
        }
    }

    function animate(d) {
        if (d > eol) {
            map.panTo(endLocation.latlng);
            marker.setPosition(endLocation.latlng);
            return;
        }
        var p = polyline.GetPointAtDistance(d);
        map.panTo(p);
        var lastPosn = marker.getPosition();
        marker.setPosition(p);
        var heading = google.maps.geometry.spherical.computeHeading(lastPosn, p);
        icon.rotation = heading;
        marker.setIcon(icon);
        updatePoly(d);
        timerHandle = setTimeout("animate(" + (d + step) + ")", tick);
    }

    function startAnimation() {
        eol = polyline.Distance();
        map.setCenter(polyline.getPath().getAt(0));
        marker = new google.maps.Marker({
            position: polyline.getPath().getAt(0),
            map: map,
            icon: icon
        });

        poly2 = new google.maps.Polyline({
            path: [polyline.getPath().getAt(0)],
            strokeColor: "#FFFF00",
            strokeWeight: 10
        });
        // map.addOverlay(poly2);
        setTimeout("animate(50)", 2000); // Allow time for the initial map display
    }
    google.maps.event.addDomListener(window, 'load', initialize);
				
    </script>
    <!-- <script type ="text/javascript" src="js/script1.js"></script>  -->
  </body>
</html>