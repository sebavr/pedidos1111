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
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-link mb-1">Logout</button>
                </form>
            </li>
        </ul>


        <h2 class="my-4 text-white">Datos de la compra:</h2>
        <div class="col-9 mx-2 p-4 border border-2" id="box">
            <h4>Num. de Orden: ${pedido.numeroOrden}</h4>
            <h4>Fecha de la compra: ${pedido.createdAt}</h4>
            <br>
            <hr>
            <h5>Datos personales</h5>
            <hr>
            <p>Nombre: ${pedido.user.nombre} ${pedido.user.apellido}</p>
            <p>Email: ${pedido.user.email}</p>
            <p>Dirección: ${pedido.user.direccion}</p>
            <hr>
            <table class="table table-sm text-white  border border-dark bg-dark">
                <thead class="bg-mybg">
                    <tr>

                        <th scope="col" class="border border-1">Id Producto</th>
                        <th scope="col" class="border border-1">Nombre producto</th>
                        <th scope="col" class="border border-1">Cantidad</th>
                        <th scope="col" class="border border-1">Precio</th>

                    </tr>
                </thead>
                <tbody class="">
                    <c:forEach var="p" items="${productoPedidos}">
                        <tr>
                            <td class="border border-1">${p}</td><!-- vacio -->
                            <td class="border border-1">${p}</td><!-- vacio -->
                            <td class="border border-1">${p}</td><!-- vacio -->
                            <td class="border border-1">${p}</td><!-- vacio -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>Valor total de la compra: ${precioTotal}</p>
        </div>
       </div>
       
</body>

</html>