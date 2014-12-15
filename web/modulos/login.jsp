<%-- 
    Document   : login
    Created on : 15-dic-2014, 10:14:50
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Beans -->
<jsp:useBean id="empleado" class="entidades.Empleado" scope="session"/>
<jsp:setProperty name="empleado" property="nick"/>
<jsp:setProperty name="empleado" property="autenticacion" param="password"/>
<c:choose>
    <c:when test="${empleado.validado}">
        <c:redirect url="../index.jsp"></c:redirect>>
    </c:when>
    <c:otherwise>
        <c:redirect url="../index.jsp?error=true"></c:redirect>>
    </c:otherwise>
</c:choose>
