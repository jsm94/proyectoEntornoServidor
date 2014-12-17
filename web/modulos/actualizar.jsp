<%-- 
    Document   : actualizar
    Created on : 17-dic-2014, 19:11:24
    Author     : Juan Antonio Seco Merchán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Beans -->
<jsp:useBean id="empleado" class="entidades.Empleado" scope="session"/>
<jsp:setProperty name="empleado" property="id"/>
<jsp:setProperty name="empleado" property="nick"/>
<jsp:setProperty name="empleado" property="nombre"/>
<jsp:setProperty name="empleado" property="apellidos"/>
<jsp:setProperty name="empleado" property="departamento"/>
<jsp:setProperty name="empleado" property="autenticacion" param="password"/>
<c:choose>
    <c:when test="${param.admin == null}">
        <jsp:setProperty name="empleado" property="admin" value="0"/>
    </c:when>
    <c:otherwise>
        <jsp:setProperty name="empleado" property="admin" value="1"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${!empleado.validado}">
        <jsp:setProperty name="empleado" property="actualizar" param="password"/>
        <c:remove var="empleado" scope="session"></c:remove>
        <c:redirect url="../verEmpleados.jsp"></c:redirect>
    </c:when>
    <c:otherwise>
        <c:remove var="empleado" scope="session"></c:remove>
        <c:redirect url="../verEmpleados.jsp"></c:redirect>
    </c:otherwise>
</c:choose>

