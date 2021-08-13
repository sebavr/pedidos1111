
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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

	<title>Pedidos</title>

</head>
<body style="background-color:#111111;">
    <div class="container-fluid">
        <ul class="nav  py-2 bg-dark">
			<li class="nav-item">
				<a class="nav-link" href="/admin/productos">Productos</a>
			</li>
  			<li class="nav-item">
				<a class="nav-link" href="/admin/categorias">Categorias</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/allPedidos">Pedidos</a>

			</li>
			<li class="nav-item">
    			<form class="d-inline-block" id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-link mb-1">Logout</button>
    			</form>	
  			</li>
		</ul>


        <h2 class="my-4 text-white">Pedidos</h2>
        
        <div class="row my-3">
			<div class="col">
				<table class="table table-sm table-light border border-1">
					<thead class="bg-mybg text-white ">
						<tr>
							
							<th scope="col" class="border border-1">Pedido Id</th>
							<th scope="col" class="border border-1">Numero de Orden</th>
							<th scope="col" class="border border-1">Fecha creacion</th>					
							<th scope="col" class="border border-1">Detalle compra</th>
							
						</tr>
					</thead>
					<tbody class="">
						<c:forEach var="pedido" items="${pedidos}">
						<tr>
							<td class="border border-1">${pedido.id}</td>
							<td class="border border-1">${pedido.numeroOrden}</td>
							<td class="border border-1"><fmt:formatDate value="${pedido.createdAt}" pattern="HH:mm:ss a" /></td>
					        <td class="border border-1"><a href="/admin/pedido/${pedido.id}">Ver detalle</a></td>
					       
						</tr>

						</c:forEach>		
					</tbody>
				</table>
			</div>

		</div>
		
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

