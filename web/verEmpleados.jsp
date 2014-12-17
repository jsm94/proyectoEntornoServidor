<%-- 
    Document   : verEmpleados
    Created on : 17-dic-2014, 17:16:21
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:if test="${empleado.admin == 0}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <!-- Cabecera -->
    <jsp:include page="bloques/head.jsp"></jsp:include>
        <body>

            <!-- Barra de navegación -->
        <jsp:include page="bloques/navbar.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-12"><h1>Listado de empleados</h1></div>
                    <div class="row">
                        <div class="col-md-12 tabla">
                            <table class="table">
                                <thead>
                                <th>Nick</th>
                                <th>Contraseña</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Departamento</th>
                                <th>Administrador</th>
                                </thead>
                                <tbody>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                   url="jdbc:mysql://localhost/empresa"
                                                   user="empresa"  password="empresa"/>

                                <sql:query dataSource="${snapshot}" var="result">
                                    SELECT * from empleados;
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <sql:query dataSource="${snapshot}" var="result2">
                                        SELECT nombre from departamentos where id=${row.departamento};
                                    </sql:query>
                                    <tr>
                                        <td>${row.nick}</td>
                                        <td>${row.password}</td>
                                        <td>${row.nombre}</td>
                                        <td>${row.apellidos}</td>
                                        <c:forEach var="dep" items="${result2.rows}">
                                            <td><span class="label label-primary">${dep.nombre}</span></td>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${row.admin == true}">
                                                <td><span class="label label-success">admin</span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><span class="label label-default">normal</span></td>
                                            </c:otherwise>
                                        </c:choose>
                                                <td><form action="bloques/editarEmpleado.jsp"><button class="btn btn-default btn-sm" name="emp" value="${row.id}"><span class="fa fa-pencil"></span></button></form></td>
                                                <td><form action="bloques/borrarEmpleado.jsp"><button class="btn btn-danger btn-sm" name="emp" value="${row.id}"><span class="fa fa-trash"></span></button></form></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!-- Footer -->
    <jsp:include page="bloques/footer.jsp"></jsp:include>
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</html>
