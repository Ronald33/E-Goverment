<%-- 
    Document   : dashboard
    Created on : 30/06/2015, 01:03:44 PM
    Author     : Ronald
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="model.Publicacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet publicaciones = null;
    try
    {
        publicaciones = Publicacion.getPublicacionesSeguidores(1);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>¡Participa!</title>
        <meta name="description" content="Una Red Social para los ciudadanos Peruanos" />
        <!-- templatemo 411 dragonfruit -->
        <meta name="author" content="Ronald">
        <!-- Favicon-->
        <!--<link rel="shortcut icon" href="./favicon.png" />-->
        <link href="./resources/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./resources/css/camera.css" rel="stylesheet" />
        <link href="./resources/css/templatemo_style.css" media="screen" type="text/css" rel="stylesheet" />
        <link href="./resources/css/login.css" media="screen" type="text/css" rel="stylesheet" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!--<div class="banner" id="templatemo_banner_slide">
            <ul>
                <li class="templatemo_banner_slide_01">
                    <div class="slide_caption">
                        <h1>Responsive Design</h1>
                        <p>Aenean diam libero, venenatis eu risus eu, tincidunt porttitor orci. Nulla consequat mi et lectus vehicula condimentum. Nulla ullamcorper dolor vehicula dolor interdum, eget fermentum ligula bibendum.</p>
                    </div>
                </li>
                <li class="templatemo_banner_slide_02">
                    <div class="slide_caption">
                        <h1>Free HTML5 Template</h1>
                        <p>Dragonfruit is one of free HTML5 website templates from templatemo. Donec quam neque, porta at pellentesque at, imperdiet ut velit. Pellentesque luctus ac nunc et hendrerit. Aliquam eu scelerisque eros. Vestibulum scelerisque mi nec augue condimentum rhoncus.</p>
                    </div>
                </li>
                <li class="templatemo_banner_slide_03">
                    <div class="slide_caption">
                        <h1>Mobile Ready</h1>
                        <p>Cras fermentum convallis elementum. Praesent sit amet auctor erat, vitae auctor dolor. Sed viverra nunc magna, quis placerat augue pellentesque quis. Sed nec pellentesque dolor. Aenean in lectus enim. Phasellus eu egestas libero. Vivamus ultrices ligula a dapibus lobortis.</p>
                    </div>
                </li>
            </ul>
        </div>-->

        <div id="templatemo_mobile_menu">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#testimonial_text_wap"><i class="glyphicon glyphicon-home"></i> &nbsp; Home</a></li>
                <li><a href="#templatemo_about"><i class="glyphicon glyphicon-briefcase"></i> &nbsp; Grupos</a></li>
                <li><a href="#templatemo_events"><i class="glyphicon glyphicon-bullhorn"></i> &nbsp; Gobiernos</a></li>
                <li><a href="#templatemo_timeline"><i class="glyphicon glyphicon-calendar"></i> &nbsp; Timeline</a></li>
                <li><a rel="nofollow" href="http://www.google.com" class="external-link"><i class="glyphicon glyphicon-export"></i> &nbsp; External</a></li>
                <li><a href="#templatemo_contact"><i class="glyphicon glyphicon-phone-alt"></i> &nbsp; Publicar</a></li>
            </ul>
        </div>

        <div class="container_wapper">
            <div id="templatemo_banner_menu">
                <div class="container-fluid">
                    <div class="col-xs-4 templatemo_logo">
                        <a href="#">
                            <!--<img src="./images/templatemo_logo.jpg" id="logo_img" alt="dragonfruit website template" title="Dragonfruit Template" />-->
                            <h1 id="logo_text">¡Participa! <span><%=session.getAttribute("nombres")%></span></h1>
                        </a>
                    </div>
                    <div class="col-sm-8 hidden-xs">
                        <ul class="nav nav-justified">
                            <li><a href="#testimonial_text_wap">Home</a></li>
                            <li><a href="#templatemo_about">Grupos</a></li>
                            <li><a href="#templatemo_events">Gobiernos</a></li>
                            <li><a href="#templatemo_timeline">Timeline</a></li>
                            <li><a rel="nofollow" href="http://www.google.com" class="external-link">External</a></li>
                            <li><a href="#templatemo_contact">Publicar</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-8 visible-xs">
                        <a href="#" id="mobile_menu"><span class="glyphicon glyphicon-th-list"></span></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="templatemo_about" class="container_wapper">
            <div class="container-fluid">
                <h1>Tus Grupos</h1>
                <div class="col-sm-6 col-md-3 about_icon">
                    <div class="imgwap mission"><i class="fa fa-rocket"></i></div>
                    <h2><a href="#">Revenues</a></h2>
                    <p>Sed do eiusmod tempor incididunt ut labore et.</p>
                </div>
                <div class="col-sm-6 col-md-3 about_icon">
                    <div class="imgwap product"><i class="fa fa-cubes"></i></div>
                    <h2>Opportunities</h2>
                    <p>Tempor incididunt ut labore et dolore magna.</p>
                </div>
                <div class="col-sm-6 col-md-3 about_icon">
                    <div class="imgwap testimonial"><i class="fa fa-bar-chart-o"></i></div>
                    <h2>Growth</h2>
                    <p>Dolore magna aliqua. Ut enim ad minim veniam.</p>
                </div>
                <div class="col-sm-6 col-md-3 about_icon">
                    <div class="imgwap statistic"><i class="fa fa-comments"></i></div>
                    <h2>Social Media</h2>
                    <p>Aliqua. Ut enim ad minim veniam, quis nostrud aliqua.</p>
                </div>
                <h1 id="a-quien-seguir">A quien seguir</h1>
                <div class="clearfix testimonial_top_bottom_spacer"></div>
                <div class="col-xs-1 pre_next_wap" id="prev_testimonial">
                    <a href="#"><span class="glyphicon glyphicon-chevron-left pre_next"></span></a>
                </div>
                <div id="testimonial_text_wap" class="col-xs-9 col-sm-10">
                    <div class="testimonial_text">
                        <div class="col-sm-3">
                            <img src="./resources/images/templatemo_member_01.jpg" class="img-responsive" alt="Business Development Manager" />
                        </div>
                        <div class="col-sm-9">
                            <h2>Tracy Mya</h2>
                            <!--<h3>Business Development Manager</h3>-->
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        </div>
                    </div><!--.testimonial_text-->
                    <div class="testimonial_text">
                        <div class="col-sm-3">
                            <img src="./resources/images/templatemo_member_02.jpg" class="img-responsive" alt="Chief Public Relation Officer" />
                        </div>
                        <div class="col-sm-9">
                            <h2>Mary Kas</h2>
                            <h3>Chief Public Relation Officer</h3>
                            <p>Fusce et orci mollis, congue lorem vitae, semper erat. Curabitur quis pellentesque nisl, at adipiscing libero. Integer at sem dui. Fusce posuere aliquet dolor, at viverra odio accumsan sed. Sed pharetra vel risus a convallis. Maecenas in adipiscing libero, id molestie odio. Phasellus id pharetra mauris, sit amet varius velit. Aliquam non dapibus libero.</p>
                        </div>
                    </div><!--.testimonial_text-->
                    <div class="testimonial_text">
                        <div class="col-sm-3">
                            <img src="./resources/images/templatemo_member_03.jpg" class="img-responsive" alt="Marketing Executive" />
                        </div>
                        <div class="col-sm-9">
                            <h2>Julia Pan</h2>
                            <h3>Marketing Executive</h3>
                            <p>Maecenas nec rhoncus orci. Morbi tempus ut leo ac varius. Cras convallis sagittis dignissim. Aenean diam libero, venenatis eu risus eu, tincidunt porttitor orci. Nulla consequat mi et lectus vehicula condimentum. Nulla ullamcorper dolor vehicula dolor interdum, eget fermentum ligula bibendum. Sed vel dolor libero.</p>
                        </div>
                    </div><!--.testimonial_text-->
                    <div class="testimonial_text">
                        <div class="col-sm-3">
                            <img src="./resources/images/templatemo_member_04.jpg" class="img-responsive" alt="Chief Executive Officer" />
                        </div>
                        <div class="col-sm-9">
                            <h2>Linda Von</h2>
                            <h3>Chief Executive Officer</h3>
                            <p>Donec lacinia erat quis venenatis varius. Suspendisse non turpis vitae libero interdum lacinia. Nulla in nibh arcu. Donec quam neque, porta at pellentesque at, imperdiet ut velit. Pellentesque luctus ac nunc et hendrerit. Aliquam eu scelerisque eros. Vestibulum scelerisque mi nec augue condimentum rhoncus.</p>
                        </div>
                    </div><!--.testimonial_text-->        </div><!--#testimonial_text_wap-->
                <div class="col-xs-1 pre_next_wap" id="next_testimonial">
                    <a href="#"><span class="glyphicon glyphicon-chevron-right pre_next"></span></a>
                </div>
                <div class="clearfix testimonial_top_bottom_spacer"></div>
            </div>
        </div><!--templatemo_about-->
        <div id="templatemo_events" class="container_wapper">
            <div class="container-fluid">
                <h1>Gobiernos</h1>
                <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-0">
                    <div class="event_box_wap event_animate_left">
                        <div class="event_box_img">
                            <img src="./resources/images/templatemo_event_01.jpg" class="img-responsive" alt="Web Design Trends" />
                        </div>
                        <div class="event_box_caption">
                            <h1>Gobierno Regional de Puno</h1>
                            <p><span class="glyphicon glyphicon-map-marker"></span> 4 mensajes sin leer &nbsp;&nbsp;
                                <span class="glyphicon glyphicon-time"></span> Ultima publicación: hace 15 minutos</p>
                            <p>Quisque feugiat dapibus lectus ut consectetur. Donec et ante vitae leo cursus hendrerit vitae ac mauris. Suspendisse dictum pretium urna quis rutrum. Nullam tincidunt dolor ut leo malesuada, eget volutpat turpis porttitor.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-0">
                    <div class="event_box_wap event_animate_right">
                        <div class="event_box_img">
                            <img src="./resources/images/templatemo_event_02.jpg" class="img-responsive" alt="Free Bootstrap Seminar" />
                        </div>
                        <div class="event_box_caption">
                            <h1>Free Bootstrap Seminar</h1>
                            <p><span class="glyphicon glyphicon-map-marker"></span> Digital Hall, Yangon, Myanmar &nbsp;&nbsp; <span class="glyphicon glyphicon-time"></span> 10:30 AM to 3:30 PM </p>
                            <p>Vestibulum dapibus dolor porttitor urna pretium euismod. Aliquam lobortis enim at lacinia mollis. Curabitur eget sem eros. Duis pulvinar rhoncus lectus, ac hendrerit enim pharetra et.</p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-0">
                    <div class="event_box_wap event_animate_left">
                        <div class="event_box_img">
                            <img src="./resources/images/templatemo_event_03.jpg" class="img-responsive" alt="" />
                        </div>
                        <div class="event_box_caption">
                            <h1>Mobile Designs</h1>
                            <p><span class="glyphicon glyphicon-map-marker"></span> Old Town Center, Mandalay, Myanmar &nbsp;&nbsp; <span class="glyphicon glyphicon-time"></span> 3:30 PM to 6:30 PM </p>
                            <p>Etiam ac ante gravida, pellentesque odio non, facilisis dui. Suspendisse vestibulum justo quis sapien sodales, in pellentesque erat congue.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-0">
                    <div class="event_box_wap event_animate_right">
                        <div class="event_box_img">
                            <img src="./resources/images/templatemo_event_04.jpg" class="img-responsive" alt="" />
                        </div>
                        <div class="event_box_caption">
                            <h1>Happy Startups</h1>
                            <p><span class="glyphicon glyphicon-map-marker"></span> New Hat, Lashio, Myanmar &nbsp;&nbsp; <span class="glyphicon glyphicon-time"></span> 2:15 PM to 5:15 PM </p>
                            <p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc rutrum urna eget augue placerat sodales. Mauris ut dapibus nisi, eget fringilla lectus.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="templatemo_timeline" class="container_wapper">
            <h1>Timeline</h1>
            <div class="container-fluid">
                <%
                while(publicaciones.next())
                {
                    int publ_id = publicaciones.getInt("publ_id");
                    int usua_id = publicaciones.getInt("usua_id");
                    String titulo = publicaciones.getString("titulo");
                    String contenido = publicaciones.getString("contenido");
                    String fecha = publicaciones.getString("fecha");
                    String nombres = publicaciones.getString("nombres");
                %>
                <div class="time_line_wap">
                    <div class="time_line_caption"><div><%=fecha%></div></div>
                    <div class="time_line_paragraph">
                        <h1><a href="/VerPublicacion/<%=publ_id%>"><div><%=titulo%></div></a></h1>
                        <p>
                            <span class="glyphicon glyphicon-user"></span> <a href="/Ver/Usuario/<%=usua_id%>"><%=nombres%></a> &nbsp;&nbsp;
                            <span class="glyphicon glyphicon-bookmark"></span> <a href="#">Gobierno Regional</a>, 
                            <a href="#">Huelgas</a> &nbsp;&nbsp;
                            <span class="glyphicon glyphicon-edit"></span> <a href="#">0 comentarios</a>
                        </p>
                        <p><div><%=contenido%></div></p>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </div>
        <div id="templatemo_contact" class="container_wapper">
            <div class="container-fluid">
                <h1 id="title-publicar">Publicar</h1>
                <form action="Publicar" method="post" class="col-md-12">
                    <div class="row">	
                        <div class="col-md-12">
                            <p>Titulo</p>
                            <input type="text" name="titulo" id="titulo" placeholder="Titulo" />
                        </div>
                        <div class="col-md-12">
                            <p>Mensaje</p>
                            <textarea name="mensaje" id="mensaje"  placeholder="Escribe tu mensaje aqui ..."></textarea>
                        </div>
                        <div class="col-xs-6 col-sm-3 col-md-offset-6">
                            <button type="submit">Enviar</button>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <button type="reset">Limpiar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="templatemo_footer">
            <div>
                <p id="footer">Copyright &copy; 2015 Tecnología de Objetos - Web</p>
            </div>
        </div>
        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/jquery-ui.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        <script src="./resources/js/jquery.singlePageNav.min.js"></script>
        <script src="./resources/js/unslider.min.js"></script>
        <script src="./resources/js/templatemo_script.js"></script>
    </body>
</html>