<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Misuri Comics</title>

	<link href="css/style_admin.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.0.js" integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<%FacturaModel newFactura = (FacturaModel) request.getAttribute("newFactura");%>

	<div class="container">
		<table class="adminFacturas">
			<tr>
				<td><b>ID</b></td>
				<td><b>NOMBRE</b></td>
				<td><b>APELLIDO</b></td>
				<td><b>DIRECCION</b></td>
				<td><b>NUMERO DE TARJETA</b></td>
				<td><b>FECHA DE CADUCIDAD</b></td>
				<td><b>CVC</b></td>
				<td><b>FECHA DE COMPRA</b></td>
				<td><b>PRECIO TOTAL</b></td>
			</tr>

		<%for (int i=0; i<newFactura.getList().size(); i++){%>
			<tr>
				<td><%=newFactura.getList().get(i).getIdFactura()%> </td>
				<td><%=newFactura.getList().get(i).getNombre_cliente()%></td>
				<td><%=newFactura.getList().get(i).getApellido_cliente()%></td>
				<td><%=newFactura.getList().get(i).getDireccion_cliente()%></td>
				<td><%=newFactura.getList().get(i).getNumero_tarjeta() %></td>
				<td><%=newFactura.getList().get(i).getCaducidad_tarjeta() %></td>
				<td><%=newFactura.getList().get(i).getCvc_tarjeta()%></td>
				<td><%=newFactura.getList().get(i).getFecha_compra()%></td>
				<td><%=newFactura.getList().get(i).getPrecio_total()%></td>
				<td style="text-align:center"><a href="http://localhost:8080/proyecto_final/CBorrar2?id=<%=newFactura.getList().get(i).getIdFactura()%>" onclick="if (confirm('Are you sure you want to delete?')) { form.action='/Config?pg=FIBiller&amp;cmd=delete'; } else { return false; }"> <img src="https://img.icons8.com/material-rounded/24/000000/waste.png"></a></td> 
			</tr>
		<%} %>
		</table>

		<div class="boton">
            <a href="http://127.0.0.1:5500/index.html" type="button" class="btn btn-danger inicio">Inicio</a>
        </div>
	</div>
</body>
</html>
