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

<%for (int i=0; i<newFactura.getList().size(); i++){%>
	<h1><%=newFactura.getList().get(i).getIdFactura()%> </h1>
	
<%} %>



</body>
</html>