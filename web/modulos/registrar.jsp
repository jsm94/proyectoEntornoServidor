<%-- 
    Document   : registrar
    Created on : 16-dic-2014, 18:37:56
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Beans -->
<jsp:useBean id="empleado" class="entidades.Empleado" scope="session"/>
<jsp:setProperty name="empleado" property="nick"/>
<jsp:setProperty name="empleado" property="autenticacion" param="password"/>
<c:choose>
    <c:when test="${!empleado.validado}">
        <jsp:setProperty name="empleado" property="guardar"/>
        <c:redirect url="login.jsp"></c:redirect>
    </c:when>
    <c:otherwise>
        <c:remove var="empleado" scope="session"></c:remove>
        <c:redirect url="registro.jsp?error=true"></c:redirect>
    </c:otherwise>
</c:choose>
