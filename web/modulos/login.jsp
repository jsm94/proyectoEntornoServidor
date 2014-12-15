<%-- 
    Document   : login
    Created on : 15-dic-2014, 10:14:50
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Beans -->
<jsp:useBean id="empleado" class="entidades.Empleado" scope="session"/>
<jsp:setProperty name="empleado" property="nick"/>
<jsp:setProperty name="empleado" property="autenticacion" param="password"/>
<c:choose>
    <c:when test="${empleado.validado}">
        <jsp:forward page="../index.jsp"></jsp:forward>
    </c:when>
    <c:otherwise>
        <c:set var="error" value="El usuario no es correcto"></c:set>
        <c:redirect url="../index.jsp?error=${error}"></c:redirect>>
    </c:otherwise>
</c:choose>
