<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IT Resume Builder</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="js/jquery.qtip.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qtip.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#ed_text').each(function() {
			$(this).qtip({
				content : {
					text : $(this).next('div')
				}
			});
		});
	});
	
	function val_updt(){
		var fname = document.getElementById("fname");
		var lname = document.getElementById("lname");
		var email = document.getElementById("email");
		var phone = document.getElementById("phone");
		var address = document.getElementById("address");
		var loginr = document.getElementById("loginr");
		var oldpwd = document.getElementById("oldpwd");
		var newpwd = document.getElementById("newpwd");
		var newpwd1 = document.getElementById("newpwd1");
		
		if ((fname.value != '') && (lname.value != '') && (email.value != '') && (phone.value != '') && (address.value != '')) {
			if (oldpwd.value != '') {
				if (newpwd.value != '' && newpwd1.value != '') {
					if (newpwd.value == newpwd1.value) {
						alert('The system needs you to Login again to update your information!');
						return true;
					} else {
						alert('New Password does not match the "Repeat New Password" field!');
						return false;
					}
				} else {
					if (newpwd.value == '' && newpwd1.value == '') {
						alert('The system needs you to Login again to update your information!');
						return true;
					} else {
						alert('Leave blank the fields "New Password" and "Repeat New Password"\nif you don\'t want to change the password!');
						return false;
					}
				}
			} else {
				alert('The password is necessary to change any information!');
				return false;
			}
		} else {
			alert('All fields (except password fields) must be filled.');
			return false;
		}
		return false;
	}
</script>
</head>
<body>
	<%@ include file="session.jsp"%>
	<%@ include file="top.jsp"%>
	<div class="row">
		<%@ include file="side.jsp"%>
		<div style="padding: 20px 30px 20px 10px;" class="col-md-10">
			<div style="font-size: 25px; font-weight: bold; color: #337AB7;">Update
				Profile</div>
			<div style="width: 220px; height: 3px; background-color: #337AB7;"></div>
			<div style="max-width: 780px;">
				<span id="ed_text" style="border: 1px solid #666; background-color: #fed08b; border-radius: 10px; text-align: center; font-weight: bold; cursor: help; float:right;">&nbsp;?&nbsp;</span>
			
					<div class="qtip-bootstrap" style="display: none;">
						<div class="qtip-titlebar">Help</div>
						<div class="qtip-content">
							<p>
								<ul>
									<li><span style="font-style: italic;">You can change any information on<br />the form <span style="font-weight: bold;">(except the Login)</span>;</span></li>
									<li><span style="font-style: italic;">All fields must be filled <span style="font-weight: bold;">(except New<br />Password and Repeat New Password)</span>;</span></li>
									<li><span style="font-style: italic;">You must insert your Password;</span></li>
									<li><span style="font-style: italic;">If you don't want to change the<br />password, leave the fields New Password<br />and Repeat New Password blank;</span></li>
									<li><span style="font-style: italic; font-weight: bold;">* After change any information,<br />you will be logged out for your<br />information to be updated.</span></li>
								</ul>
							</p>
						</div>
					</div>
			</div>
			<div style="padding-top:20px;"></div>
			<form role="form1" action="updateprofilesave" method="post" id="form"
				onSubmit="return val_updt();">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="max-width: 780px;">
					<tr>
						<td><div class="form-group" style="width: 95%;">
								<label for="First name">First name:</label> <input type="text"
									class="form-control" id="fname" placeholder="" name="fname" value="<c:out value="${sessionScope.id[1]}" />">
							</div></td>
						<td><div class="form-group">
								<label for="Last name">Last name:</label> <input type="text"
									class="form-control" id="lname" placeholder="" name="lname" value="<c:out value="${sessionScope.id[2]}" />">
							</div></td>
					</tr>
					<tr>
						<td><div class="form-group" style="width: 95%;">
								<label for="Email">Email:</label> <input type="text"
									class="form-control" id="email" placeholder="" name="email" value="<c:out value="${sessionScope.id[3]}" />">
							</div></td>
						<td><div class="form-group">
								<label for="Phone">Phone:</label> <input type="text"
									class="form-control" id="phone" placeholder="(000) 000-0000"
									name="phone" value="<c:out value="${sessionScope.id[4]}" />">
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><div class="form-group">
								<label for="Address">Address:</label> <input type="text"
									class="form-control" id="address" placeholder="" name="address" value="<c:out value="${sessionScope.id[5]}" />">
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<tr>
						<td><div class="form-group" style="width: 95%;">
								<label for="Login">Login:</label> <input type="text"
									class="form-control" id="login" placeholder="" name="login" value="<c:out value="${sessionScope.id[6]}" />" disabled="disabled">
							</div></td>
						<td><div class="form-group">
								<label for="Password">Password:</label> <input type="password"
									class="form-control" id="oldpwd" placeholder="******" name="oldpwd">
							</div></td>
					</tr>
					<tr>
						<td><div class="form-group" style="width: 95%;">
								<label for="Password">New Password:</label> <input type="password"
									class="form-control" id="newpwd" placeholder="******" name="newpwd">
							</div></td>
						<td><div class="form-group">
								<label for="Password">Repeat New Password:</label> <input
									type="password" class="form-control" id="newpwd1"
									placeholder="******" name="newpwd1">
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><span style="float: left;"><input type="submit"
					class="btn btn-sm btn-primary" value="Update"></span></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>