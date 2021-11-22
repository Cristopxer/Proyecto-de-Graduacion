<%-- 
    Document   : index.jsp
    Created on : Nov 1, 2021, 7:45:14 AM
    Author     : Topher
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Detection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="Model.Chart"%>
<%
    if (session.getAttribute("user") != null) {


%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>Reportes</title>
    </head>
    <body>
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
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="srvLog?action=logout">Salir</a>
                        </li>
                    </ul>
                    <span class="navbar-text">Bienvenido - ${user.userName} </span>          
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row mt-5">
                <div class="col-12 d-flex justify-content-center">
                    <h1>Reportes</h1>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-sm-12 d-flex justify-content-center">
                    <a href="srvReports?action=year"><button type="button" class="btn btn-outline-primary btn-lg">
                            Incidentes año
                        </button></a>
                    <a href="srvReports?action=store"><button type="button" class="btn btn-outline-primary btn-lg">
                            Incidentes bodega
                        </button></a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 mt-4 container-fluid">
                    <form class="d-flex" post="srvReports">
                        <input
                            class="form-control me-2"
                            type="search"
                            name="search"
                            placeholder="Search"
                            aria-label="Search"
                            />
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-striped mt-4">
                        <thead>
                            <tr>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Bodega</th>
                                <th scope="col">Cámara</th>
                                <th scope="col">Reporte</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% for (Detection detect : (ArrayList<Detection>) request.getAttribute("detectionList")) {%>
                            <tr>                                                        
                                <td><%= detect.getDate().split(" ")[0]%></td>
                                <td><%= detect.getDate().split(" ")[1]%></td>
                                <td><%= detect.getStore()%></td>
                                <td><%= detect.getCamera()%></td>
                                <td><span><a href="srvReports?id=<%= detect.getId()%>"><img src="img/report_icon.png"/></a></span></td>                                              
                            </tr>           
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>        
    </body>
</html>
<%  } else {
        response.sendRedirect("index.jsp");
    }%>