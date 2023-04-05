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
		<title>Year</title>
	</head>
	<body>
		<div class="container spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Liste des années</div><br><br>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>ID</th>
							<th>Nom</th>
						</tr>
						<c:forEach items="${year}" var="year">
							<tr>
								<td>${year.id}</td>
								<td>${year.name}</td>
							</tr>
						</c:forEach>
					</table>
					<a href="year?page=add" class="btn btn-primary">Ajout d'années</a>
				</div>
			</div>
		</div>
	</body>
</html>