<%-- 
    Document   : error
    Created on : 19-nov-2014, 10:02:31
    Author     : Juan Antonio Seco Merchán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>Error al enviar el mensaje.</h1>
        <p>Mensaje de la excepcion: <span style="color: #660000"><%=exception.getMessage()%></span></p>
    </body>
</html>
