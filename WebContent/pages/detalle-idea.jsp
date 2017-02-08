<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">

<head>

	<%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Actividad de Idea - App Thinking</title>

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
	<style type="text/css">
		.chip {
		    display: inline-block;
		    padding: 0 25px;
		    height: 20px;
		    font-size: 12px;
		    line-height: 20px;
		    border-radius: 25px;
		    background-color: #f1f1f1;
		}
	</style>

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
				<!-- /.dropdown notifacciones -->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-bell fa-fw"></i> <span class="hidden-xs"> Notificaciones </span>  <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-messages">
						<li>
							<a href="#">
								<div>
									<i class="fa fa-thumbs-o-up fa-fw"></i><small> A Nombre Apellido le gusta tu idea</small>
									<span class="pull-right text-muted small"> 4 min</span>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i><small> 3 Nuevos Comentarios </small>
									<span class="pull-right text-muted small"> 12 min</small>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a class="text-center" href="#">
								<strong>Ver Todo</strong>
								<i class="fa fa-angle-right"></i>
							</a>
						</li>
					</ul>
					<!-- /.dropdown notificaciones -->
				</li>
				<!-- /.dropdown  de usuario-->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i><span class="hidden-xs"> User Name </span><i class="fa fa-caret-down"></i> 
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
					<!-- Barra de Busqueda -->
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Buscar ideas...">
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
							<a href="desafio-actividad.jsp"><i class="fa fa-flash fa-fw"></i> Actividad del desafío</a>
						</li>
						<li>
							<a href="publicarIdea.jsp" target="_blank"><i class="fa fa-pencil fa-fw"></i> Publicar Idea</a>
						</li>
						<li>
							<a href="verIdeas.jsp"><i class="fa fa-lightbulb-o fa-fw"></i> Ver Ideas</a>
						</li>
					</ul>

				</div>
				<!-- /.sidebar-collapse -->
				<hr />
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<a href="#"><font color="white">Título del Desafío</font></a>
						</div>
						<div class="panel-body">
							Contenido del Desafío
						</div>
						<div class="panel-footer" align="right">
							<i class="fa fa-thumbs-o-up fa-fw"></i><b>2</b>
						</div>
					</div>
				</div>
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header">
							<h2>Actividad de la Idea</h2>
						</div>
					</div>
				<!-- /.col-lg-12 -->    
				</div>
				 <!--/.row -->
<!-- /.col-lg-4 --> <!-- Cuerpo del detalle de la idea-->
<div class="col-lg-4">
    <div class="well well-lg">
        <div class="header">
           	<div class="media">
                <div>
                    <div>
                        <div>    
                            <div><h3 id="title-idea"><b>Título Idea</b></h3></div>
                <div>
                    <div class="col-xs-12">
                    	<h4>
                    		<a href="#">
                    			<i class="fa fa-user fa-fw img-circle"></i><strong>Autor</strong>
                    		</a><small>hace 2 días</small>
                    		<section class="pull-right">
                    			<button class="btn btn-default btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil fa-fw"></i></button>
                    			<button class="btn btn-default btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="Compartir"><i class="fa fa-share fa-fw"></i></button>
 								<button type="submit" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="bottom" title="Me Gusta">
 								<i class="fa fa-thumbs-o-up fa-fw"></i></button>
	                			<button class="btn btn-success btn-sm" type="submit"><i class="fa fa-plus-circle fa-fw"></i>Seguir</button>
                    		</section>
                    	</h4>
                    	<br>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        <!-- Palabras clave -->
                        <div>
                        	<i class="fa fa-key fa-fw"></i>
                        	<div class="chip"> keyword 1</div>
                        	<div class="chip"> keyword 2</div>
                        	<div class="chip"> keyword 3</div>
                        </div>		
<!-- Tabs para Comentarios, Informacion y Evaluacion -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                         		<li class="active"><a href="#info" data-toggle="tab">Info</a></li>
                                <li><a href="#evaluacion" data-toggle="tab">Evaluación</a></li>
                            </ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="info">
	<h5 align="center">Información</h5>
    	<button type="button" class="btn btn-primary btn-circle"><i class="fa fa-thumbs-o-up fa-fw"></i>
    	</button> <strong> 10 Me Gusta</strong>
    <hr />
    	<button type="button" class="btn btn-success btn-circle"><i class="fa fa-plus-circle fa-fw"></i>
    	</button><strong> 4 Seguidores</strong>
    <hr />
    	<button type="button" class="btn btn-default btn-circle"><i class="fa fa-comments fa-fw"></i>
    	</button> <strong> 5 Comentarios</strong>
    <hr />
    	<span>
    		<i class="fa fa-flag fa-fw"></i><strong>Estatus: </strong> Estado 1
    	</span>
    	<div class="progress progress-striped">
			<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
			</div>
		</div>
	<hr />
</div>
<!-- Fin del tab Informacion -->
<div class="tab-pane fade" id="evaluacion">
    <h5 align="center">Criterios</h5>
    <strong>Originalidad: </strong> 8
    <br>
    <strong>Factibilidad: </strong> 7
    <br>
    <strong>Impacto: </strong> 8
    <br>
    <strong>Desarrollo: </strong> 9
    <br>
    <strong>
    	Promedio:
    	<i class="fa fa-star fa-fw"></i>
    	<i class="fa fa-star fa-fw"></i>
    	<i class="fa fa-star fa-fw"></i>
    	<i class="fa fa-star fa-fw"></i>
    	<i class="fa fa-star-o fa-fw"></i>
    </strong>
</div>
<!-- Fin del tab Evaluacion -->
<!-- Seccion de comentarios -->
<div class="tab-pane fade" id="comentarios">
	<h4>Comentarios</h4>
    	<div class="col-md-12">
		  <div class="list-group">
		    <span class="list-group-item">
		      <h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       	<small>hace 20 minutos</small>
					<section class="pull-right">
						<a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
						<a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
					</section>
		      </h6>
		      <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
		      <br>
		      <br>
		    	<ul class="list-group">
		    		<li  class="list-group-item">
			    		<div>
		    				<h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       					<small>hace 18 minutos</small>
								<section class="pull-right">
									<a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
									<a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
								</section>
		      				</h6>
		      				 <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
			    		</div>
		    		</li>
		    		<li class="list-group-item">
			    		<div>
			    			<h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       					<small>hace 15 minutos</small>
								<section class="pull-right">
									<a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
									<a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
								</section>
		      				</h6>
		      				 <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
			    		</div>
		    		</li>
		    	</ul>
		    </span>
		    
		    <span class="list-group-item">
		      <h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       	<small>hace 12 minutos</small>
					<section class="pull-right">
						<a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
						<a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
					</section>
		      </h6>
		      <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
		      <br>
		      <br>
		    </span>

		    <span class="list-group-item">
		    	<div class="form-group" align="right">
			    	<textarea class="form-control" rows="1" placeholder="Escribe un comentario..." name="comentario"></textarea>
		    	</div>
		    </span>
		</div>
	</div>
</div>
<!-- /. fin de la seccion de comentarios -->
</div>
<!-- PestaÃ±as para informacion, comentarios y evaluacion -->
                        </div>
                    </div>
                	</div>
        		</div>
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
	</div>
	<!--./media-->
</div>
<!--./header -->
                        <div class="body">
		     				<div class="row">
		     					<h6>
		     						<a href="#">
		     							<i class="fa fa-bookmark fa-fw"></i> Categoría
	     							</a>    							
		     					</h6>
		     				</div>
		     				<!-- ./row -->
                        </div>
                        <!-- ./body -->
                    </div>
                    <!---./well well-lg -->
                </div>
                <!--./col-lg-4 -->
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