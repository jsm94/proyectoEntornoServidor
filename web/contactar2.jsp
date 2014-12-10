<%-- 
    Document   : contactar
    Created on : 13-nov-2014, 8:33:41
    Author     : Juan Antonio Seco Merchán
--%>

<%@page import="utiles.*"%>
<%@page import="java.util.*"%>
<%@page import="utiles.Organizacion"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.ClassNotFoundException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacto</title>
    </head>
    <style>
        .caja {
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            width: 450px;
            height: 600px;
        }

        .caja h2 {
            text-align: center
        }

        .centro {
            border: 1px solid black;
            padding: 20px;
            height: 400px;
        }

        .fila {
            width: 100%;
            margin-bottom: 10px;
            height: 30px;
        }

        .fila.texto {
            height: 110px;
        }

        .columna1 {
            width: 39%;
            margin-right: 10%;
            float: left
        }

        .columna1.ancho {
            width: 100%
        }

        .columna1 textarea {
            width: 98.5%;
            height: 100px
        }

        .columna2 {
            width: 50%;
            float: left
        }

        .columna2 input{
            width: 100%;
        }
    </style>
    <body>
        <div class="caja">
            <h2>Formulario de contacto</h2>
            <div class="centro">
                <form action="guardarMensaje.jsp" method="post">
                    <div class="fila">
                        <div class="columna1">Nombre</div>
                        <div class="columna2"><input required type="text" name="nombre" maxlength="30"></div>
                    </div>
                    <div class="fila">
                        <div class="columna1">Primer apellido</div>
                        <div class="columna2"><input required type="text" name="apellido1" maxlength="15"></div>
                    </div>
                    <div class="fila">
                        <div class="columna1">Segundo apellido</div>
                        <div class="columna2"><input required type="text" name="apellido2" maxlength="15"></div>
                    </div>
                    <div class="fila">
                        <div class="columna1">Ocupación</div>
                        <div class="columna2"><input required type="text" name="ocupacion" maxlength="30"></div>
                    </div>
                    <div class="fila">
                        <div class="columna1">E-mail</div>
                        <div class="columna2"><input required type="email" name="correo" maxlength="60"></div>
                    </div>
                    <div class="fila">
                        <div class="columna1">Empleado destinatario</div>
                        <div class="columna2">
                            <select name="empleado" style="width:102%">
                                <%
                                    // Creamos la lista de empleados que pertenecen a nuestra organizacion
                                    List<Empleado> empleados = Organizacion.getEmpleados();
                                    Iterator<Empleado> it = empleados.listIterator(); // Creamos un iterador para la lista
                                    Empleado empleado = it.next(); // Añadimos al iterador el primer empleado
                                    // Realizamos un bucle para recorrer el iterador
                                    while (it.hasNext()) {
                                        // Insertamos los datos del empleado como opcion <option>
                                        %>
                                        <option value="<%= empleado.getId() %>">
                                            <%= empleado.getNombre() %> <%= empleado.getApellidos()  %>, <%= empleado.getDepartamento() %>
                                        </option>
                                        <%
                                        // Recogemos el siguiente empleado
                                        empleado = it.next();
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="fila texto">
                        <div class="columna1 ancho"><textarea name="mensaje" maxlength="300"></textarea></div>
                    </div>
                    <div class="fila">
                        <button type="submit">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>