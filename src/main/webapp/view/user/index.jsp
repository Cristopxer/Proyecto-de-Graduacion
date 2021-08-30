<%-- 
    Document   : index
    Created on : Aug 26, 2021, 9:13:08 PM
    Author     : marcial
--%>

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
                    <a class="nav-link" href="#">Reportes</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="srvLog?action=logout">Salir</a>
                  </li>
                </ul>
                <span class="navbar-text">Bienvenido - ${user.userName} </span>          
              </div>
            </div>
          </nav>
    </body>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</html>
<% } else {
        response.sendRedirect("index.jsp");
    }%>