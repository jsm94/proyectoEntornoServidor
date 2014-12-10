<%-- 
    Document   : login.jsp
    Created on : 10-nov-2014, 9:27:05
    Author     : Juan Antonio Seco Merchán
--%>

<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String res = null;
    if (request.getParameter("envio") != null) {
        String nombre = request.getParameter("nombre");
        String pass = request.getParameter("password");
        if (validarUsuario(nombre, pass, application)) {
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("nombre", nombre);
            response.sendRedirect("index.jsp");
        } else {
            res = "<p style='color:red'>Usuario incorrecto</p>";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <style>
            .caja {
                width: 300px;
            }

            .caja div {
                border: 1px solid black;
                padding: 20px
            }

            p>input {
                float: right;
            }

            p>span {
                font-weight: bold
            }

            h2 {
                text-align: center
            }

            div>span {
                padding-left: 75%;
                width: 100%
            }

            button {
                width: 25%
            }
        </style>
    </head>
    <body>
        <div class="caja">
            <h2>Inicio de sesión</h2>
            <form action="login.jsp">
                <div>
                    <p class="nombre"><span>Nombre:</span>
                        <input type="text" name="nombre" placeholder="Juan" required>
                    </p>
                    <p class="pass"><span>Contraseña:</span>
                        <input type="password" name="password" placeholder="****" required>
                    </p>
                    <span><button type="submit" name="envio">Enviar</button></span>
                    <%
                        if (res != null) {
                            out.print(res);
                        }
                    %>
                </div>
            </form>
        </div>
    </body>
</html>

<%!
    private boolean validarUsuario(String user, String password, ServletContext sc) {
        boolean valido = false;
        String usuario = user + ":" + password + ";";
        //Recogemos la ruta del ficero
        try {
            File archivo = new File(sc.getInitParameter("usuarios"));
            FileReader fr = new FileReader(archivo);
            BufferedReader br = new BufferedReader(fr);
            while (br.ready()) {
                String userLeido = br.readLine();
                if (userLeido.equals(usuario)) {
                    valido = true;
                }
            }
            br.close();
        } catch (FileNotFoundException ex) {
            System.out.println("************\nFichero no encontrado\n************\n");
        } catch (IOException ex) {
            System.out.println("************\nNo se puede leer el fichero\n************\n");;
        }
        return valido;
    }
%>
