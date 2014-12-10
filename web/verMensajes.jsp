<%-- 
    Document   : verMensajes
    Created on : 20-nov-2014, 13:07:35
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="utiles.*"%>
<%@page import="java.util.*"%>
<%@page import="utiles.Organizacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensajes</title>
    </head>
    <body>
        <h1>Mensajes registrados</h1>
        <table border="1">
            <thead>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Ocupación</th>
            <th>Email</th>
            <th>Empleado</th>
            <th>Mensaje</th>
            <th>Fecha y hora</th>
            <th>IP</th>
            </thead>
        <%
            List<Mensaje> mensajes = Organizacion.getMensajes();
            Iterator<Mensaje> it = mensajes.listIterator();
            Mensaje mensaje = it.next();
            
            while (it.hasNext()) {
                %>
                <tr>
                    <td><%= mensaje.getNombre() %></td>
                    <td><%= mensaje.getPrimerApellido()%> <%= mensaje.getSegundoApellido()%></td>
                    <td><%= mensaje.getOcupacion()%></td>
                    <td><%= mensaje.getEmail()%></td>
                    <td><%= mensaje.getEmpleado().getNombre()%> <%= mensaje.getEmpleado().getApellidos()%></td>
                    <td><%= mensaje.getMensaje()%></td>
                    <td><%= mensaje.getFechaYHora()%></td>
                    <td><%= mensaje.getIp()%></td>
                </tr>
                <%
                mensaje = it.next();
            }
        %>
        </table>
    </body>
</html>
