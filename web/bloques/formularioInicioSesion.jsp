<%-- 
    Document   : formularioInicioSesion
    Created on : 14-dic-2014, 21:21:11
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-6 col-md-offset-3">
    <form role="form" method="post" action="modulos/login.jsp">
        <h2 class="text-center">Inicia sesión</h2>
        <div class="form-group<c:if test="${param.error != null}"> has-error has-feedback</c:if>">
            <label for="nick">Nombre de usuario <small>(nick)</small></label>
            <input type="text" class="form-control" id="nick" name="nick" placeholder="Introduce tu nombre de usuario">
            <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group<c:if test="${param.error != null}"> has-error has-feedback</c:if>">
            <label for="pass">Contraseña</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Introduce tu contraseña">
            <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
        </div>
        <button type="submit" class="btn btn-primary">Entrar</button>
        <span><a>Regístrate</a></span>
        <p class="text-danger text-right"><c:out value="${param.error}"></c:out></p>
    </form>
</div>

