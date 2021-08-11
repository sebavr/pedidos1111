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
	
		<div class="row my-4">
  			<div class="col-lg-11"><h1 class="mx-2 mb-0 pb-2">Confirma tu pedido ${user.nombre}</h1></div>
  			<div class="col-lg"><div class="mt-4"><a href="/logout">Logout</a></div></div>
  		</div>
		
		
		<h3>Mi carro</h3>
		<div class="row my-3">
			<div class="col-lg-5">
				<table class="table table-sm table-borderless border border-dark">
					<thead class="bg-mybg text-white">
						<tr>
							<th scope="col">Cantidad</th>
							<th scope="col">Producto</th>
						</tr>
					</thead>
					<tbody class="bg-white">
						<c:forEach var="arr" items="${carro}">
						<tr>
							<td>${arr[0].nombre}</td>
							<td>${arr[1]}</td>
						</tr>
						</c:forEach>		
					</tbody>
				</table>
			</div>
		</div>
		
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
