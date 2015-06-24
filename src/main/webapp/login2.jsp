<%-- 
    Document   : login2
    Created on : 24/06/2015, 06:31:32 AM
    Author     : Ronald
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>CodePen - Login Form</title>

    <link rel="stylesheet" href="./resources/css/login.css" media="screen" type="text/css" />

</head>

<body>

  <span href="#" class="button" id="toggle-login">Log in</span>

  <div id="login">
  <div id="triangle"></div>
  <h1>Log in</h1>
  <form method="POST" action="Login">
    <input type="email" placeholder="Email" name="email" />
    <input type="password" placeholder="Password" name="password" />
    <input type="submit" value="Log in" />
    <div class="error">Usuario desconocido</div>
  </form>
</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="./resources/js/login.js"></script>

</body>

</html>