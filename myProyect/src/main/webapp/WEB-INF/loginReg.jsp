<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="es">
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
	<title>Login y registro</title>
</head>
<body>

	<div class="container-fluid">
	<div class="row">
		<div class="divgrande col-lg-3">
			<div class="center">
  				<img id="logochico" src="/imagenes/logochico.png" class="" alt="...">
  				<form class="px-4" method="POST" action="/login">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					 <div class="form-group">
    					<label for="email" class="text-white">Email</label>
    					<input type="email" id="email" class="form-control" name="username" placeholder="Email" required>
  					</div>
  					
					<div class="form-group">
						<label for="password" class="text-white">Password</label>
						<input type="password" id="password" class="form-control" name="password" placeholder="Password" required>
					</div>
			
					<button type="submit" class="btn btn-danger">Ingresar</button>
					<c:if test = "${errorLog != null}">
    					<p class="text-danger">${errorLog}</p>				
					</c:if>
				</form>
				<button type="button" class=" ml-3 mt-4 btn btn-link" data-toggle="modal" data-target="#exampleModal">Registrarse</button>
			</div>
			
		</div>
		<div class="divgrande col-lg-9 px-0"><img id="imglogin" src="/imagenes/login-1200-2000.jpeg" class="" alt="..."></div>
	</div>
	</div>
	
	
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Crear Cuenta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form:form action="/registration" method="POST" modelAttribute="user" class="border border-dark p-4 bg-white">
					
					<div class="form-group row">
						<form:label for="nombre" class="col-lg-4 col-form-label" path="nombre">Nombre</form:label>
						<div class="col-lg">
							<form:errors path="nombre"/>
       						<form:input type="text" id="nombre" class="form-control" path="nombre" required="true"/>
						</div>
					</div>
					
					<div class="form-group row">
						<form:label for="apellido" class="col-lg-4 col-form-label" path="apellido">Apellido</form:label>
						<div class="col-lg">
							<form:errors path="apellido"/>
       						<form:input type="text" id="apellido" class="form-control" path="apellido" required="true"/>
						</div>
					</div>
					
					<div class="form-group row">
						<form:label for="direccion" class="col-lg-4 col-form-label" path="direccion">Direccion</form:label>
						<div class="col-lg">
							<form:errors path="direccion"/>
       						<form:input type="text" id="direccion" class="form-control" path="direccion" required="true"/>
						</div>
					</div>

					<div class="form-group row">
						<form:label for="email" class="col-lg-4 col-form-label" path="email">Email</form:label>
						<div class="col-lg">
							<form:errors path="email"/>
       						<form:input type="email" id="email" class="form-control" path="email" required="true"/>
						</div>
					</div>

					
					<div class="form-group row">
						<form:label for="password" class="col-lg-4 col-form-label" path="password">Password</form:label>
						<div class="col-lg">
							<form:errors path="password"/>
       						<form:input type="password" id="password" class="form-control" path="password" required="true"/>
						</div>
					</div>
					<div class="form-group row">
						<form:label for="passwordConfirmation" class="col-lg-4 col-form-label" path="passwordConfirmation">password Conf.</form:label>
						<div class="col-lg">
							<form:errors path="passwordConfirmation"/>
       						<form:input type="password" id="passwordConfirmation" class="form-control" path="passwordConfirmation"/>
						</div>
					</div>

					<button type="submit" class="offset-lg-9 col-lg-3 btn btn-block btn-danger">Registrarse</button>
					<c:if test = "${errorReg != null}">
    					<p class="text-danger">${errorReg}</p>				
					</c:if>
				</form:form>
        
        
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-danger">Registrarse</button> -->
      </div>
    </div>
  </div>
</div>		
		
	
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<script src="/js/myscript.js"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	-->
</body>
</html>
