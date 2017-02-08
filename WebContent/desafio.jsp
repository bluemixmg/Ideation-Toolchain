<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>App Thinking - Gestión de ciclo de vida de los proyectos de innovación</title>

    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Date Picker -->
    <link href="./dist/css/datepicker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div id="wrapper">



 <a href="pages/registrarUsuarioEmpleado.jsp"><i class="fa fa-dashboard fa-fw"></i> Registrar Empleado</a>
 <a href="pages/registrarUsuarioEstandar.jsp"><i class="fa fa-dashboard fa-fw"></i> Registrar Usuario Estandar </a>
 <a href="pages/registrarUsuarioEvaluador.jsp"><i class="fa fa-dashboard fa-fw"></i> Registrar Evaluador </a>
 <a href="pages/registrarUsuarioOrganizacion.jsp"><i class="fa fa-dashboard fa-fw"></i> Registrar Organizacion </a>
 <a href="pages/login.jsp"><i class="fa fa-dashboard fa-fw"></i> Go to Login </a>
 
  <a href="pages/calideas.jsp"><i class="fa fa-dashboard fa-fw"></i> Prueba Erika </a>
  <a href="pages/profile.jsp"><i class="fa fa-dashboard fa-fw"></i> Prueba perfil </a>

 


        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">App Thinking</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>Bandeja de entrada <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Ayer</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Ayer</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Ayer</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Leer todos los mensajes</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    
                </li> -->
                <!-- /.dropdown -->
                <!-- <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>Bandeja de entrada <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    
                </li> -->
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>Notificaciones <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> Nuevo Comentario
                                    <span class="pull-right text-muted small">Hace 4 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 nuevos seguidores
                                    <span class="pull-right text-muted small">Hace 12 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Mensaje enviado
                                    <span class="pull-right text-muted small">Hace 4 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> Nueva tarea
                                    <span class="pull-right text-muted small">Hace 4 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Servidor reiniciado
                                    <span class="pull-right text-muted small">Hace 4 minutos</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Ver todas las notificaciones</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>John Smith <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="pages/profile.jsp"><i class="fa fa-user fa-fw"></i> Perfil de usuario</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Ajustes</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión</a>
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
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Buscar...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-home fa-fw"></i> Inicio</a>
                        </li>
                        <!-- <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.jsp">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.jsp">Morris.js Charts</a>
                                </li>
                            </ul>
                            
                        </li> -->
                        <li>
                            <a href="desafios.jsp"> <i class="fa fa-bullhorn fa-fw"></i> Desafíos</a>
                        </li>
                        <li data-toggle="modal" data-target="#myModal">
                            <a href="#"> <i class="fa fa-pencil fa-fw"></i> Crear desafío</a>
                        </li>
                        <!-- <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.jsp">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.jsp">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.jsp">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.jsp">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.jsp"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.jsp">Grid</a>
                                </li>
                            </ul>
                            
                        </li> -->
                        <!-- <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    
                                </li>
                            </ul>
                            
                        </li>-->
                        <!-- <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.jsp">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.jsp">Login Page</a>
                                </li>
                            </ul>
                            
                        </li> -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form role="form">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Crear desafío</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Título</label>
								<input class="form-control" placeholder="Ingrese el título del desafío" required>
							</div>
							<div class="form-group">
								<label>Imagen del desafío</label>
								<input type="file">
							</div>
							<div class="form-group">
								<label>Descripción</label>
								<textarea class="form-control" rows="5" placeholder="Cuéntenos en qué consiste el desafío..." required></textarea>
							</div>
						
							<div class="form-group col-xs-6">
								<label>Categoría</label>
								<select class="form-control" required>
									<option selected value="0">Seleccione una...</option>
									<option value="1">Categoría 1</option>
									<option value="2">Categoría 2</option>
									<option value="3">Categoría 3</option>
									<option value="4">Categoría 4</option>
									<option value="5">Categoría 5</option>
								</select>
							</div>
							<div class="form-group col-xs-5">
								<label>Fecha de caducidad</label>
								
								<div class="well">
									
            						<input type="text" class="span2"  id="dpd1">
									<!--  <input type="date" min="" class="span2" value="12-02-2008" id=""> -->
			  						 <!-- <div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
										<input class="span2" size="16" type="text" value="12-02-2012" readonly>
										<span class="add-on"><i class="icon-calendar"></i></span>
			  						</div>  -->
								</div>
								
								<!--  <div class=" input-group">
									<input type="number" min="1" class="form-control" required>
									<span class="input-group-addon">días</span>
								</div> -->
							</div>
							<div class="row"></div>
							<div class="nav-pills">
								<div class="checkbox col-xs-3">
									<label>
										<input type="checkbox" value="">Privado
									</label>
								</div>
								<blockquote class="col-xs-9" style="">
									<small>
										Si elige <cite title="Source Title">Privado</cite>, su desafío solo será visible por los miembros de su organización.
									</small>
                     		   	</blockquote>
							</div>
						</div>
						
						<div class="row"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" formmethod="post" class="btn btn-primary">Save changes</button>
						</div>
					</form>
					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
			
		</div>
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Desafíos</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <form action="MiDesafioServlet" method="post" name="form1" id="form1">
            <div class="row">
            <%-- List<Desafio> lis_des = (List<Desafio>)request.getAttribute("lista_desafios"); --%>
            <p>
            	<%-- System.out.println("Tamaño del arreglo = " + lis_des.size());--%>
            	<%--= lis_des.size() --%>
            	
            </p>
            <% for (int i=0; i < 4; i++) { %>
            <p>Ciclo for
            	<%String str = request.getAttribute("lista_desafios").toString(); %> 
            	<%=str %>
            </p>
            <%} %>
            	<%--Desafio des = lis_des.get(i); %> 
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div style="margin: 0 0 0 0;position: relative; float: left; margin-left:15px; width:100px; height:100px; overflow: hidden;">
                            		
                            			<img src="./images/flechas.jpeg"
                            			width="100px" height="100px">
                            		
                            	</div>
                            	<div style="margin-left: 130px; margin-right: 15px">
                            		<div>
                            			<p style="font-size:large">Titulo<%--= des.getTitulo() %></p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Descripción</a>
									</h4>
								</div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            <%--= des.getDescripcion() %>
                                            Descripción
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        			
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div>
                <%--}--%>
                <!-- /.col-lg-4 -->
                <!-- <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        	<a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div class="col-xs-3">
	                            		<img src="../images/escalar.jpg"
                            			width="100px" height="100px">
                            	</div>
                            	<div class="col-xs-9">
                            		<div>
                            			<p style="font-size:large; margin-left: 2em">Y en este texto, tú podrás encontrar no más de 60 caracteres</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Descripción</a>
									</h4>
								</div>
                                <div id="collapseTwo" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            Esta es la descripción completa del desafío propuesto
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        	<a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div class="col-xs-3">
                            			<img src="../images/cerebro.png"
                            			width="100" height="100">
                            	</div>
                            	<div class="col-xs-9">
                            		<div>
                            			<p style="font-size:large; margin-left: 2em">Y en este texto, tú podrás encontrar no más de 60 caracteres</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Descripción</a>
									</h4>
								</div>
                                <div id="collapseThree" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            Esta es la descripción completa del desafío propuesto
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div>
            
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        	<a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div style="position: relative; float: left; margin-left:15px; width:100px; height:100px; overflow: hidden;">
                            			<img src="../images/rubik.png"
                            			width="100px" height="100px">
                            	</div>
                            	<div style="margin-left: 130px; margin-right: 15px">
                            		<div>
                            			<p style="font-size:large">Y en este texto, tú podrás encontrar no más de 60 caracteres</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Descripción</a>
									</h4>
								</div>
                                <div id="collapseFour" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            Esta es la descripción completa del desafío propuesto
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        	<a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div class="col-xs-3">
                            			<img src="../images/rompecabezas.png"
                            			width="100px" height="100px">
                            	</div>
                            	<div class="col-xs-9">
                            		<div>
                            			<p style="font-size:large; margin-left: 2em">Y en este texto, tú podrás encontrar no más de 60 caracteres</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Descripción</a>
									</h4>
								</div>
                                <div id="collapseFive" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            Esta es la descripción completa del desafío propuesto
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        	<a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class = "row">
                            	<div class="col-xs-3">
                            			<img src="../images/innovacion-empresarial.jpg"
                            			width="100" height="100">
                            	</div>
                            	<div class="col-xs-9">
                            		<div>
                            			<p style="font-size:large; margin-left: 2em">Y en este texto, tú podrás encontrar no más de 60 caracteres</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Descripción</a>
									</h4>
								</div>
                                <div id="collapseSix" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                            Esta es la descripción completa del desafío propuesto
                                    </div>
                                </div>
							</div>
						</div>
                        <div class="panel-body">
                        	<table class="table" style="margin-bottom: 0">
                        		<thead>
                        			<tr>
                        				<th class="text-center">Ideas</th>
                        				<th class="text-center">Votos</th>
                        				<th class="text-center">Comentarios</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        				<th class="text-center" style="font-size: 22px">+1000</th>
                        			</tr>
                        		</tbody>
                        	</table>
                        </div>
                        <div class="panel-footer">
                        	<div align="right">
                        		<ul class="nav nav-pills">
                        			<li>
                        				<ul class="nav nav-pills">
                        					<li>Etapa:</li>
	                           				<li>En evaluación</li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
	                           				<li style="color: green">24d 12h 40m</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="desafio-actividad.jsp">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        		</ul>
                        	</div>
                           	
                        </div>
                    </div>
                </div> -->
                <!-- /.col-lg-4 -->
            </div>
            </form>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="./vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./dist/js/sb-admin-2.js"></script>
    
    <!-- Date Picker JavaScript -->
    <script src="./dist/js/bootstrap-datepicker.js"></script>

	<script type="text/javascript">
		var nowTemp = new Date();
		var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
 
		var checkin = $('#dpd1').datepicker({
  			onRender: function(date) {
    		return date.valueOf() < now.valueOf() ? 'disabled' : '';
  			}
		}).on('changeDate', function(ev) {
  			if (ev.date.valueOf() > checkout.date.valueOf()) {
    			var newDate = new Date(ev.date)
    			newDate.setDate(newDate.getDate() + 1);
    			checkout.setValue(newDate);
  			}
  			checkin.hide();
  			$('#dpd2')[0].focus();
			}).data('datepicker');
			
		var checkout = $('#dpd2').datepicker({
  				onRender: function(date) {
    				return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
  				}
			}).on('changeDate', function(ev) {
  			checkout.hide();
				}).data('datepicker');
		
	</script>
</body>
</html>