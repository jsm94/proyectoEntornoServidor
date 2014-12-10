<%-- 
    Document   : parametros
    Created on : 06-nov-2014, 9:48:05
    Author     : Juan Antonio Seco Merchán
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar parámetros</title>
    </head>
    <body>
        <h2>Aquí se mostrarán todos los parámetros enviados en la petición</h2>
        <div>
        <%
            Map<String, String[]> parametros = request.getParameterMap();
            Iterator it = parametros.keySet().iterator();
            while(it.hasNext()){
                String key = (String) it.next();
                %>
                <p>
                    <span style="color:grey">Parámetro: <b><%= key %></b> = 
                        <span style="color:red"><%= Arrays.toString(parametros.get(key)) %></span></span>
                <%
            }
        %>
        </div>
    </body>
</html>
