<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <a class="navbar-brand" href="/landing">
              <img src="/assests/lg3.png" width="30" height="30" class="d-inline-block align-top" ><strong> V CABS</strong></a>
          </nav>
        </nav>
          <div class="head ">
            <img class= "bounceIn animated" src="/assests/lg3.png"><br>
            <h1 class="bounceIn animated" >V CABS</h1>
            <p class="bounceIn animated">Experience the best Rides in your city.</p> 
            <a href="/"><button type="button" class="btn btn-success btn-lg mybtn" style="vertical-align:middle"><span>As a Customer </span></button></a> 
            <a href="/driver"><button type="button" class="btn btn-success btn-lg mybtn" style="vertical-align:middle"><span>As a Driver </span></button></a> 
            </div>
</body>
</html>
