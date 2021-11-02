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
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
            integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <title>JSP Page</title>
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
    </body>
    <a href='javascript:generatePDF()' class="btn btn-primary">Descargar</a>
</html>
<script>
    function generatePDF() {
        console.log("init");
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
