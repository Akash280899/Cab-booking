<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="com.akj.carproj.LatLng.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.akj.carproj.LatLng.Coordinates"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="assests/lg3.png" type="image/gif" sizes="16x16">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>V CABS</title>
   <style type="text/css">
    body{
      background-image: url("assests/img3.jpg");
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
      opacity: 0.85;
    }
     .maincard{
      margin: 50px;

     }
     .card-title{
      font-style: italic;
      text-decoration: underline;
     }
     p{
      font-weight: bold;
      font-size: 20px;
      font-family: lato;
     }
     .mybtn{
      border-radius: 0;
     }
   </style>
  </head>
  <body onload="initialize()">
  <% int current = 0;
ResultSet rs = null;
Statement statement = null;
String vehicleType = null;
String location = null;
String temp3 = null;
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
statement = connection.createStatement(); 
String query = "SELECT * From booking,customer where booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ;
ResultSet resultset = statement.executeQuery(query); %>
        <%
        while(resultset.next()){ 
        	Integer customerId =  resultset.getInt(4) ;
      	temp3 =  resultset.getString(5) ;
        String temp4 =  resultset.getString(6);
        vehicleType = resultset.getString(7);
        String fare = resultset.getString(8);
        location = resultset.getString(9);
        String driverName = resultset.getString(10);
        String carNumber = resultset.getString(11);
        String otp = resultset.getString(12);
        String driverImage = resultset.getString(13);
        String bookingid = resultset.getString(15);%>
    <div class="card maincard">
  <div class="card-body">
   <div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Driver's Details (Booking Id: #<%=bookingid %>)</h5>
        <br>
         <p><img id="driverImage" src="<%= driverImage%> " width="100" height="100" class="d-block " style="margin: auto;" ></p>
        <div id="driverName" style="font-weight: bold;">
        Driver Name : <%= driverName %>
        </div> 
        <br>
        <div id="otp" style="font-weight: bold;">OTP: <%= otp %></div> <br>
        <div id="vehicleType" style="font-weight: bold;">VehicleType: <%= vehicleType %></div><br>
        <div id="fare" style="font-weight: bold;">Fare: <%= fare %>/-</div> <br>
        <div id="carNumber" style="font-weight: bold;">Car Number: <%= carNumber %></div>
        <br>
         <button id="btnSubmit" onclick="return calcRoute();" type="button" class="btn btn-primary btn-lg btn-block mybtn" style="vertical-align:middle">Track Ride</button>
       	<button id="btnCurrent" onclick="currentRide()" type="button" class="btn btn-primary btn-lg btn-block mybtn" style="vertical-align:middle">Track Your Ride</button>
        <a href="/delete/<%= customerId %>" type="button" class="btn btn-danger btn-lg btn-block mybtn">Cancel Ride</a>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
    <div id="map" class="z-depth-1-half map-container" style="height: 500px"></div>
      </div>
    </div>
  </div>
</div>

 <div class="card" style="margin-top: 20px; font-style: italic;">
      <div class="card-body">
        <p style="font-size: 24px;"><img src="assests/lg3.png" width="90" height="90" class="d-inline-block "><u class="float-right" >Welcome .. <p>${sessionScope.Customerusername }</p></u></p><br>
        <p>We Hope You will get your ride Fast.</p>
        <p>We Welcome all of your Feedbacks which help us to become better..</p>
        <p>Thank You</p>
      </div>
  </div>
</div>
</div>
 <% } %>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
  	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD1R5QWrqEMfU9qPpah3ufkQmeSWBEVtRo&sensor=true&libraries=geometry"></script>
 	<script type ="text/javascript" src="js/script.js"></script> 
	 <script>
	 $(document).ready(function() {
		 $('#btnCurrent').prop('disabled', true);
	 });
	$('#btnSubmit').click(function(){
		   $(this).prop('disabled', true);
		   $('#btnCurrent').prop('disabled', false);	
		});  
 var cityName = "";
	var value = "<%= location %>";
	var vehicleType = "<%= vehicleType%>";
	var pickupDest = "<%=temp3 %>";
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
	else if(miniAns==0) {
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
		}; 	}
	else if(suvAns==0) {
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

 function currentRide() {
	 window.location.href = '/currentRide'; 
	 }
    </script>
    
 
  
  </body>
</html>
