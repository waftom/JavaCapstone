<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IT Resume Builder</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div style="text-align: center; font-weight: bold; font-size: 30px;">
		<c:out value="${fname}" />
		<c:out value="${lname}" />
	</div>
	<div style="width: 100%; height: 5px; background-color: black;"></div>
	<div style="text-align: center; padding-bottom: 60px;">
		<c:out value="${address}" />
		|
		<c:out value="${email}" />
		|
		<c:out value="${phone}" />
	</div>
	<div style="font-weight: bold; padding-bottom: 20px;">
		Professional Summary
		<div style="width: 100%; height: 3px; background-color: black; background-image: url('img/black_bg.jpg'); background-repeat: repeat;"></div>
	</div>
	<div id="ps_t" style="display: block; padding-bottom: 5px;">${professional_summary}</div>
	<div style="padding-top: 50px;"></div>
	<div style="font-weight: bold; padding-bottom: 20px;">
		Technical Skills
		<div style="width: 100%; height: 3px; background-color: black; background-image: url('img/black_bg.jpg'); background-repeat: repeat;"></div>
	</div>
	<div id="ts_t" style="display: block; padding-bottom: 5px;">${technical_skills}</div>
	<div style="padding-top: 50px;"></div>
	<div style="font-weight: bold; padding-bottom: 20px;">
		Professional Experience
		<div style="width: 100%; height: 3px; background-color: black; background-image: url('img/black_bg.jpg'); background-repeat: repeat;"></div>
	</div>
	<div id="pe_t" style="display: block; padding-bottom: 5px;">${professional_experience}</div>
	<div style="padding-top: 50px;"></div>
	<div style="font-weight: bold; padding-bottom: 20px;">
		Education
		<div style="width: 100%; height: 3px; background-color: black; background-image: url('img/black_bg.jpg'); background-repeat: repeat;"></div>
	</div>
	<div id="ed_t" style="display: block; padding-bottom: 5px;">${education}</div>
</body>
</html>