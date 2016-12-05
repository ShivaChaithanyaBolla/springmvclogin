<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Daily UI - Day 1 Sign In</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

<spring:url value="/resources/assets/css/css_login/animate_login.css" var="CSS" />
<link href="${CSS}" rel="stylesheet" />

<spring:url value="/resources/assets/css/css_login/style_login.css" var="CSS1" />
<link href="${CSS1}" rel="stylesheet" />


<spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" var="js" />
<script src="${js}"> </script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    
    <spring:url value="/resources/assets/img/img1/photo_bg.jpg" var="login_bg" />

<style type="text/css">
body {
	background: url(${login_bg}) no-repeat center center fixed;
	background-size: cover;
	font-size: 16px;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	margin: 0;
	color: #666;
}
</style>
</head>

<body>
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Daily <span>UI</span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
		    <form:form action="loginform.html"  commandName="loginForm">
			<label for="username">Username</label>
			<br/>
			<form:input name="username" class="input-txt" id="username" path="userName" />
			<br/>
			<label for="password">Password</label>
			<br/>
			<form:password name="password" class="input-txt" id="password" path="password" />
			<br/>
			<button type="submit">Sign In</button>
			</form:form>
			<br/>
			<a href="#"><p class="small">Forgot your password?</p></a>
		</div>
	</div>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>