<%-- 
    Document   : detect
    Created on : Nov 1, 2021, 9:15:44 PM
    Author     : Topher
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Detection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Detection det = (Detection) request.getAttribute("detection");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
        <script src="https://printjs-4de6.kxcdn.com/print.min.css"></script>    
        <title>Reporte Deteccion</title>
    </head>
    <body>
        <div id='content'>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarTogglerDemo03"
                        aria-controls="navbarTogglerDemo03"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand" href="#"
                       ><img
                            src="img/Layer 1 Frame.png"
                            alt="umg_logo"
                            width="175"
                            height="50"
                            /></a>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="srvLog?action=home">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="srvReports">Reportes</a>
                            </li>
                            <% if (session.getAttribute("role").equals("ADMINISTRADOR")) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Usuarios</a>
                            </li>
                            <% }%>
                            <li class="nav-item">
                                <a class="nav-link" href="srvLog?action=logout">Salir</a>
                            </li>
                        </ul>
                        <span class="navbar-text">Bienvenido - ${user.userName} </span>          
                    </div>
                </div>
            </nav>
            <div class="container col-12 d-flex justify-content-center mt-2">
                <div class="card" style="width: 32rem;">
                    <img src="img/<%= det.getImgPath()%>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Fecha: <%= det.getDate().split(" ")[0]%></h5>
                        <h5 class="card-title">Hora: <%= det.getDate().split(" ")[1]%></h5>
                        <h5 class="card-title">Bodega: <%= det.getStore()%></h5>
                        <h5 class="card-title">Cámara: <%= det.getCamera()%> </h5>                                 
                    </div>
                </div>            
            </div>
        </div>
        <br>
        <div class="container d-flex justify-content-center">
            <button type="button" class='btn btn-primary' onclick="printJS({printable: 'content', type: 'html', header: 'Reporte de incidentes bodega', css: 'bootstrap/css/bootstrap.min.css'})">Descargar</button>
        </div>
    </body>    
</html>
