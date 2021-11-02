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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
            integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
        <title>Incidentes anual</title>
    </head>
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
        </div>
    </nav>
    <div class='container'>
        <div class="row">
            <div class="col-sm-12 d-flex justify-content-center">
                <h2>Inicidentes Bodegas</h2>
            </div>        
        </div>
        <!--        <div class="row">
                    <div class="col-sm-12 d-flex justify-content-center">
                        <div>
                            <canvas id="store_detections" width="800px"></canvas>
                        </div>
                    </div>
                </div>-->
        <%        Chart ct = (Chart) request.getAttribute("chart");
            String[] stores = ct.getStoreName().replace("'", "").split(",");
            ArrayList<Detection> dt = (ArrayList<Detection>) request.getAttribute("detectionList");
            for (String store : stores) {
        %>
        <div class="row mt-5">
            <div class="col-12 d-flex justify-content-center">
                <h2><%= store%></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped mt-4">                    
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Cámara</th>                                
                    </tr>                    
                    <% for (Detection detect : dt) {
                            if (store.equalsIgnoreCase(detect.getStore())) {
                    %>
                    <tr>                                                        
                        <td><%= detect.getDate().split(" ")[0]%></td>
                        <td><%= detect.getDate().split(" ")[1]%></td>                        
                        <td><%= detect.getCamera()%></td>                                
                    </tr>   
                    <%      }
                        }%>

                </table>
            </div>        
        </div>       
        <% } %>
    </div>
    <button type="button" onclick="generatePDF()">Descargar</button>
</body>
<script>
    function generatePDF() {
        var opt = {
//            margin: 1,
            filename: 'myfile.pdf',
            html2canvas: {scale: 0.9},
            jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
        };
        const element = document.body;

        html2pdf()
                .set(opt)
                .from(element)
                .save();
    }
</script>
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
    <% Chart chart = (Chart) request.getAttribute("chart");
        String[] months = chart.getMonthDetection().split(",");
        String[] detections = chart.getMonthlyDetection().split(",");
        String[] dataChart = "0,0,0,0,0,0,0,0,0,0,0,0".split(",");
        for (String dx : months) {
            Integer count = 0;
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
</script>
</html>
<%  } else {
        response.sendRedirect("index.jsp");
    }%>