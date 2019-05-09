<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%FacturaModel newFactura = (FacturaModel) request.getAttribute("newFactura"); %>
<table border=1>

<tr>
	<td>id </td>
	<td>Nombre</td>
	<td>Apellido</td>
	<td>Direccion
	</td>
	<td>Numero de tarjeta</td>
	<td>Fecha de caducidad</td>
	<td>CVC</td>
	<td>Fecha de compra</td>
	<td>Precio total</td>
	<td>borrar</td>
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



</body>
</html>