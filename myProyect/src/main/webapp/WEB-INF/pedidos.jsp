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
	
		<ul class="nav">
		<li class="nav-item">
				<a class="nav-link" href="/admin/productos">Productos</a>
			</li>
  			<li class="nav-item">
				<a class="nav-link" href="/admin/categorias">Categorias</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="admin/allPedidos">Pedidos</a>
			</li>
			<li class="nav-item">
    			<form class="d-inline-block" id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-link mb-1">Logout</button>
    			</form>	
  			</li>
		</ul>

        <h2>Pedidos</h2>
        
        <div class="row">
			<div class="col">
				<table class="table table-sm table-borderless border border-dark">
					<thead class="bg-mybg text-white">
						<tr>
							<th scope="col">Pedido Id</th>
							<th scope="col">Numero de Orden</th>
					 	    <th scope="col">Nombre Usuario</th>
							<th scope="col">Fecha creacion</th>					
							<th scope="col">Productos</th>
							<th scope="col">Cantidad Productos</th>
							<th scope="col">Precio total</th>
							
						</tr>
					</thead>
					<tbody class="">
						<c:forEach var="productoPedido" items="${productoPedidos}">
						<tr>
							<td class="border border-1">${productoPedido.pedido.id}</td>
							<td class="border border-1">${productoPedido.pedido.numeroOrden}</td> 
							<td class="border border-1">${productoPedido.pedido.user.nombre}</td>
							<td class="border border-1">${productoPedido.createdAt}</td>
   					        <td class="border border-1">${productoPedido.producto.nombre}</td>
							<td class="border border-1">${productoPedido.cantidad}</td>
							<td class="border border-1">${productoPedido.precioTotal}</td>
<%-- 				           <td><a href="/admin/editar/pedido/${pedido.id}">Ver detalle</a> --%>
						</tr>

						</c:forEach>		
					</tbody>
				</table>
			</div>

</body>
</html>