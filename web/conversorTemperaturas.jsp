<%-- 
    Document   : conversorTemperaturas
    Created on : 06-nov-2014, 10:06:50
    Author     : Juan Antonio Seco Merchán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Double cel = 0.0,
            fah = 0.0;

    if (request.getParameter("botonCel") != null) {
        cel = Double.parseDouble(request.getParameter("celsius"));
        fah = roundNum(cel * 9 / 5 + 32);
    } else if (request.getParameter("botonFah") != null) {
        fah = Double.parseDouble(request.getParameter("fahrenheit"));
        cel = roundNum((fah - 32) * 5 / 9);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conversor de temperaturas</title>
        <style>
            .gcel:after {
                content: "Cº";
                margin-left: -40px;
                margin-right: 40px;
                padding: .1em;
            }
            
            .gfah:after {
                content: "Fº";
                margin-left: -40px;
                margin-right: 40px;
                padding: .1em;
            }
        </style>
    </head>
    <body>
        <h2>Conversor</h2>
        <form action="conversorTemperaturas.jsp">
            <p>Grados Celsius 
                <span class="gcel">
                    <input name='celsius' type='number' step='any' value=<%= cel%>>
                </span>
                <input type='submit' value='convertir' name='botonCel'></p>
            <p>Grados Fahrenheit 
                <span class="gfah">
                    <input name='fahrenheit' type='number'step='any' value=<%= fah%>>
                </span>
                <input type='submit' value='convertir' name='botonFah'></p>
        </form>

    </body>
</html>

<%!
    public static double roundNum(double num) {
        num = num * 100;
        num = java.lang.Math.round(num);
        num = num / 100;
        return num;
    }
%>
