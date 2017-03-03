<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.OrganizacionDAO"%>
<%@page import="dao.EmpleadoDAO"%>
<%@page import="dao.DesafioDAO" %>
<%@page import="dao.CategoriaDAO" %>
<%@page import="dao.AreasPorEvaluadorDAO" %>
<%@page import="dao.EmpleadoDAO" %>
<%@page import="dao.PerfilDAO" %>
<%@page import="model.Desafio" %>
<%@page import="model.Empleado" %>
<%@page import="model.Categoria" %>
<%@page import="model.User" %>
<%@page import="model.AreaPericia" %>
<%@page import="model.Perfil" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>

<%-- String direccion = "C:\\Users\\jparedes\\git\\marnacin";
	UploadBean upBean = new UploadBean();
	upBean.setFolderstore(direccion);
	upBean.setWhitelist("*.jpg,*.gif,*.png");
	upBean.setOverwritepolicy("nametimestamp");
--%>

<!DOCTYPE html>
<html lang="es">

<head>

<%	 if(session.getAttribute("user") == null){
	  %>
	  <script type="text/javascript">
		window.location="pages/login.jsp";
		</script>
	  <%
	}
	User user = (User) session.getAttribute("user");
            		int tipo = user.getrol();
%>

    <!-- <meta charset="utf-8"> -->
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

    <title>Ideation - Gestión de ciclo de vida de los proyectos de innovación</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Date Picker -->
    <link href="../dist/css/datepicker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                <a class="navbar-brand" href="#">Ideation</a>
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
                        <i class="fa fa-user fa-fw"></i><%=((User) session.getAttribute("user")).getUsername() %> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/PerfilServlet"><i class="fa fa-user fa-fw"></i> Perfil de usuario</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Ajustes</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/LogoutServlet"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión</a>
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
                            <a href="Desafios"> <i class="fa fa-bullhorn fa-fw"></i> Desafíos</a>
                        </li>
                        <% if(((User) session.getAttribute("user")).getrol() == 4) {%>
                        <li data-toggle="modal" data-target="#myModal">
                            <a href="#"> <i class="fa fa-pencil fa-fw"></i> Crear desafío</a>
                        </li>
                        <% } %>
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
					<form role="form" action="/Desafios" name="upform" id="upform" enctype="multipart/form-data" method="post">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Crear desafío</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Título <font color="red">*</font></label>
								<input class="form-control" placeholder="Ingrese el título del desafío" required name="titulo" id="titulo">
							</div>
							<div class="form-group">
								<label>Imagen del desafío <font color="red">*</font></label>
								<input type="hidden" name="todo" id="todo" value="upload">
								
								<input type="file" name="inputFile" id="inputFile" required>	
							</div>
							<div class="form-group">
								<label>Descripción <font color="red">*</font></label>
								<textarea class="form-control" rows="5" placeholder="Cuéntenos en qué consiste el desafío..." required name="descripcion" id="descripcion"></textarea>
							</div>
						
							<div class="form-group col-xs-6">
								<label>Categoría <font color="red">*</font></label>
								<select class="form-control" required name="categoria" id="categoria">
									<option selected value="0">Seleccione una...</option>
									<% List<Categoria> lis_cat = (List<Categoria>)session.getAttribute("categorias");
										for (int i = 0; i < lis_cat.size(); i++) {
											Categoria cat = lis_cat.get(i);
									%>
										<option value="<%=i+1%>"><%=cat.getNombre() %></option>
									<%} %>
								</select>
							</div>
							<div class="form-group col-xs-5">
								<label>Fecha de caducidad <font color="red">*</font></label>
								
								<div class="well">
									
            						<input type="date" name="fecha" id="fecha" ><!--class="span2"-->
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
										<input type="checkbox" value="Privado" name="tipo" id="tipo">Privado
									</label>
								</div>
								<blockquote class="col-xs-9" style="">
									<small>
										Si elige <cite title="Source Title">Privado</cite>, su desafío solo será visible por los miembros de su organización.
									</small>
                     		   	</blockquote>
							</div>
							<div class="row">
								<div class="form-group col-xs-9">
									<label>Lista de evaluadores</label>
									<select multiple id="evlist" name="evlist" class="form-control">
										<% List<Perfil> perfiles = (List<Perfil>) session.getAttribute("perfiles");
											Map<String, List<AreaPericia> > areasporevaluador = (Map<String, List<AreaPericia> >) session.getAttribute("areasporevaluador");
											for(int i=0; i<perfiles.size(); i++) {
											%>
										<option id="<%=i+1 %>" name="<%=i+1 %>" value="<%=perfiles.get(i).getusername()%>"><%=perfiles.get(i).getNombres() + " " + perfiles.get(i).getApellidos() %> (<%
												for(int j=0; j<areasporevaluador.get(perfiles.get(i).getusername()).size(); j++) {
													if(j > 0) {%><%=", "%><% }%><%=areasporevaluador.get(perfiles.get(i).getusername()).get(j).getDescripcion()%><% }%>)</option>
										<%} %>
										<!--  <option value="2">María Suárez - Tecnologías de información</option>
										<option value="3">Pedro González - Leyes</option>-->
									</select>
								</div>
								
								<div class="form-group col-xs-2" style="margin-top: 3.5em;">
									<button type="button" class="btn btn-success" onclick="asignar()">Asignar &gt;&gt;</button>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-xs-2" style="margin-top: 3.5em;">
									<button type="button" class="btn btn-default" onclick="quitar()">&lt;&lt; Quitar</button>
								</div>
								
								<div class="form-group col-xs-9">
									<label>Evaluadores asignados al desafío</label>
									<select multiple id="evasig" name="evasig" class="form-control" required>
										
									</select>
								</div>
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
            <!--  <form action="/Desafios" method="post">-->
            <div class="row">
            <% System.out.println("Entró al div row"); %>
            <% List<Desafio> lis_des = (List<Desafio>)session.getAttribute("desafios");
            	Map<String, Integer> mapVot = (Map<String, Integer>)session.getAttribute("votaciones"); 
            	for (int i=0; i < lis_des.size(); i++) { 
            		System.out.println("For en el índice " + i);
            		Desafio des = new Desafio();
            		des.setId(lis_des.get(i).getId());
            		//des.setCodigo(lis_des.get(i).getCodigo());
            		//System.out.println("Asignó el código: " + des.getCodigo());
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
            		
            		Empleado emp = new Empleado();
            		if(tipo == 2 || tipo == 4) {
            			EmpleadoDAO daoe = new EmpleadoDAO();
            			emp = daoe.RetornarEmpleado(((User) session.getAttribute("user")).getEmail());
            		}
            		
            		//if(tipo == 2 || tipo == 4) {
            			//AsociadoDAO daoa = new AsociadoDAO();
            			//aso = daoa.RetornarAsociado(((User) session.getAttribute("user")).getEmail());
            		//}
            		
            		//if(!des.getTipo() || (des.getTipo() && ((tipo == 2 || tipo == 4) && aso.getRifOrganizacion() == des.getOrg()))) {
            		if(!des.getTipo() || (des.getTipo() && ((tipo == 2 || tipo == 4) && emp.getRifOrganizacion() == des.getOrg()))) {
            	%> 
                <div class="col-xs-8 col-md-6 col-lg-4" style="float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        <a href="/Desafio?id=<%=des.getId() %>" style="text-decoration:none; color:white">
                            
                            <div class = "row">
                            	<div style="margin: 0 0 0 0;position: relative; float: left; margin-left:15px; width:100px; height:100px; overflow: hidden;">
                            		
                            			<img id="imagen" src="../images/Desafios e ideas/imagen<%=i % 7 + 1 %>.png"
                            			width="100px" height="100px">
                            		
                            	</div>
                            	<div style="margin-left: 130px; margin-right: 15px;/* position:relative*/">
                            		<div style="/*position:absolute; top:50%; transform:translateY(-50%);*/">
                            			<p style="font-size:large">
                            				
                            				<%=des.getTitulo() %>
                            			</p>
                            		</div>
                            	</div>
                            </div>
                            </a>
                        </div>
                      
            
                        <div class="panel-group" id="accordion" style="margin-bottom: 0">
							<div class="panel panel-default">
								<div class="panel-body" style="background-color: #f5f5f5">
									<h4 class="panel-title">
										<!--  <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%--=i+1--%>">Descripción</a>-->
										Descripción
									</h4>
								</div>
                                <!--  <div id="collapse<%--=i+1 --%>" class="panel-collapse collapse in">-->
                                    <div class="panel-body">
                                            
                                            <%=des.getDescripcion() %>
                                    </div>
                                <!--  </div>-->
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
                        				<th class="text-center" style="font-size: 22px"><%=des.getCantIdeas() %></th>
                        				<th class="text-center" style="font-size: 22px"><%=mapVot.get("" + des.getId()) %></th>
                        				<th class="text-center" style="font-size: 22px"></th>
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
	                           				<li><%=des.getEstatusCompleto() %></li>
                        				</ul>
                        				<ul class="nav nav-pills">
                       						<li>Finaliza en:</li>
                       						<% long[] tiempoRestante = des.getTiempoRestante();
                       							String color = "green";
                       							if(tiempoRestante[0] == 0 && tiempoRestante[1] == 0 && tiempoRestante[2] == 0) 
                       								color = "red";
                       						%>
	                           				<li style="color: <%=color%>">
	                           					<%=tiempoRestante[0] + "d " %>
	                           					<%=tiempoRestante[1] + "h " %>
	                           					<%=tiempoRestante[2] + "m" %>
	                           				</li>
                           				</ul>
                        			</li>
                        			<form method="get" action="/Desafio">
                        				<input type="hidden" name="id" id="id" value="<%=des.getId()%>">
                        				<input type="submit" class="btn btn-primary" value="Ingresar">
                        			</form>
                        			
                        		</ul>
                        	</div>
                           	
                        </div>
                        </div>
                    </div>
                    
                <% }
                	} %>
                </div>
                <!--  </form>-->
                
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
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    <!-- Date Picker JavaScript -->
    <script src="../dist/js/bootstrap-datepicker.js"></script>

	<script type="text/javascript">
		var eva = document.getElementById("evlist");
		var asig = document.getElementById("evasig");
		
		function asignar() {
			for(i=0; i < eva.length; i++) {
				if(eva.options[i].selected) {
					asig.appendChild(eva.options[i]);
					i--;
				}
			}
		}
		
		function quitar() {
			for(i=0; i < asig.length; i++) {
				if(asig.options[i].selected) {
					eva.appendChild(asig.options[i]);
					i--;
				}
			}
		}
	</script>

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
