<%@page import="model.Organizacion"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DesafioDAO" %>
<%@page import="dao.CategoriaDAO" %>
<%@page import="dao.EmpleadoDAO" %>
<%@page import="model.Desafio" %>
<%@page import="model.Empleado" %>
<%@page import="model.User" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<% User usuario = (User)session.getAttribute("user");%>
<head>
	<title>Perfil Organization - App Thinking</title>

	<!-- Bootstrap Core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
</head>
<body>
	 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Organización</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
              
                <!-- /.dropdown notifications -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                      
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown Profile -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> User Organization <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> <%=usuario.getUsername() %></a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/LogoutServlet"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <!-- Campo de busqueda -->
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/pages/desa.jsp"><i class="fa fa-bullhorn fa-fw"></i> Registrar Desafío</a>
                        </li>
                     
                        <li>
                            <a href="#" data-toggle="modal" data-target="#modalEmpleado"><i class="fa fa-group fa-fw"></i> Registrar Empleado</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <h3 class="page-header">Nombre de la Organización</h3>
            </div>
            <br>
            <div class="row">
                 <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 align="center">Mi Actividad</h4>
                        </div>
                        <!-- /.panel-heading -->
<div class="panel-body">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#desafios" data-toggle="tab">Mis Desafíos</a>
        </li>
        <li><a href="#empleados" data-toggle="tab">Mis Empleados</a>
        </li>
        <li><a href="#profile" data-toggle="tab">Mi Perfil</a>
        </li>
    </ul>

    <!-- Pestañas del panel -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="desafios">
            <h5 align="center" class="text-primary">Desafíos Publicados</h5>
            <div class="row">
            	<% System.out.println("Entró al div row"); %>
            	<% String tipoPanel = "default"; %>
	            <% List<Desafio> lis_des = (List<Desafio>)session.getAttribute("desafios");
	            	for (int i=0; i < lis_des.size(); i++) { 
            			System.out.println("For en el índice " + i);
	            		Desafio des = new Desafio();
	            		des.setId(lis_des.get(i).getId());
            			des.setTitulo(lis_des.get(i).getTitulo());
		           		System.out.println("Asignó el título: " + des.getTitulo());
		           		des.setDescripcion(lis_des.get(i).getDescripcion());
		           		System.out.println("Asignó la descripción: " + des.getDescripcion());
		           		des.setFechaCaducidad(lis_des.get(i).getFechaCaducidad());
		           		System.out.println("Asignó la fecha de caducidad: " + des.getFechaCaducidad());
		           		des.setTipo(lis_des.get(i).getTipo());
		           		System.out.println("Asignó el tipo: " + des.getTipoString());
		           		des.setEstatus(lis_des.get(i).getEstatus());
		           		System.out.println("Asignó el estatus: " + des.getEstatusCompleto());
		           		des.setCantIdeas(lis_des.get(i).getCantIdeas());
		           		System.out.println("Asignó la cantidad de ideas (se muestra como string): " + des.getCantIdeas());
		           		
		           		int color = (int) Math.random()*5 + 1;
		           		
		           		switch(color) {
		           		case 1:
		           			tipoPanel = "primary";
		           			break;
		           		case 2:
		           			tipoPanel = "success";
		           			break;
		           		case 3:
		           			tipoPanel = "warning";
		           			break;
		           		case 4:
		           			tipoPanel = "danger";
		           			break;
		           		case 5:
		           			tipoPanel = "info";
		           			break;
		           		default:
		           			tipoPanel = "default";
		           		}
            	         %> 
            	         
		                <div class="col-lg-4 col-md-3">
		                    <div class="panel panel-<%=tipoPanel%>">
		                        <div class="panel-heading">
		                        <a href="/Desafio?id=<%=des.getId() %>" style="text-decoration:none; color:white">
		                            <div class="row">
		                                <div class="col-xs-3">
		                                    <i class="fa fa-puzzle-piece fa-3x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <h4><%=des.getTitulo() %></h4>  
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col-xs-12"><p align="right"><%=des.getDescripcion() %></p></div>
		                            </div>
		                            </a>
		                        </div>
		                        <a href="#">
		                            <div class="panel-footer">
<!-- 		                            <form method="get" action="/Desafio"> -->
                        				<input type="hidden" name="id" id="id" value="<%=des.getId()%>">
<!--                         				<input type="submit" class="btn btn-primary" value="Ingresar"> -->
<!-- 		                                <a class="pull-left" type="submit">Ver Detalles</span> -->
		                                <a href="/Desafio?id=<%=des.getId() %>" class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
		                                <div class="clearfix"></div>
<!-- 		                              </form> -->
		                            </div>
		                        </a>
		                    </div>
		                </div>
		                
		                <%} %>
            </div>
        </div>
        <div class="tab-pane fade" id="empleados">
            <h5 align="center" class="text-primary">Empleados</h4>
                <div class="row">
                <div class="col-lg-4 col-md-3">
                    <div class="table-responsive">
                        <table class="table table-hover">
                        <%System.out.print("Entro al jsp");
                         List<Empleado> lis_as = new ArrayList<Empleado>();
                         lis_as= (List<Empleado>)session.getAttribute("asociados");
                          %>
                            <thead>
                                <tr>
                                    <th>Nombre y Apellido</th>
                                    <th>Telefono</th>
                                    <th>Cargo</th>
                                    <th>Email</th>
                                    <th>Sociales</th>
                                    <th>Estatus</th>
                                </tr>
                            </thead>
                         <%for(int i=0 ; i<lis_as.size(); i++){ %>
                            <tbody>
                                <tr>
                                    <td><%--= lis_as.get(i).getNombres() + lis_as.get(i).getApellidos() --%></td>
                                    <td><%--=lis_as.get(i).getTelefono() --%></td>
                                    <td><%--= lis_as.get(i).getCargo() --%></td>
                                    <td><%--=lis_as.get(i).getEmail() --%></td>
                                    <td>
                                        <a class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                                        <a class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
                                    </td>
                                    <td><a class="btn btn-primary">Desafiante</a></td>
                                </tr>
                          <%} %>
                               
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /. row -->
            </div>
        </div>
        <div class="tab-pane fade" id="profile">
        <br>
        <% Organizacion org = new Organizacion();
        	org= (Organizacion) session.getAttribute("organizacion"); %>
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <img src="../images/logo_prueba.png">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="panel panel-primary">
                        <div class="list-group">
                            <div class="list-group-item">
                                <i class="fa fa-envelope fa-fw"></i> <%=org.getNombre() %> 
                            </div>
                            <div class="list-group-item">
                                <i class="fa fa-phone fa-fw"></i> <%= org.getTelefono() %>
                            </div>
                            <div class="list-group-item">
                                <i class="fa fa-location-arrow fa-fw"></i> <%=org.getDireccion() %>
                            </div>
                            <div class="list-group-item">
                                <i class="fa fa-map-marker fa-fw"></i> <%=org.getRif() %>
                            </div>
                            <div class="list-group-item">
                                <i class="fa fa-building fa-fw"></i> <%=org.getRazonSocial() %>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
      
            <div class="row">
              <div class="col-md-4">
                     <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-facebook fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <h4>100 Amigos</h4>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-twitter fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <h4>500 Seguidores</h4>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-linkedin fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <h4>800 Seguidores</h4>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3928.4467821847074!2d-69.29248753590707!3d10.062429378308236!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2sve!4v1481296380127" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
              
            </div>
            
        </div>
    </div>
</div>
<!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    
    <!-- Modal para registrar un empleado -->
    <div class="modal fade" id="modalEmpleado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Registrar Empleado</h4>
            </div>
            <div class="modal-body">
                <form action="/RegistrarAsociadoServlet" method="POST" role="form" data-toggle="validator"> 
                    <div class="col-md-6 ">                                       
                      <div class="form-group ">
                          <input class="form-control" placeholder="Elige un nombre de usuario" required name="user" id="user" maxlength="25">
                      </div>
                      <div class="form-group input-group ">
                        <span class="input-group-addon">@</span>
                        <input type="email" class="form-control" placeholder="Correo electronico" required name="email" id="email" maxlength="30" data-error="Bruh, that email address is invalid" required>
                      </div>
                      <div class="form-group ">
                        <input type="password" data-minlength="6" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required maxlength="30">
                        <div class="help-block">Minino de 6 caracteres</div>
                      </div>
                      <div class="form-group">
                        <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Vaya, éstas contraseñas no coinciden" placeholder="Confirm" required>
                        <div class="help-block with-errors"></div>
                      </div>
                      <div class="form-group ">
                          <input class="form-control" placeholder="¿Que cargo ocupa?" required name="cargo" id="cargo" maxlength="25">
                      </div>
                    </div>
              
                    <div class="col-md-6">
                      <div class="form-group">
                        <input class="form-control"  type="text" placeholder="Tu Nombre" required name="nombre" id="nombre" maxlength="30">
                      </div>
                      <div class="form-group ">
                          <input class="form-control" type="text" placeholder="Tu Apellido" required name="apellido" id="apellido" maxlength="30">
                      </div>
                      <div class="form-group">
                          <input class="form-control" type="text" placeholder="Tu Teléfono" required name="telefono" id="telefono" maxlength="15">
                      </div>
                      <div class="form-group">
                          <input class="form-control"  type="text" placeholder="Tu dirección" required name="direccion" id="direccion" maxlength="90">   
                      </div>
                      <div class="form-group">
                          <input  type="date" name="fechanacimiento">
                      </div> 
                      <div class="form-group">
                          <label>Género: </label>
                          <label class="radio-inline">
                          <input type="radio" name="genero" id="genero" value="Femenino" checked>Femenino
                          </label>
                          <label class="radio-inline">
                          <input type="radio" name="genero" id="genero" value="Masculino">Masculino
                          </label>
                      </div>
                                
                    </div> 
                    <div class="modal-footer"> 
		               <div align="center"> 
		                  <br>                          
		                  <button type="submit" class="btn btn-primary btn-md">Regístrate</button>
		                  <button type="reset" class="btn btn-default btn-md">Cancelar</button>
		                </div>   
		            </div>                               
                </form>
 
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

    <!-- Morris Charts JavaScript
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script> -->

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>