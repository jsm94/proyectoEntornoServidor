<%-- 
    Document   : contactar
    Created on : 13-nov-2014, 8:33:41
    Author     : Juan Antonio Seco Merchán
--%>

<%@page import="java.sql.*"%>
<%@page import="java.lang.ClassNotFoundException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getParameterMap().size() == 7) {
        //Recogemos los valores de los parámetros
        String nombre = request.getParameter("nombre");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        String ocupacion = request.getParameter("ocupacion");
        String correo = request.getParameter("correo");
        String empleado = request.getParameter("empleado");
        String mensaje = request.getParameter("mensaje");
        String fechaHora = new Timestamp(new java.util.Date().getTime()).toString();
        String ip = request.getRemoteAddr();

        try {
            //Cargamos el driver
            Class.forName("com.mysql.jdbc.Driver");
            Connection con; //Declaramos la variable para la conexión
            //url base de datos
            String url = "jdbc:mysql://localhost/cd_jsp";
            //Creamos la conexión
            con = DriverManager.getConnection(url, "jsp", "jsp");
            //Creamos la sentencia de insercción
            String sql = "INSERT INTO contacto VALUES (\"" + nombre + "\","
                    + "\"" + apellido1 + "\",\"" + apellido2 + "\",\"" + ocupacion + "\","
                    + "\"" + correo + "\",\"" + empleado + "\",\"" + mensaje + "\""
                    + ",\"" + fechaHora + "\",\"" + ip + "\")";

            Statement sentencia = con.createStatement();

            sentencia.executeUpdate(sql);

            con.close();
        } catch (SQLException se) {
            out.print(se);
        } catch (Exception e) {
            out.print(e);
        }
    }
%>

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
                <form action="contactar.jsp" method="post">
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
                                <%=mostrarEmpleados(out)%>
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

<%!
    private boolean mostrarEmpleados(JspWriter out) {
        //Recogemos los empleados para mostrarlos en un select
        try {
            //Cargamos el driver
            Class.forName("com.mysql.jdbc.Driver");
            Connection con; //Declaramos la variable para la conexión
            //url base de datos
            String url = "jdbc:mysql://localhost/cd_jsp";
            //Creamos la conexión
            con = DriverManager.getConnection(url, "jsp", "jsp");
            //Creamos la sentencia de insercción
            String sql = "SELECT  `empleados`.`id` ,  `empleados`.`nombre` ,  `apellidos` ,  `departamentos`.`nombre` AS `departamento` FROM  `empleados` "
                    + "JOIN  `departamentos` ON  `empleados`.`departamento` =  `departamentos`.`id`";
            
            Statement sentencia = con.createStatement();
            
            ResultSet rs = sentencia.executeQuery(sql);
            
            while(rs.next()) {
                out.println("<option value=\"" + rs.getInt("id") + "\">"
                        + rs.getString("nombre") + " " + rs.getString("apellidos") + ", " + rs.getString("departamento") + "</option>");
            }
        } catch (SQLException se) {
            System.out.print(se);
        } catch (Exception e) {
            System.out.print(e);
        }
        return true;
    }
%>
