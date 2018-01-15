<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>IT Resume Builder</title> -->
<%@ include file="title.jsp" %>
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#phone").mask("(999) 999-9999");
});

function val(){
	var login = document.getElementById('login');
	var pwd = document.getElementById('pwd');
	
	if((login.value != '') && (pwd.value != '')){
		return true;
	} else {
		alert('Invalid data! Please try again.');
		return false;
	}
	return false;
}

function val_reg(){
	var fname = document.getElementById("fname");
	var lname = document.getElementById("lname");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");
	var address = document.getElementById("address");
	var loginr = document.getElementById("loginr");
	var pwdr = document.getElementById("pwdr");
	var pwdr1 = document.getElementById("pwdr1");
	
	if((fname.value != '') && (lname.value != '') && (email.value != '') && (phone.value != '') && (address.value != '') && (loginr.value != '') && (pwdr.value != '') && (pwdr1.value != '')){
		if(pwdr.value == pwdr1.value){
			return true;
		} else {
			alert('Password does not match the "Repeat password" field!');
			return false;
		}
	} else {
		alert('Fill all blank fields.');
		return false;
	}
	return false;
}

function back(){
	var dlogin = document.getElementById("login");
	var dregister = document.getElementById("register");
	
	if(dlogin.style.display == "none"){
		dlogin.style.display = "";
		dregister.style.display = "none";
	} else {
		dlogin.style.display = "none";
		dregister.style.display = "";
	}
}

function load() {
	/*document.getElementById("login").focus();*/
	$('#login').focus();
}
</script>
</head>
<body onload="load()">
	<div id="login" style="display:block; width:270px; margin:0 auto; margin-top:20px; padding:10px 20px 20px 20px; border-radius:15px; border:1px solid #CCC;" class="container-fluid">
		<!-- <h3 align="center"><strong>IT Resume Builder</strong></h3> -->
		<div align="center" style="padding:10px 10px 10px 10px;"><img alt="" src="img/logo.jpg" width="141px" height="80px"></div>
		<c:if test="${msg != null}">
			<div align="center" style="color: red; font-weight: bold;">${msg}</div>
		</c:if>
		<c:if test="${msgr != null}">
			<div align="center" style="color: green; font-weight: bold;">${msgr}</div>
		</c:if>
		<form role="form" action="home" method="post" id="form" onSubmit="return val();">
			<div class="form-group">
				<label for="Login">Login:</label> <input type="text" class="form-control" id="login" placeholder="User" name="login">
			</div>
			<div class="form-group">
				<label for="Password">Password:</label> <input type="password" class="form-control" id="pwd" placeholder="******" name="pwd">
			</div>
			<span style="float: left;"><input type="submit" class="btn btn-sm btn-primary" value="Sign in"></span><span style="float: right;"><input type="button" class="btn btn-sm btn-success" value="Register" onclick="back()"></span>
		</form>
	</div>
	<div id="register" style="display:none; width:550px; margin:0 auto; margin-top:20px; padding:10px 20px 20px 20px; border-radius:15px; border:1px solid #CCC;" class="container-fluid">
		<h3 align="center"><strong>Registration</strong></h3>
		<form role="form1" action="register" method="post" id="form" onSubmit="return val_reg();">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td><div class="form-group" style="width: 95%;">
						<label for="First name">First name:</label> <input type="text" class="form-control" id="fname" placeholder="" name="fname">
					</div></td>
			    <td><div class="form-group">
						<label for="Last name">Last name:</label> <input type="text" class="form-control" id="lname" placeholder="" name="lname">
					</div></td>
			  </tr>
			  <tr>
			    <td><div class="form-group" style="width: 95%;">
						<label for="Email">Email:</label> <input type="text" class="form-control" id="email" placeholder="" name="email">
					</div></td>
			    <td><div class="form-group">
						<label for="Phone">Phone:</label> <input type="text" class="form-control" id="phone" placeholder="(000) 000-0000" name="phone">
					</div></td>
			  </tr>
			  <tr>
			    <td colspan="2"><div class="form-group">
						<label for="Address">Address:</label> <input type="text" class="form-control" id="address" placeholder="" name="address">
					</div></td>
			  </tr>
			  <tr>
			    <td colspan="2"><hr></td>
			  </tr>
			  <tr>
			    <td><div class="form-group" style="width: 95%;">
						<label for="Login">Login:</label> <input type="text" class="form-control" id="loginr" placeholder="" name="loginr">
					</div></td>
			    <td>&nbsp;</td>
			  </tr>
			  <tr>
			    <td><div class="form-group" style="width: 95%;">
						<label for="Password">Password:</label> <input type="password" class="form-control" id="pwdr" placeholder="******" name="pwdr">
					</div></td>
			    <td><div class="form-group">
						<label for="Password">Repeat Password:</label> <input type="password" class="form-control" id="pwdr1" placeholder="******" name="pwdr1">
					</div></td>
			  </tr>
			</table>
			<span style="float: left;"><input type="submit" class="btn btn-sm btn-primary" value="Register"></span><span style="float: right;"><input type="button" class="btn btn-sm btn-warning" value="Back" onclick="back()"></span>
		</form>
	</div>
</body>
</html>