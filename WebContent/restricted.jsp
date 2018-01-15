<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>IT Resume Builder</title> -->
<%@ include file="title.jsp"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="session.jsp"%>
	<%@ include file="top.jsp"%>
	<div class="row">
		<%@ include file="side.jsp"%>
		<div style="padding: 20px 30px 20px 10px;" class="col-md-10">
			<span style="font-weight: bold; font-size: 16px;">Hello <c:out value="${sessionScope.id[1]}" /> <c:out value="${sessionScope.id[2]}" />.</span><br /><br />
			<div style="width: 900px; padding-top:20px;">
				<div style="float: left; padding-left: 20px;">
					<span style="font-weight: bold; color: #337AB7;">System Information</span>
					<div style="width: 190px; height: 3px; background-color: #337AB7;"></div>
					<div style="padding-top:20px;"></div>
					<ul class="list-group" style="border:none !important;">
						<li class="list-group-item"><span style="font-weight: bold;">Login:</span>
							<c:out value="${sessionScope.id[6]}" /></li>
						<li class="list-group-item"><span style="font-weight: bold;">Last
								access:</span> <c:out value="${sessionScope.id[7]}" /></li>
						<li class="list-group-item"><span style="font-weight: bold;">Resumes created:</span> <c:out value="${my_res}" />.</li>
						<li class="list-group-item"><span style="font-weight: bold;">Resumes in the system:</span> <c:out value="${pb_res}" />.</li>
					</ul>
				</div>
				<div style="float: left;">
					<img src="img/home.png" align="center" width="600px" height="400px" style="border-radius: 15px;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>