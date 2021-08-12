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
	<title>Checkout</title>
</head>
<body>

	<div class="container my-4">
  		<ul class="nav">
			<li class="nav-item">
    			<a class="nav-link" href="/">Home</a>
  			</li>
			<li class="nav-item">
    			<form class="d-inline-block" id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-link mb-1">Logout</button>
    			</form>	
  			</li>
		</ul>
		
		<h1>Confirma tu pedido ${user.nombre}</h1>
		<h3>Mi carro</h3>
		<div class="row my-3">
			<div class="col-lg-12">
				<table class="table table-sm table-borderless border border-dark">
					<thead class="bg-mybg text-white">
						<tr>
							<th scope="col">Producto</th>
							<th scope="col">Precio/unidad</th>
							<th scope="col">Stock</th>
							<th scope="col">Cantidad a comprar</th>
							<th scope="col">Opciones</th>
						</tr>
					</thead>
					<tbody class="bg-white">
						<c:forEach var="arr" items="${carro}">
						<tr>
							<td>${arr[0].nombre}</td>
							<td>${arr[0].precio}</td>
							<td>${arr[0].stock}</td>
							<td><a class="btn btn-outline-dark py-0 mr-3" href="/user/editar/carro/${arr[0].id}/-1" role="button">-</a> ${arr[1]} <a class="btn btn-outline-dark py-0 ml-3" href="/user/editar/carro/${arr[0].id}/1" role="button">+</a></td>
							<td><a href="/user/eliminar/carro/${arr[0].id}">Eliminar del carro</a></td>
						</tr>
						</c:forEach>		
					</tbody>
				</table>
			</div>
		</div>
		<h3>Total: ${precioTotal }</h3>
		<form method="POST" action="/user/confirmar">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
			
					<button type="submit" class="btn btn-danger">Confirmar pedido</button>
				</form>
		
	</div>
			
		
	
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<!-- <script src="/js/myscript.js"></script> -->

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	-->
</body>
</html>
