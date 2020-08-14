<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html xmlns='http://www.w3.org/1999/xhtml' xmlns:th='http://www.thymeleaf.org'> -->
	<html>
    <head>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">

     <link rel="icon" type="image/gif" href="/assests/lg3.png" sizes="16x16" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">
        <title>Result</title>
       <style>
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
         left: -20px;
         transition: 0.5s;
      }
     
           .mybtn:hover span {
           padding-left: 25px;
       		}
     
        .mybtn:hover span:after {
	       opacity: 1;
	       left: 0;
     	}
       
       </style>
    </head>
    <body>
    	
        <%-- <h3 th:if='${error}' th:text='${error}' style='color: red;'></h3> --%>
        <c:choose>
		    <c:when test="${error}">
		       <h3>Error</h3> 
		        <br />
		    </c:when>    
		    <c:otherwise>
		        <h3 style='color: green;'>Success!</h3>
	            <button type="button" onclick="location.href='/'" class="btn btn-primary myBtn">Back to Home</button>
		        <br />
		    </c:otherwise>
		</c:choose>
    </body>
</html>