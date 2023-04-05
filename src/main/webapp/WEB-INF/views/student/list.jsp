<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta charset="ISO-8859-1" http-equiv="Content-Type">
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<title>Student</title>
	</head>
	<body>
		<div class="container spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Liste des élèves</div><br><br>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>ID</th>
							<th>Prénom</th>
							<th>Nom</th>
							<th>Date de Naissance</th>
							<th>Téléphone</th>
						</tr>
						<c:forEach items="${student}" var="student">
							<tr>
								<td>${student.id}</td>
								<td>${student.firstName}</td>
								<td>${student.lastName}</td>
								<td>${student.birthdate}</td>
								<td>${student.phone}</td>
							</tr>
						</c:forEach>
					</table>
					<a href="student?page=add" class="btn btn-primary">Ajout d'élèves</a>
				</div>
			</div>
		</div>
	</body>
</html>