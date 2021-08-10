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
	<title>Home</title>
</head>
<body>

	<div class="container my-4">
	
		<div class="row my-4">
  			<div class="col-lg-10"><h1 class="mx-2 mb-0 pb-2">Welcome ${user.nombre}</h1></div>
  			<div class="col-lg-2">
  				<form id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-link mt-3">Logout</button>
    			</form>
  			</div>
  		</div>
				<div class="row">
					<div class="col-lg-6">
						<form:form action="/addproducto" method="POST" modelAttribute="producto" class="border border-dark p-4 bg-white">
				<h2>Inserte producto</h2>

					<div class="form-group row">
						<form:label for="nombre" class="col-lg-4 col-form-label" path="nombre">Nombre: </form:label>
						<div class="col-lg">
							<form:errors path="nombre"/>
       						<form:input type="text" id="nombre" class="form-control" path="nombre" required="true"/>
						</div>
					</div>
					
						<div class="form-group row">
						<form:label for="precio" class="col-lg-4 col-form-label" path="precio">Precio: </form:label>
						<div class="col-lg">
							<form:errors path="precio"/>
       						<form:input type="number" id="precio" class="form-control" path="precio" required="true"/>
						</div>
					</div>
					
					<div class="form-group row">
						<form:label for="stock" class="col-lg-4 col-form-label" path="stock">Stock: </form:label>
						<div class="col-lg">
							<form:errors path="stock"/>
       						<form:input type="number" id="stock" class="form-control" path="stock" required="true"/>
						</div>
					</div>
					
					<div class="form-group row">
						<form:label for="urlImagen" class="col-lg-4 col-form-label" path="urlImagen">Url imagen: </form:label>
						<div class="col-lg">
							<form:errors path="urlImagen"/>
       						<form:input type="text" id="urlImagen" class="form-control" path="urlImagen" required="true"/>
						</div>
					</div>
					
						<div class="form-group row">
						<form:label for="descripcion" class="col-lg-4 col-form-label" path="descripcion">Descripción: </form:label>
						<div class="col-lg">
							<form:errors path="descripcion"/>
       						<form:input type="textarea" id="descripcion" class="form-control" path="descripcion" required="true"/>
						</div>
					</div>


					<button type="submit" class="offset-lg-9 col-lg-3 btn btn-block btn-outline-dark">Añadir</button>
					<c:if test = "${errorReg != null}">
    					<p class="text-danger">${errorReg}</p>				
					</c:if>
						</form:form>
					</div>
					
					<div class="col-lg-6">
						<form:form action="/crear/categoria" method="POST" modelAttribute="categoria" class="border border-dark p-4 bg-white">
				<h2>Inserte Categoria</h2>

					<div class="form-group row">
						<form:label for="nombre" class="col-lg-4 col-form-label" path="nombre">Nombre: </form:label>
						<div class="col-lg">
							<form:errors path="nombre"/>
       						<form:input type="text" id="nombre" class="form-control" path="nombre" required="true"/>
						</div>
					</div>

					<button type="submit" class="offset-lg-9 col-lg-3 btn btn-block btn-outline-dark">Añadir</button>
					<c:if test = "${errorReg != null}">
    					<p class="text-danger">${errorReg}</p>				
					</c:if>
						</form:form>
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
