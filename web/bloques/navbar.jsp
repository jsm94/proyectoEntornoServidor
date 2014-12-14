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
                <li class="active"><a href="#">Inicio</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <c:if test="${sessionScope.user != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#about"><c:out value="${sessionScope.user.nick}"></c:out></a></li>
                </ul>
            </c:if>
        </div><!--.nav-collapse -->
    </div>
</nav>
