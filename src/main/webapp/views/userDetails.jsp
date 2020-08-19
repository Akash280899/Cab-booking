<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css" integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css" integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
	<title>V CABS</title>
    <link rel="icon" type="image/gif" href="/assests/lg3.png" sizes="16x16" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="../css/adminCss/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="../css/adminCss/css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/adminCss/css/main.css">
    
<style>

	.nav_p{ 
      font-size: 25px;
      color: white;
      margin-top: 5px;
      font-style: italic;
     }

     .nav_p span{
           text-decoration: underline;
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
	 <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Booking Id</th>
									<th class="cell100 column2">Pickup</th>
									<th class="cell100 column3">Destination</th>
									<th class="cell100 column4">Driver Name</th>
									<th class="cell100 column5">Booking Status</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							<%
								String temp1 =  null;
								String temp2 =   null;
								String temp3 = null;
								String temp4 = null;
								String temp5 = null;
								Statement statement = null;
								Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
								statement = connection.createStatement(); 
								String query = "SELECT * FROM customer ORDER BY id DESC LIMIT 25;" ;
								ResultSet resultset = statement.executeQuery(query); %>
								        <% 
								        while(resultset.next()){ 
								        temp1 = resultset.getString(12);
								        temp2 =  resultset.getString(2) ;
								        temp3 =  resultset.getString(3); 
								        temp4 =  resultset.getString(7); 
								        temp5 =  resultset.getString(14); 
								       	%>
								<tr class="row100 body">
									<td class="cell100 column1"><%=temp1 %></td>
									<td class="cell100 column2"><%=temp2 %></td>
									<td class="cell100 column3"><%=temp3 %></td>
									<td class="cell100 column4"><%=temp4 %></td>
									<td class="cell100 column5"><%=temp5 %></td> <% } %>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					</div>
				</div>
			</div> 
	<script src="../css/adminCss/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	<script src="../css/adminCss/js/main.js"></script>
</body>
</html>
