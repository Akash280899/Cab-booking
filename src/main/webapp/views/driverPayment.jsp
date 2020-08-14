<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title data-tid="elements_examples.meta.title">V Cabs Driver</title>
  <meta data-tid="elements_examples.meta.description" name="description" content="Build beautiful, smart checkout flows.">

  <link rel="shortcut icon" href="img/favicon.ico">
  <link rel="icon" href="assests/lg3.png" type="image/gif" sizes="16x16">
  <link rel="icon" href="img/apple-touch-icon/180x180.png">

  <script src="https://js.stripe.com/v3/"></script>
  <script src="js/index.js" data-rel-js></script>

  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="css/base.css" data-rel-css="" />

  <!-- CSS for each example: -->
  <link rel="stylesheet" type="text/css" href="css/example1.css" data-rel-css="" />
  <style>
  body {
  /* overflow-x: hidden;
  background-color: #f6f9fc; */
  background:url("assests/cabbg.jpg") fixed;
  background-size: cover;
	text-align:center;
}
.mybtn1 span {
       cursor: pointer;
       display: inline-block;
       position: relative;
       transition: 0.5s;
     }
     
        .mybtn1 span:after {
         content: '\00bb';
        position: absolute;
         opacity: 0;
        top: 0;
         right: -20px;
         transition: 0.5s;
      }
     
           .mybtn1:hover span {
           padding-right: 25px;
       		}
     
        .mybtn1:hover span:after {
	       opacity: 1;
	       right: 0;
     	}
  </style>
 </head>
 <body>
 <div class="globalContent">
    <main>

    <section class="container-lg">
    
    	<div class="cell example example1" id="example-1">
    	
          <div class="icon">
            <svg width="84px" height="84px" viewBox="0 0 84 84" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <circle class="border" cx="42" cy="42" r="40" stroke-linecap="round" stroke-width="4" stroke="#000" fill="none"></circle>
              <path class="checkmark" stroke-linecap="round" stroke-linejoin="round" d="M23.375 42.5488281 36.8840688 56.0578969 64.891932 28.0500338" stroke-width="4" stroke="#000" fill="none"></path>
            </svg>
          </div>
          <h3 class="title" data-tid="elements_examples.success.title">Payment successful</h3>
          <p class="message"><span data-tid="elements_examples.success.message">Completed the ride Successfully!!</p>
           <a href="/driver"><button type="button" class="btn btn-success mybtn1" style="vertical-align:middle"><span>Back to Home</span></button></a> 
           
      </div>
    	
    </section>
    </main>
    </div>
     
     <script src="js/l10n.js" data-rel-js></script>
  	<script src="js/example1.js" data-rel-js></script>
 </body>
 </html>