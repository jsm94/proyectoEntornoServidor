<%-- 
    Document   : index
    Created on : 10-nov-2014, 10:07:14
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <h1>Ejercicios</h1>
        <%
            HttpSession sesion = request.getSession(false);
            sesion.setMaxInactiveInterval(10);
            if (sesion.getAttribute("nombre") != null) {
        %><h3>Bienvenido <%= request.getSession(false).getAttribute("nombre")%></h3> 
        <%}%>
        <ul>
            <li><a href="parametros.jsp?Pepe=Pepa">Parámetros</a></li>
            <li><a href="conversorTemperaturas.jsp">Conversor de temperaturas</a></li>
            <li><a href="login.jsp">Iniciar sesión</a></li>
            <li><a href="contactar.jsp">Contacta 1</a></li>
            <li><a href="contactar2.jsp">Contacta 2</a></li>
            <li><a href="verMensajes.jsp">Ver mensajes</a></li>
        </ul>
    </body>
</html>
