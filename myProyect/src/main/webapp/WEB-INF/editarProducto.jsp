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
	<title>Editar Producto</title>
</head>
<body style="background-color:#111111;">
<div class="container-fluid bg-dark">
<ul class="nav container py-2">
		
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
        			<button type="submit" class="btn btn-link mb-1 text-white">Logout</button>
    			</form>	
  			</li>
		</ul>

</div>
	<div class="container my-4">

		
		<h1 class="text-white">Editar producto: ${producto.nombre}</h1>
			
		
		<div class="row">
			<div class="col-lg-6">
				<div class="text-white bg-dark   border-bottom-0">
					<p class="my-0 mx-3 p-2">Cambiar nombre del producto</p>
				</div>
				<form:form action="/admin/actualizar/nombre/producto/${producto.id }" method="POST" modelAttribute="producto" class="border border-dark p-4 bg-white">
					<div class="form-group row">
						<form:label for="nombre" class="col-lg-4 col-form-label" path="nombre">Nombre: </form:label>
						<div class="col-lg-8">
							<form:errors path="nombre"/>
       						<form:input type="text" id="nombre" class="form-control" path="nombre" required="true"/>
						</div>
					</div>
					<div class="form-group row">
						<form:label for="precio" class="col-lg-4 col-form-label" path="nombre">Precio: </form:label>
						<div class="col-lg-8">
							<form:errors path="precio"/>
       						<form:input type="number" id="precio" class="form-control" path="precio" required="true"/>
							</div>
					</div>
						
					<div class="form-group row">	
						<form:label for="urlImagen" class="col-lg-4 col-form-label" path="urlImagen">url de imagen: </form:label>
						<div class="col-lg">
							<form:errors path="urlImagen"/>
       						<form:input type="text" id="urlImagen" class="form-control" path="urlImagen" required="true"/>
						</div>
				   </div>
				   <div class="form-group row">	
						<form:label for="urlImagenChico" class="col-lg-4 col-form-label" path="urlImagenChico">url de imagen chico: </form:label>
						<div class="col-lg">
							<form:errors path="urlImagenChico"/>
       						<form:input type="text" id="urlImagenChico" class="form-control" path="urlImagenChico" required="true"/>
						</div>
				   </div>
						
						<div class="form-group row">
						<form:label for="descripcion" class="col-lg-4 col-form-label" path="descripcion"> descripci??n: </form:label>
						<div class="col-lg">
							<form:errors path="descripcion"/>
       						<form:input type="text" id="descripcion" class="form-control" path="descripcion" required="true"/>
						</div>
						</div>
						<div class="form-group row">
						<form:label for="stock" class="col-lg-4 col-form-label" path="stock"> Stock: </form:label>
						<div class="col-lg">
							<form:errors path="descripcion"/>
       						<form:input type="number" id="stock" class="form-control" path="stock" required="true"/>
						</div>
						
						
					</div>

					<button type="submit" class="offset-lg-9 col-lg-3 btn btn-block btn-outline-dark">A??adir</button>
					<c:if test = "${errorReg != null}">
    					<p class="text-danger">${errorReg}</p>				
					</c:if>
				</form:form>
			</div>



		</div>
		
		
		<div class="row mt-4">
			<div class="col-lg-6">
				<div class="text-white bg-dark   border-bottom-0">
					<p class="my-0 mx-3 p-2">Agregar categorias al producto</p>
				</div>
				<form class="border border-dark p-4 bg-white" method="POST" action="/admin/agregar/categoria/producto/${producto.id}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
			
					<div class="form-group row">
						<label for="categoriaId" class="col-lg-4 col-form-label">Categor??a</label>
						<div class="col-lg">
							<select class="form-control" id="categoriaId" name="categoriaId" required>
								<option value="">Elegir categor??a</option>
								<c:forEach var="categoria" items="${categorias}">
								<option value="${categoria.id}">${categoria.nombre}</option>
								</c:forEach>
							</select>
						</div>
					</div>
			
					<button type="submit" class="offset-lg-9 col-lg-3 btn btn-block btn-outline-dark">Submit</button>
				</form>
			</div>
			<div class="col-lg-6">
				<table class="table  border border-secondary">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Nombre</th>
							<th scope="col">Opciones</th>
						</tr>
					</thead>
					<tbody class="bg-white">
						<c:forEach var="categoria" items="${producto.categoriaList}">
						<tr>
							<td>${categoria.nombre}</td>
							<td><a href="/admin/eliminar/categoria/producto/${producto.id}/${categoria.id}">Quitar Categoria</a></td>
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
