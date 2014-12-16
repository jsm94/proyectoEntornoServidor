<%-- 
    Document   : principal
    Created on : 15-dic-2014, 18:44:03
    Author     : Juan Antonio Seco Merchán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
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
                    <h4><span class="fa fa-user"/> ${empleado.nick}</h4>
                    <p><span class="fa fa-angle-double-right"/> ${empleado.nombre} ${empleado.apellidos}</p>
                    <p><span class="fa fa-archive"/> ${empleado.departamento}</p>
                </div>
            </div>
        </div>
        <div class="col-md-5 col-xs-12">

        </div>
        <div class="col-md-4 col-xs-12">

        </div>
    </div>
</div>

