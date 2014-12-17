<%-- 
    Document   : navbar
    Created on : 14-dic-2014, 20:16:09
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Botón</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i class="fa fa-users"></i> Gestión de empleados</a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                <c:if test="${empleado.admin == 1}"><li><a href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/verEmpleados.jsp">Empleados</a></li></c:if>
                <li><a href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/contacto.jsp">Contacto</a></li>
            </ul>
            <c:if test="${empleado != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><c:out value="@${empleado.nick}"></c:out></a></li>
                    <li><form action="modulos/logout.jsp" style="margin-top: 10px;"><button class="btn btn-danger btn-sm">Cerrar sesión</button></form></li>
                </ul>
            </c:if>
        </div><!--.nav-collapse -->
    </div>
</nav>
