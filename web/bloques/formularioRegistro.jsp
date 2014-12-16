<%-- 
    Document   : formularioRegistro
    Created on : 16-dic-2014, 18:07:19
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<div class="col-md-6 col-md-offset-3">
    <form role="form" method="post" action="registrar.jsp">
        <h2 class="text-center">Regístrate</h2>
        <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
                <label for="nick">Nombre de usuario <small>(nick)</small></label>
                <input type="text" required class="form-control" id="nick" name="nick" placeholder="Nombre de usuario">
            </div>
            <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
                <label for="password">Contraseña</label>
                <input type="password" required class="form-control" id="password" name="password" placeholder="Introduce tu contraseña">
            </div>
            <hr>
            <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
                <label for="nombre">Nombre</label>
                <input type="text" required class="form-control" id="nombre" name="nombre" placeholder="Introduce tu nombre">
            </div>
            <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
                <label for="apellidos">Apellidos</label>
                <input type="text" required class="form-control" id="apellidos" name="apellidos" placeholder="Introduce tus apellidos">
            </div>
            <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
                <label for="departamento">Departamento</label>
                <select required class="form-control" id="departamento" name="departamento">
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
        <button type="submit" class="btn btn-primary">Enviar</button>
        <c:if test="${param.error}">
            <p class="text-danger text-right">El usuario ya existe</p>
        </c:if>
    </form>
</div>
