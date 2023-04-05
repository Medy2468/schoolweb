<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta charset="UTF-8" http-equiv="Content-Type">
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<title>Courses</title>
	</head>
	<body>
		<div class="container spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Liste des cours</div><br><br>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>ID</th>
							<th>Nom</th>
							<th>Programme</th>
						</tr>
						<c:forEach items="${courses}" var="courses">
							<tr>
								<td>${courses.id}</td>
								<td>${courses.name}</td>
								<td>${courses.program}</td>
							</tr>
						</c:forEach>
					</table>
					<a href="courses?page=add" class="btn btn-primary">Ajout des cours</a>
				</div>
			</div>
	  </div>
	</body>
</html>