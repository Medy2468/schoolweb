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
	
		<div class="container col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3 spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Formulaire d'ajout des inscriptions</div><br><br>
				<div class="panel-body">
					<form method="post" action="inscription">
						<div class="form-group">
							<label class="control-label">Details</label>
							<input class="form-control" type="text" name="details" id="details"/>
						</div>
						
						<div class="div">
							<select name="student"> 
								<option value="" selected disabled>--- Selectionner un student ---</option>
									<c:forEach items="${students}" var="students">
										<option value="${students.id}">${students.firstname} ${students.lastname} </option>
									</c:forEach>
							</select>
						</div>
						
						<div class="div">
							<select name="courses"> 
								<option value="" selected disabled>--- Selectionner un course ---</option>
									<c:forEach items="${courses}" var="courses">
										<option value="${courses.id}">${courses.name} ${courses.program}</option>
									</c:forEach>
							</select>
						</div>
						
						<div class="div">
							<select name="years"> 
								<option value="" selected disabled>--- Selectionner un year ---</option>
									<c:forEach items="${years}" var="years">
										<option value="${years.id}">${years.name} </option>
									</c:forEach>
							</select>
						</div>
						<div>
							<input class="btn btn-success" type="submit" name="Ajouer" id="Ajouer"/>
							<input class="btn btn-danger" type="reset" name="Annuler" id="Annuler"/>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="container spacer" align="center">
			<div class="panel panel-info">
				<div class="panel-heading">Liste des inscriptions</div><br><br>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>ID</th>
							<th>DETAILS</th>
							<th>STUDENT</th>
							<th>COURSES</th>
							<th>YEAR</th>
						</tr>
						<c:forEach items="${inscription}" var="inscription">
							<tr>
								<td>${inscription.id}</td>
								<td>${inscription.details}</td>
								<td>${inscription.student}</td>
								<td>${inscription.courses}</td>
								<td>${inscription.year}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		 <script src="public/js/jquery-3.3.1.min.js"></script>
    <script src="public/js/popper.min.js"></script>
    <script src="public/js/bootstrap.min.js"></script>
    <script src="public/js/jquery.sticky.js"></script>
    <script src="public/js/main.js"></script>
	</body>
</html>