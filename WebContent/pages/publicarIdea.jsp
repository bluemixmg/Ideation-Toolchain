
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CategoriaDAO" %>
<%@ page import="model.Categoria" %>
<%@ page import="model.Desafio" %>
<%@ page import="model.User" %>
<%@ page import="java.util.*" %>


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
	Desafio des = (Desafio)session.getAttribute("desafio");
	User usuario = (User)session.getAttribute("user");
	
%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<title>Publicar Idea - App Thinking</title>

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

		<!-- Barra de Navegacion -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">App Thinking</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-envelope fa-fw"></i> Bandeja de Entrada <i class="fa fa-caret-down"></i>
					</a>
					<!-- dropdown mensajes-->
					<ul class="dropdown-menu dropdown-messages">
						<li>
							<a href="#">
								<div>
									<strong>John Smith</strong>
									<span class="pull-right text-muted">
										<em>Yesterday</em>
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
										<em>Yesterday</em>
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
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a class="text-center" href="#">
								<strong>Read All Messages</strong>
								<i class="fa fa-angle-right"></i>
							</a>
						</li>
					</ul>
					<!-- /.dropdown-messages -->
				</li>
				<!-- /.dropdown notifacciones -->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-bell fa-fw"></i> Notificaciones  <i class="fa fa-caret-down"></i>
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
							<a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task
									<span class="pull-right text-muted small">4 minutes ago</span>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted
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
					<!-- /.dropdown notificaciones -->
				</li>
				<!-- /.dropdown  de usuario-->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i> <%= usuario.getUsername() %> <i class="fa fa-caret-down"></i> 
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil</a>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuración</a>
						</li>
						<li><a href="#"><i class="fa fa-question fa-fw"></i> Ayuda</a>
						</li>
						<li class="divider"></li>
						<li><a href="/LogoutServlet"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesión</a>
						</li>
					</ul>
					<!-- /.dropdown usario -->
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
							<a href="#"><i class="fa fa-home fa-fw"></i> Inicio</a>
						</li>
						<li>
							<a href=<%="/Desafio?id="+des.getId() %>><i class="fa fa-flash fa-fw"></i> Actividad del desafío</a>
						</li>
						<li>
							<a href="pages/publicarIdea.jsp"><i class="fa fa-pencil fa-fw"></i> Publicar Idea</a>
						</li>
						<li>
							<a href="/Ideas?codDes=<%=des.getId()%>"><i class="fa fa-lightbulb-o fa-fw"></i> Ver Ideas</a>
						</li>
					</ul>
					
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Mi Idea</h1>
					</div>
					<!-- /.col-lg-12 -->
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3><a href="#"><font color="white"><%= des.getTitulo() %></font></a></h3>
							</div>
							<div class="panel-body">
								<p> <%= des.getDescripcion() %></p>
							</div>
							<div class="panel-footer">
								<b><font color="#00c853">Finaliza en: <%= des.getTiempoRestante()[0]+":"+des.getTiempoRestante()[1]+":"+des.getTiempoRestante()[2] %></font></b>
							</div>
						</div>
					</div>
					<!-- /.col-lg-4 -->
					<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5>Información de la Idea</h5>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form action="/Ideas" method="post"> 
										<div class="form-group">
											<label>Título de la Idea: <font color="red">*</font></label>
											<input class="form-control" placeholder="Mi idea..." required name="titulo" id="titulo" maxlength="50">
											<p class="help-block">No debe contener más de 60 caracteres</p>
										</div>
										
										<div class="form-group">
											 <label>Descripción de la Idea: <font color="red">*</font></label>
											<textarea class="form-control" rows="3" name = "descripcion" id="descripcion" placeholder="Cuéntanos tu gran idea... " required name="descripcion" maxlength="1200"></textarea>
											<p class="help-block">No debe contener más de 1800 caracteres</p>
										</div>
										<div class="form-group">
										<% %>
											<label>Categorías: <font color="red">*</font></label>
											<select class="form-control" required name="categoria" id="categoria" multiple required>
												
												<%  CategoriaDAO daoCats = new CategoriaDAO();
													List<Categoria> lis_cat = (List<Categoria>)daoCats.RetornarCategorias();
													for (int i = 0; i < lis_cat.size(); i++) {
														Categoria cat = lis_cat.get(i);
												%>
													<option value="<%=cat.getCodigo()%>"><%=cat.getNombre() %></option>
												<%} %>
											</select>
											<p class="help-block">Puede seleccionar varias categorías</p>
										</div>
										<div class="form-group">
											<label>Palabras Clave: <font color="red">*</font></label>
											<input class="form-control" name="palabraclave" autocomplete="on" placeholder="+Tag" data-role="tagsinput">
											<p class="help-block">Separe cada palabra con una coma</p>
										</div>
										<div class="form-group">
										  <div class="checkbox">
												<label>
													<input type="checkbox" value="" checked>Al suscribirse recibirá un correo electronico de notificación para cualquier actividad generada en la idea
												</label>
											</div>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-8">
											<div align="left">
												<!--Boton para guardar un borrador-->
												<button type="submit" formmethod="post" class="btn btn-outline btn-success" formtarget="_blank"><i class="fa fa-save fa-fw"></i>Borrador</button>
											</div>

											<div align="right">
												<!--Boton para reinicar el formulario-->
												<button type="reset" class="btn btn-default"><i class="fa fa-times fa-fw"></i> Cancelar</button>
											
												<!--Boton para publicar-->
												<input type="hidden" id="codDes" name="codDes" value="<%=des.getId()%>">
												<button type="submit" class="btn btn-primary" name="Publicar" value="Publicar"><i class="fa fa-upload fa-fw"></i> Publicar</button>
											</div>	
										</div> 
										</form>
								</div>
								
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->    
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

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



