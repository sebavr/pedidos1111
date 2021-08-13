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
    <link rel="stylesheet" href="/css/style2.css">
	<title>Welcome</title>
</head>
<body>
	<div id="encabezado" class="container-fluid">
		 <img class="rounded mx-auto d-block" src="/imagenes/logo1.png" alt="Italian Trulli">
		 
				
		 <ul class="nav justify-content-center mt-0">
  			<li class="nav-item">
				<h4><a class="nav-link disabled" href="" disable>Inicio</a></h4>
			</li>
			<li class="nav-item">
				<h4><a class="nav-link" href="/pedir">Menú</a></h4>
  			</li>
  			<li class="nav-item">
  				 <h4><a class="nav-link disabled" href="">Promociones</a></h4>
  			</li>
  			<li class="nav-item">
  				<h4><a class="nav-link disabled" href="">Almuerzos</a></h4>
  			</li>
		</ul>
	</div>

	<div class="container px-0 my-4 mybg">
		<div class="row">
			<div class="col-lg-6 px-0">
				<img class="imagenProducto" src="${producto.urlImagen}" alt="Italian Trulli">
			</div>
			<div class="col-lg-6 p-3">
				<h3>${producto.nombre}</h3>
				<p>${producto.descripcion}</p>
				

				<form  class="align-bottom mr-3" method="POST" action="/user/agregar/carro/${producto.id}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<div class="form-group">
   						<label for="instrucciones" class="font-weight-bold">Instrucciones especiales</label>
    					<textarea class="form-control" id="instrucciones" rows="3" name="instrucciones"></textarea>
 					</div>
 					<p class="font-weight-bold">Stock: ${producto.stock}</p>
 					<div class="form-group row">
						<div class="col-lg-3">
							<input type="number" onchange="calcular()" id="cantidad" min="1" class="form-control" name="cantidad" value="1">
						</div>
						<button type="submit" class="col-lg-6 btn btn-block btn-danger">Agregar</button>
						<div class="col-lg-3">
							<p id="subtotal" class="font-weight-bold mb-0 mt-2" precio="${producto.precio}">0</p>
						</div>
					</div>
			
				</form>
		
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
