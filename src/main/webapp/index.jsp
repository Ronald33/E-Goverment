<%-- 
    Document   : index
    Created on : 24/06/2015, 05:56:39 AM
    Author     : Ronald
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>CodePen - Login Form</title>

    <link rel="stylesheet" href="./resources/css/login.css" media="screen" type="text/css" />

</head>

<body>
    <div>
        <%
            java.text.DateFormat fecha =    new SimpleDateFormat("dd/mm/YYYY");
        %>
        La fecha es: <%=fecha.format(new java.util.Date())%>
    </div>

  <span href="#" class="button" id="toggle-login">Log in</span>

  <div id="login" class="oculto">
  <div id="triangle"></div>
  <h1>Log in</h1>
  <form method="POST" action="Login">
    <input type="email" placeholder="Email" name="email" />
    <input type="password" placeholder="Password" name="password" />
    <input type="submit" value="Log in" />
  </form>
</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="./resources/js/login.js"></script>

</body>

</html>