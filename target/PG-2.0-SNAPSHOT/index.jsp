<%-- 
    Document   : login
    Created on : Aug 26, 2021, 9:07:32 PM
    Author     : marcial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body class="background_dark_color">
        <div class="container">
            <div class="row vertical-center">
                <div class="col-sm-6 offset-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <h2 class="card-title mx-auto">Iniciar Sesion</h2>
                            </div>
                            <form action="srvLog?action=login" method="POST">
                                <div class="form-group">
                                    <label for="user" class="form-label">Usuario: </label>
                                    <input type="text" class="form-control" name="txtUser" id="txtUser"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass" class="form-label"> Contrasena: </label>
                                    <input type="password" class="form-control" name="txtPass" id="txtPass" />
                                </div>
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button type="submit" class="btn btn btn-outline-dark mt-3">
                                        Ingresar
                                    </button>
                                </div>
                            </form>
                            <%
                                if (request.getAttribute("msg") != null) {
                            %> 

                            <div class="d-flex justify-content-center">                                
                                <span class="badge badge-pill badge-warning">i: ${msg}</span>
                            </div>
                            <div class="alert alert-warning">
                                i: ${msg}
                            </div>
                            <% }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
