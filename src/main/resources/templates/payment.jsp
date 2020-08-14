
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action='/charge' method='POST' id='checkout-form'>
    <input type='hidden' th:value=500 name='amount' />
    <label>Price:<span th:text=5 /></label>
    <!-- NOTE: data-key/data-amount/data-currency will be rendered by Thymeleaf -->
    <script
       src='https://checkout.stripe.com/checkout.js' 
       class='stripe-button'
       th:attr='data-key=pk_test_51HEs0aBr4eQCMem1OtCfBv06zz5tHAfSbexizDh1TuPeX3OyknslpUkzb7mj70eJ0c89PkwePHMp8L6Hxkn2bfeb00prscGb4M, 
         data-amount=5, 
         data-currency=INR'
       data-name='Baeldung'
       data-description='Spring course checkout'
       data-image
         ='https://www.baeldung.com/wp-content/themes/baeldung/favicon/android-chrome-192x192.png'
       data-locale='auto'
       data-zip-code='false'>
   </script>
</form>
</body>
</html>