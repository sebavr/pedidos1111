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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style2.css">
	<title>Pedir</title>
</head>
<body>

	<div id="encabezado" class="container-fluid">
		 <img class="rounded mx-auto d-block" src="imagenes/logo1.png" alt="Italian Trulli">
		 
		<c:choose>
  			<c:when test="${user!=null}">
  			<div class="d-flex justify-content-end">
  				<form class="d-inline-block" id="logoutForm" method="POST" action="/logout">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-danger">Logout</button>
    			</form>	
    		</div>			
			</c:when>
			<c:otherwise>
		 		<div class="d-flex justify-content-end"><a id="entrar" class="py-2 px-3 rounded" href="/login">Entrar <i class="bi bi-box-arrow-up"></i></a></div>
			</c:otherwise>
		</c:choose>
		 <ul class="nav justify-content-center mt-0">
  			<li class="nav-item">
				<h4><a class="nav-link disabled" href="" disable>Inicio</a></h4>
			</li>
			<li class="nav-item">
				<h4><a class="nav-link" href="">Menú</a></h4>
  			</li>
  			<li class="nav-item">
  				 <h4><a class="nav-link disabled" href="">Promociones</a></h4>
  			</li>
  			<li class="nav-item">
  				<h4><a class="nav-link disabled" href="">Almuerzos</a></h4>
  			</li>
		</ul>
	</div>
	
	<div class="mx-3 d-flex justify-content-end">
		<a class="btn btn-danger" href="/user/checkout" role="button">Ir al carro</a>
	</div>
	<div id="enlaces" class="container-fluid">
		<div class="border border-secondary mb-4"></div>
		<ul class="nav justify-content-center mt-3">
		<c:forEach var="categoria" items="${categorias}">
    		<li class="nav-item">
				<a class="nav-link" href="#<c:out value="${categoria.nombre}"/>">${categoria.nombre}</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	
	
	<div class="container">
		<div class="row">
		
		<c:forEach var="categoria" items="${categorias}">
    	<div id="${categoria.nombre}" class="container-fluid fontzero">
			<h4 class="text-white">${categoria.nombre}</h4>
			<c:forEach var="producto" items="${categoria.productoList}">
			<c:if test = "${producto.stock != 0}">
    			<div class="col-lg-4 d-inline-block px-0">
    				<div class="casilla p-2 m-2">
    					<div class="row">
    						<div class="col-lg-6">
    							<p>${producto.nombre}</p>
    							<p>$${producto.precio}</p>
    							<p>Stock: ${producto.stock}</p>
    							<a href="/producto/${producto.id}">Detalles</a>
    						</div>
    						<div class="col-lg-6">
    							<img class="rounded mx-auto d-block" height="150px" src="imagenes/polloasado.jpeg" alt="Italian Trulli">
    						</div>
    					</div>
    				</div>
    			</div>
    		</c:if>	
			</c:forEach>
		</div>	
		</c:forEach>
		
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
