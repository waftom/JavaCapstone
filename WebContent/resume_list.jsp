<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IT Resume Builder</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/datatables.min.css" />
<script type="text/javascript" src="js/datatables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#mylist').DataTable();
		$('#sharedlist').DataTable();
	});
</script>
</head>
<body>
	<%@ include file="session.jsp"%>
	<%@ include file="top.jsp"%>
	<div class="row">
		<%@ include file="side.jsp"%>
		<div style="padding: 20px 30px 20px 10px;" class="col-md-10">
			<div style="font-size: 25px; font-weight: bold; color: #337AB7;">Create
				/ Edit Resume</div>
			<div style="width: 300px; height: 3px; background-color: #337AB7;"></div>
			<div style="padding: 20px 0px 20px 0px;">
				<form action="resume" method="get">
					<button type="submit" class="btn btn-success btn-sm"
						style="font-weight: bold;">Create a New Resume</button>
				</form>
			</div>
			<table id="mylist" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th width="60%">Title</th>
						<th width="10%">Public?</th>
						<th width="15%">Creation Date</th>
						<th width="15%">Last Modified</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="entry">
						<tr>
							<td><a href="resume?id=<c:out value="${entry.id}" />"><c:out
										value="${entry.title}" /></a></td>
							<td align="center"><c:out value="${entry.publ}" /></td>
							<td align="center"><span style="display: none;"><c:out
										value="${entry.cdatec}" /></span>
							<c:out value="${entry.datec}" /></td>
							<td align="center"><span style="display: none;"><c:out
										value="${entry.cdatem}" /></span>
							<c:out value="${entry.datem}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				$('#mylist').removeClass('display').addClass(
						'table table-striped table-bordered');
			</script>
			
			<div style="padding:50px 0px 20px 0px;">
				<div style="font-size: 16px; font-weight: bold; color: #337AB7;">Public Resumes</div>
				<div style="width: 150px; height: 2px; background-color: #337AB7;"></div>
			</div>
			
			<table id="sharedlist" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th width="35%">Name</th>
						<th width="35%">Title</th>
						<th width="15%">Creation Date</th>
						<th width="15%">Last Modified</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${publik}" var="entry">
						<tr>
							<td><a target="_blank" href="viewprint?id=<c:out value="${entry.id}" />"><c:out
										value="${entry.name}" /></a></td>
							<td><c:out value="${entry.title}" /></td>
							<td align="center"><span style="display: none;"><c:out
										value="${entry.cdatec}" /></span>
							<c:out value="${entry.datec}" /></td>
							<td align="center"><span style="display: none;"><c:out
										value="${entry.cdatem}" /></span>
							<c:out value="${entry.datem}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				$('#sharedlist').removeClass('display').addClass(
						'table table-striped table-bordered');
			</script>
		</div>
	</div>
</body>
</html>