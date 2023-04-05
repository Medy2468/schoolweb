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
		<title>Inscription</title>
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
				<div class="panel-heading">Formulaire d'ajout des inscriptions</div><br><br>
				<div class="panel-body">
					<form method="post" action="inscription">
						<div class="form-group">
							<label class="control-label">Details</label>
							<input class="form-control" type="text" name="details" id="details"/>
						</div>
						<div>
							<input class="btn btn-success" type="submit" name="valider" id="Envoyer"/>
							<input class="btn btn-warning" type="reset" name="annuler" id="Annuler"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>