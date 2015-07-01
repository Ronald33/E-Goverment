<%-- 
    Document   : index
    Created on : 24/06/2015, 05:56:39 AM
    Author     : Ronald
--%>

<%@page import="model.Preferencias"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //ResultSet preferencias = (ResultSet) request.getAttribute("preferencias");
    ResultSet preferencias = Preferencias.getAll();
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <title>¡Participa!</title>
        <link rel="stylesheet" href="./resources/css/login.css" media="screen" type="text/css" />
    </head>

    <body>

        <div class="login-box">
            <div class="lb-header">
                <a href="#" class="active" id="login-box-link">Login</a>
                <a href="#" id="signup-box-link">Sign Up</a>
            </div>
            <div class="social-login">
                <a href="#">
                    <i class="fa fa-facebook fa-lg"></i>
                    Login in with facebook
                </a>
                <a href="#">
                    <i class="fa fa-google-plus fa-lg"></i>
                    log in with Google
                </a>
            </div>
            <%
                if(request.getParameter("status") != null)
                {
                    if(request.getParameter("status").equals("1"))
                    {
            %>
                    <div class="exitoso">Registro Exitoso =)</div>
            <%
                    }
                    if(request.getParameter("status").equals("2"))
                    {
            %>
                    <div class="desconocido">Usuario Desconocido =(</div>
            <%
                    }
                    if(request.getParameter("status").equals("3"))
                    {
            %>
                    <div class="ocupado">EL usuario seleccionado ya existe</div>
            <%
                    }
                }
            %>
            <form class="email-login" method="POST" action="Login">
                <div class="u-form-group">
                    <input type="text" name="usuario" placeholder="Usuario"/>
                </div>
                <div class="u-form-group">
                    <input type="password" name="contrasena" placeholder="Contraseña"/>
                </div>
                <div class="u-form-group">
                    <button>Ingresar</button>
                </div>
                <div class="u-form-group">
                    <a href="#" class="forgot-password">¿Perdiste tu contraseña?</a>
                </div>
            </form>
            <form class="email-signup" method="POST" action="Registro">
                <div class="u-form-group">
                    <input type="text" name="nombres" placeholder="Nombres"/>
                </div>
                <div class="u-form-group">
                    <input type="text" name="apellidos" placeholder="Apellidos"/>
                </div>
                <div class="u-form-group">
                    <input type="text" name="usuario" placeholder="Usuario"/>
                </div>
                <div class="u-form-group">
                    <input type="password" name="contrasena" placeholder="Contraseña"/>
                </div>
                <div class="u-form-group">
                    <input type="password" placeholder="Confirme la Contraseña"/>
                </div>
                <div class="u-form-group">
                    <input type="email" name="email" placeholder="Email"/>
                </div>
                <div>
                    <%
                    while(preferencias.next())
                    {
                        int id = preferencias.getInt("id");
                        String nombre = preferencias.getString("nombre");
                    %>
                    <div>
                        <input type="checkbox" name="preferencias" value="<%=id%>" id="<%=id%>" />
                        <label for="<%=id%>"><%=nombre%></label>
                    </div>
                    <%
                    }
                    %>
                </div>
                <div class="u-form-group">
                    <button>Registrarse</button>
                </div>
            </form>
        </div>

        <script type="text/javascript" src="./resources/vendor/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="./resources/js/login.js"></script>

    </body>

</html>