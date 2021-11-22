<%-- 
    Document   : index
    Created on : Aug 26, 2021, 9:13:08 PM
    Author     : marcial
--%>

<%@page import="java.util.Arrays"%>
<%@page import="Model.Chart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null && session.getAttribute("role").equals("NO_ADMON")) {


%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>Inicio</title>
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
                            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="srvReports">Reportes</a>
                        </li>
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
                <div class="col-sm-12">
                    <div>
                        <canvas id="monthly_detections" height="70px"></canvas>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-6">
                    <div>
                        <canvas id="year_detections"></canvas>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div>
                        <canvas id="store_detections"></canvas>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card mt-4">
                        <div class="card-body text-center">
                            <h2 class="card-subtitle mb-2 text-muted" style="font-size: 2vw">DIAS SIN INCIDENTES</h2>
                            <h1 style="font-size: 8vw" class="card-title">${charts.getDayNotDetection()}</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        //   monthly_detections Chart
        const labels_months = [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre",
        ];
        const data = {
            labels: labels_months,
            datasets: [
                {
                    label: "Incidentes Mensual",
                    backgroundColor: "rgb(255, 99, 132)",
                    borderColor: "rgb(255, 99, 132)",
        <% Chart chart = (Chart) request.getAttribute("charts");
            String[] months = chart.getMonthDetection().split(",");
            String[] detections = chart.getMonthlyDetection().split(",");
            String[] dataChart = "0,0,0,0,0,0,0,0,0,0,0,0".split(",");
            Integer count = 0;
            for (String dx : months) {                
                dataChart[Integer.parseInt(dx) - 1] = detections[count];
                count++;
            }
            String data = Arrays.toString(dataChart);
        %>
                    data: <%= data%>,
                },
            ],
        };

        const config = {
            type: "line",
            data: data,
            options: {},
        };

        var monthly_detections = new Chart(
                document.getElementById("monthly_detections"),
                config
                );
        // Store Detection Chart
        const data_donut = {
            labels: [${charts.getStoreName()}],
            datasets: [
                {
                    label: "Detecciones bodega",
                    data: [${charts.getStoreDetection()}],
                    backgroundColor: [
                        "rgb(255, 99, 132)",
                        "rgb(54, 162, 235)",
                        "rgb(255, 205, 86)",
                    ],
                    hoverOffset: 4,
                },
            ],
        };
        const config_donut = {
            type: "doughnut",
            data: data_donut,
        };
        var detections_store = new Chart(
                document.getElementById("store_detections"),
                config_donut
                );
        // Year_detections Chart
        const labels_year = [${charts.getYear()}];
        const data_bar = {
            labels: labels_year,
            datasets: [
                {
                    label: "Incidentes Anual",
                    data: [${charts.getYearDetection()}],
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
</body>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>
<% } else {
        response.sendRedirect("index.jsp");
    }%>