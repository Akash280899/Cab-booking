$(document).ready(function(){
 $("#btnSubmit").click(function(){
		alert("Registered Successfully. Try to login!!");
});
}); 
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

