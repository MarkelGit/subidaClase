<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Misuri Comics</title>
	
	<link href="css/style_factura.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.0.js" integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<%FacturaModel newFactura = (FacturaModel) request.getAttribute("newFactura");%>

	<div class="container">
		<h1><%=newFactura.nombre_empresa %></h1>
		<b>NIF: </b><%=newFactura.NIF %>
		<br>
		<b>Cliente: </b><%=newFactura.getNombre_cliente()%><%=newFactura.getApellido_cliente()%>
		<br>
		<b>Direccion: </b><%=newFactura.getDireccion_cliente()%>
		
		<table class="facturaFinal">
			<tr class="titulos">
				<td><h3><b>PRODUCTO</b></h3></td>
				<td><h3><b>CANTIDAD</b></h3></td>
				<td><h3><b>PRECIO (EUROS)</b></h3></td>
			</tr>
		
		<% for (int i=0; i<newFactura.getLineaList().size(); i++){%>
			<tr>
				<td><%=newFactura.getLineaList().get(i).getNombre_producto()%></td>
				<td><%=newFactura.getLineaList().get(i).getCantidad()%></td>
				<td><%=newFactura.getLineaList().get(i).getPrecio_linea()%></td>
			</tr>
		<%} %>
		
			<tr>
				<td></td>
				<td></td>
				<td><b>Precio Total (euros):</b> <%=newFactura.getPrecio_total()%></td>
			</tr>
		</table>
        
        <div class="boton">
            <a href="http://127.0.0.1:5500/index.html" type="button" class="btn btn-danger inicio">Inicio</a>
        </div>
	</div>
</body>
</html>
