<%-- 
    Document   : index
    Created on : 10-nov-2014, 10:07:14
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <!-- Cabecera -->
    <jsp:include page="bloques/head.jsp"></jsp:include>
    <body>

        <!-- Barra de navegación -->
        <jsp:include page="bloques/navbar.jsp"></jsp:include>
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <div class="container">
                    <jsp:include page="bloques/formularioInicioSesion.jsp"></jsp:include>
                </div>
            </c:when>
            <c:otherwise>
                <jsp:include page="bloques/principal.jsp"></jsp:include>
            </c:otherwise>
        </c:choose>
    </body>
    
    <!-- Footer -->
    <jsp:include page="bloques/footer.jsp"></jsp:include>
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</html>
