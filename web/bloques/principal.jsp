<%-- 
    Document   : principal
    Created on : 15-dic-2014, 18:44:03
    Author     : Juan Antonio Seco Merchán
--%>

<%@page import="entidades.Empleado"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <div class="container-fluid">
        <!-- Añadimos nuestra información -->
        <div class="col-md-3 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Tus datos</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                            <img src="http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=256" class="img-responsive img-circle" alt="Responsive image">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-4 col-xs-6 col-xs-offset-3 text-center">
                            <h4><span class="fa fa-user"/> ${empleado.nick} <c:if test="${empleado.admin == 1}"><span class="label label-success">admin</span></c:if></h4>
                            </div>
                        </div>
                        <p><span class="fa fa-angle-double-right"/> ${empleado.nombre} ${empleado.apellidos}</p>
                    <p><span class="fa fa-archive"/> ${empleado.departamento}</p>
                </div>
            </div>
        </div>
        <div class="col-md-5 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <c:set value="${empleado.mensajes()}" var="msg"/>
                    <h3 class="panel-title">Mensajes  <span class="badge">${fn:length(empleado.mensajes)}</span></h3>
                </div>
                <div class="panel-body panelMensajes">
                    <c:forEach items="${msg}" var="item">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><span class="fa fa-comment"/> <b>${item.nombre} ${item.apellidos}</b> &nbsp;<small><a href="mailto:${item.email}">${item.email}</a></small><p>
                                        <p><span class="label label-primary">${item.ocupacion}</span></p>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <p><span class="label label-default"><span class="fa fa-calendar"> <fmt:formatDate value="${item.fechaYHora}" pattern="EE, dd MMMM yyyy"/></span></span><p>
                                        <p><span class="label label-default"><span class="fa fa-clock-o"> <fmt:formatDate value="${item.fechaYHora}" pattern="HH:mm"/></span></span><p>
                                        <p><span class="label label-default"><span class="fa fa-crosshairs"> ${item.ip}</span></span></p>
                                    </div>
                                    <div class="col-md-12">
                                        <hr>
                                        <blockquote>
                                            <p style="font-size:14px">${item.mensaje}</p>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-xs-12">

        </div>
    </div>

