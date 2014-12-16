<%-- 
    Document   : logout
    Created on : 16-dic-2014, 18:01:13
    Author     : Juan Antonio Seco Merchán
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="empleado" scope="session"></c:remove>
<c:redirect url="../index.jsp"></c:redirect>>
