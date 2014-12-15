<%-- 
    Document   : formularioInicioSesion
    Created on : 14-dic-2014, 21:21:11
    Author     : Juan Antonio Seco Merch�n
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-6 col-md-offset-3">
    <form role="form" method="post" action="modulos/login.jsp">
        <h2 class="text-center">Inicia sesi�n</h2>
        <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
            <label for="nick">Nombre de usuario <small>(nick)</small></label>
            <input type="text" class="form-control" id="nick" name="nick" placeholder="Introduce tu nombre de usuario">
        </div>
        <div class="form-group<c:if test="${param.error}"> has-error has-feedback</c:if>">
            <label for="pass">Contrase�a</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Introduce tu contrase�a">
        </div>
        <button type="submit" class="btn btn-primary">Entrar</button>
        <span><a>Reg�strate</a></span>
        <c:if test="${param.error}">
            <p class="text-danger text-right">El usuario no existe o la contrase�a es incorrecta</p>
        </c:if>
    </form>
</div>

