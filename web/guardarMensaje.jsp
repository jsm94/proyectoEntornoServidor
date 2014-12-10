<%-- 
    Document   : guardarMensaje
    Created on : 19-nov-2014, 9:10:38
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="utiles.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Mensaje mensaje = new Mensaje();
    mensaje.setNombre(request.getParameter("nombre"));
    mensaje.setPrimerApellido(request.getParameter("apellido1"));
    mensaje.setSegundoApellido(request.getParameter("apellido2"));
    mensaje.setOcupacion(request.getParameter("ocupacion"));
    mensaje.setEmail(request.getParameter("correo"));
    mensaje.setEmpleado(Integer.parseInt(request.getParameter("empleado")));
    mensaje.setMensaje(request.getParameter("mensaje"));
    mensaje.setIp(request.getRemoteAddr());
    mensaje.setFechaYHora(new java.util.Date());
    mensaje.guardar();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje recibido</title>
    </head>
    <body>
        <h1>Mensaje Recibido</h1>
    </body>
</html>
