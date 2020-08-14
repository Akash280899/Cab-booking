<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <title>V CABS</title>
	 <link rel="icon" href="/assests/lg3.png" type="image/png" sizes="16x16">

      <!--font awesome -->
   
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">

     <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    


    <style type="text/css">
    	
     body{
     	background-image: url("assests/reviewbg.jpeg");
     	background-size: cover;
     	opacity: 0.9;
     }
	:disabled:hover {
  	cursor: not-allowed;
	}

     @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }


/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: right;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 


    


    </style>

    </head>
  <body >
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="/landing">
    <img src="/assests/lg3.png" width="30" height="30" class="d-inline-block align-top" ><strong> V CABS</strong></a>
</nav>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

      <li class="nav-item ">
        <a class="nav-link" href="/"><i class="fas fa-home"></i><strong> HOME </strong></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="/profile"><i class="fas fa-user"></i><strong> PROFILE</strong></a>
      </li>

       <li class="nav-item">
        <a class="nav-link" href="/book"><i class="fas fa-car"></i><strong> BOOK CAB</strong></a>
      </li>

       <li class="nav-item ">
        <a class="nav-link" href="/aboutUs"><i class="fas fa-globe"></i><strong> ABOUT</strong></a>
      </li>

       <li class="nav-item ">
        <a class="nav-link active" href="/review"><i class="fas fa-comments"></i></i><strong> REVIEW </strong><span class="sr-only">(current)</span></a>
      </li>
      
    </ul>

   
    
  </div>
</nav>

<div class="alert alert-success" role="alert" id="alert" style="margin-top: 30px; display: none;">
  <p><b>Thank You for Your Feedback..!!</b><br>Happy Riding</p> 
</div>
<div class="alert alert-danger" role="alert" id="alert1" style="margin-top: 30px; display: none;">
  <p><b>Please Enter the Feedback first</b></p> 
</div>


<div class="row">
  
  <div class="col-sm-8">
    <div class="card" style="margin-top: 80px; margin-left: 40px;">
      <div class="card-body">
        <h4 class="card-title">We are Happy to have you</h4>
        <p class="card-text">With your constant suppost and feedbacks we grow each time and become better for you<br>Its you and ypur best wishes which drives us way closer to our journey and we hope your every journey with us become exciting and relaxing as ours with you.</p>
        <h5 class="card-title">Help us with your Feed back</h5>
        <hr>
         <fieldset class="rating" style="opacity: 1;">
       <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
       <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
       <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
       <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
       <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
       <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
       <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
       <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
       <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
       <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
     </fieldset>

  <form>
     <div class="form-group">
    <label ><b>FeedBack:</b></label>
   <input type="text" class="form-control" id="text" rows="3" style="height: 100px;" autocomplete="off" />
  </div>
</form>
	<c:set var="log" scope="session" value="${sessionScope.logged1 }"/>  
   <c:choose>
  <c:when test="${log == 'yes'}">
    	 <a href="#" id="submit" class="btn btn-primary">Submit</a>
  </c:when>

  <c:otherwise>
    <a href="#" id="submit" class="btn btn-primary disabled" >Submit</a>
  </c:otherwise>
</c:choose>
        
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    
  </div>
</div>


  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script type="text/javascript">

    	var click = false;
    	var check = false ;
    	
    	$("#submit").click(function(){
    		var input = $("#text").val() ;
        	if(input!=""){
                check=true;
        	}

          if(click==false && check == true){
          	$("#submit").html("Submitted") ;
          	$("#submit").css("background-color" , "green");
          	click=true ;
        	var delay = 3000; 
           var url = '/index'
           setTimeout(function(){ window.location = url; }, delay);
          }

          if(click==true && check == true){
             $("#alert").css("display", "block");
          }

          if(check==false){
          	$("#alert1").css("display", "block");
          }

    	});


    </script>

   

  </body>
</html>