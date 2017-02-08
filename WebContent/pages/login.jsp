<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%	
	 if(session.getAttribute("user") != null){
	   	User us = new User();
	 	us= (User) session.getAttribute("user");
	 	switch(us.getTipo()){
				case 1:
					%>
					  <script type="text/javascript">
					  	window.location="/Desafios";
					  </script>
					<%
					break;
				case 2:
					%>
					  <script type="text/javascript">
					  	window.location="/Desafios";
					  </script>
					<%
				case 3: 
					%>
					  <script type="text/javascript">
					  	window.location="/EvaluadorServlet";
					  </script>
					<%
					 break;
				case 4:
					%>
					  <script type="text/javascript">
					  	window.location="/pages/perfil-organizacion.jsp"";
					  </script>
					<%
					 break;			
			}

	}
	
%>

	<title>Iniciar sesión</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <div id="wrapper">                
        <a class="navbar-brand" href="#">App Thinking</a>
    </div>

    
    <br><br>
  	<div id="page-wrapper ">
  	
		<div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
           Erro al intentar ingresar con el correo o la clave, inténtelo nuevamente.
        </div>
        
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title" align="center">INICIAR SESION</h3>
                    </div>
                    <div class="panel-body">
                    	<form action="/LoginServlet" method="POST" role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email" name="usuario" id="usuario"type="text" >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Contraseña" name="pass" type="password" id="pass">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
				  			  <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar</button><br>
				  			  <a href="#">¿Olvidaste tu contraseña?</a>
                            </fieldset>
                           </form>
                    </div>
                    <div class="panel-footer">
              		  <button href="pages/home.jsp" class="btn btn-outline btn-warning btn-block">Registrarme</button>
                    </div>
                </div>
                        
            </div>
        </div>
      </div>
    </div>


    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>