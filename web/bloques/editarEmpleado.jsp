<%-- 
    Document   : editarEmpleado
    Created on : 17-dic-2014, 18:23:25
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/empresa"
                   user="empresa"  password="empresa"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from empleados where id=${param.emp};
</sql:query>
<c:forEach var="row" items="${result.rows}">
    <jsp:useBean id="empEdit" class="entidades.Empleado" scope="session"/>
    <jsp:setProperty name="empEdit" property="nick" value="${row.nick}"/>
    <jsp:setProperty name="empEdit" property="nombre" value="${row.nombre}"/>
    <jsp:setProperty name="empEdit" property="apellidos" value="${row.apellidos}"/>
</c:forEach>

<!DOCTYPE html>
<html>
    <c:if test="${empleado.admin == 0}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <!-- Cabecera -->
    <jsp:include page="head.jsp"></jsp:include>
        <body>

            <!-- Barra de navegación -->
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <form role="form" method="post" action="../modulos/actualizar.jsp" accept-charset="iso-8859-1">
                            <h2 class="text-center">Editar empleado ${empEdit.validado}</h2>
                        <div class="form-group">
                            <label for="nick">Nombre de usuario <small>(nick)</small></label>
                            <input type="text" required class="form-control" id="nick" name="nick" placeholder="${empEdit.nick}">
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" required class="form-control" id="password" name="password" placeholder="Introduce contraseña nueva">
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" required class="form-control" id="nombre" name="nombre" placeholder="${empEdit.nombre}">
                        </div>
                        <div class="form-group">
                            <label for="apellidos">Apellidos</label>
                            <input type="text" required class="form-control" id="apellidos" name="apellidos" placeholder="${empEdit.apellidos}">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="admin"> Administrador
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="departamento">Departamento</label>
                            <select required class="form-control" id="departamento" name="departamento" value="${empEdit.departamento}">
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                   url="jdbc:mysql://localhost/empresa"
                                                   user="empresa"  password="empresa"/>

                                <sql:query dataSource="${snapshot}" var="result">
                                    SELECT * from departamentos;
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <option value="${row.id}">${row.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                                    <button type="submit" class="btn btn-primary" name="id" value="${param.emp}">Enviar</button>
                    </form>
                </div>
            </div>
    </body>

    <!-- Footer -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</html>
