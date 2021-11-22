<%-- 
    Document   : year
    Created on : Nov 1, 2021, 3:32:51 PM
    Author     : Topher
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="Model.Chart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Detection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null) {


%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
        <script src="https://printjs-4de6.kxcdn.com/print.min.css"></script>    
        <title>Incidentes anual</title>
    </head>
</head>
<body>
    <div id="content">
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
            <div class="row">
                <div class="col-sm-12 d-flex justify-content-center">
                    <h2>Inicidentes Anuales</h2>
                </div>        
            </div>
            <div class="row">
                <div class="col-sm-12 d-flex justify-content-center">
                    <div>
                        <canvas id="year_detections" width="800px"></canvas>
                    </div>
                    <!--<img src="img/add.jpg"/>-->
                </div>
            </div>
            <%        Chart ct = (Chart) request.getAttribute("chart");
                String[] years = ct.getYear().replace("'", "").split(",");
                Collections.reverse(Arrays.asList(years));
                ArrayList<Detection> dt = (ArrayList<Detection>) request.getAttribute("detectionList");
                for (String year : years) {
            %>
            <div class="row mt-5">
                <div class="col-12 d-flex justify-content-center">
                    <h2><%= year%></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table class="table table-striped mt-4">                    
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Bodega</th>
                            <th scope="col">Cámara</th>                                
                        </tr>                    
                        <% for (Detection detect : dt) {
                                if (year.equalsIgnoreCase(detect.getDate().split("-")[0])) {
                        %>
                        <tr>                                                        
                            <td><%= detect.getDate().split(" ")[0]%></td>
                            <td><%= detect.getDate().split(" ")[1]%></td>
                            <td><%= detect.getStore()%></td>
                            <td><%= detect.getCamera()%></td>                                
                        </tr>   
                        <%      }
                            }%>

                    </table>
                </div>        
            </div>       
            <% } %>
        </div>
    </div>
    <div class="container">
        <button type="button" class='btn btn-primary' onclick="printJS({printable: 'content', type: 'html', header: 'Reporte de incidentes anual', css: 'bootstrap/css/bootstrap.min.css'})">Descargar</button>            
    </div>    
</body>
<script>
    // Year_detections Chart
    const labels_year = [${chart.getYear()}];
    const data_bar = {
        labels: labels_year,
        datasets: [
            {
                label: "Incidentes Anual",
                data: [${chart.getYearDetection()}],
                backgroundColor: [
                    "rgba(255, 99, 132, 0.2)",
                    "rgba(255, 159, 64, 0.2)",
                    "rgba(255, 205, 86, 0.2)",
                ],
                borderColor: [
                    "rgb(255, 99, 132)",
                    "rgb(255, 159, 64)",
                    "rgb(255, 205, 86)",
                ],
                borderWidth: 1,
            },
        ],
    };
    const config_bar = {
        type: "bar",
        data: data_bar,
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        },
    };
    var year_detections = new Chart(
            document.getElementById("year_detections"),
            config_bar
            );
</script>
</html>
<%  } else {
        response.sendRedirect("index.jsp");
    }%>