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
		<title>Student</title>
	</head>
	<body>
		<c:if test="${message != null}">
		<c:if test="${message == 1}">
			<div class="alert alert-success">Données ajoutées avec succès</div>
		</c:if>
		<c:if test="${message == 0}">
			<div class="alert alert-danger">Erreur données non ajoutées</div>
		</c:if>
	</c:if>
		<div class="container col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3 spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Formulaire d'ajout des etudiants</div><br><br>
				<div class="panel-body">
					<form method="post" action="student">
							<div class="form-group">
								<label class="control-label">Prénom</label>
								<input class="form-control" type="text" name="firstname" id="firstName"/>
							</div>
							<div class="form-group">
								<label class="control-label">Nom</label>
								<input class="form-control" type="text" name="lastname" id="lastName"/>
							</div>
							<div class="form-group">
								<label class="control-label">Date de naissance</label>
								<input class="form-control" type="text" name="birthdate" id="birthdate"/>
							</div>
							<div class="form-group">
								<label class="control-label">Téléphone</label>
								<input class="form-control" type="text" name="phone" id="phone"/>
							</div>
							<div>
								<input class="btn btn-success" type="submit" name="valider" id="Envoyer"/>
								<input class="btn btn-warning" type="reset" name="annuler" id="Annuler"/>
							</div>
					</form>
				</div>
			</div>
		</div>
		<div class="container spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Liste des etudiants</div><br><br>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>ID</th>
							<th>Prénom</th>
							<th>Nom</th>
							<th>Date de Naissance</th>
							<th>Téléphone</th>
						</tr>
						<c:forEach items="${students}" var="student">
							<tr>
								<td>${student.id}</td>
								<td>${student.firstname}</td>
								<td>${student.lastname}</td>
								<td>${student.birthdate}</td>
								<td>${student.phone}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>