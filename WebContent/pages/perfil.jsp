<%@page  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Estandar" %>
<%@page import="dao.EstandarDAO" %>

<%	Estandar estandar = new Estandar();
	EstandarDAO daoEs = new EstandarDAO();
	estandar = (Estandar) session.getAttribute("estandar");
	
	System.out.println(estandar.getApellidos()  + " " + estandar.getEmail() + " " + estandar.getDireccion());
 %>

<%System.out.println("Entro al form-------------------------!!!");
	String username = request.getParameter("user"); %>
<%= username + estandar.getNombres() + estandar.getEmail() %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title><%= estandar.getNombres() + " " + estandar.getApellidos()%></title>

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
                        <i class="fa fa-user fa-fw"></i><%= estandar.getNombres() + " " + estandar.getApellidos()%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil de usuario</a>
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
                       
                        <li>
                            <a href="desafios.jsp"> <i class="fa fa-bullhorn fa-fw"></i> Desafíos</a>
                        </li>
                        <li>
                            <a href="publicarIdea.jsp"> <i class="fa fa-edit fa-fw"></i> Publicar idea</a>
                        </li>
                
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	
			<div id="page-wrapper">
			
			
				
			
		            <div class="container-fluid">
		                <div class="row">
		                    <div class="col-lg-12">
		                        <h2 class="page-header"><b><i> <%= estandar.getNombres() +" "+ estandar.getApellidos() %></i></b></h2> 
		
		    <div class="row">
		      <!-- left column -->
		      <div class="col-md-3">
		        <div class="text-center">
		          <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" class="avatar img-circle" alt="avatar">
		          <h6>Cargar nueva imagen...</h6>
		          
		          <input type="file" class="form-control">
		        </div>
		      </div>
		      <div class="container">
                
		      <!-- edit form column -->
		      <div class="col-md-8 personal-info">
		        <div class="alert alert-info alert-dismissable">
		          <a class="panel-close close">ORGANIZACIÓN</a> 
		        </div>
		        <h3>Información personal</h3>
		        
		        <form role="form" class="form-horizontal" >
		          <div class="col-md-4">                                       
               	   	<div class="form-group ">
                          <input class="form-control" placeholder="Elige un nombre de usuario" required name="user" id="user" maxlength="25" value="<% %>" disabled >
                    </div>
                   	<div class="form-group input-group ">
                        <span class="input-group-addon">@</span>
                        <input type="email" class="form-control" placeholder="Correo electronico" required name="email" id="email" maxlength="30" data-error="Bruh, that email address is invalid" required value="<%=estandar.getEmail() %>" disabled>
                     </div>
                       <div class="form-group ">
	                     <input type="password" data-minlength="6" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required maxlength="30" disabled>
	     				 <div class="help-block">Minino de 6 caracteres</div>
                       </div>
                       <div class="form-group">
                       
                          <input type="hidden" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Vaya, éstas contraseñas no coinciden" placeholder="Confirm" required disabled>
      					  <div class="help-block with-errors"></div>
                    </div>
           		 </div>
				<!-- .col-md-4 -->
				<div class="col-md-4">
					  <div class="form-group">
                         <input class="form-control"  type="text" placeholder="Tu Nombre" required name="nombre" id="nombre" maxlength="30" value="<%= estandar.getNombres()%>" disabled>   
                       
                       </div>
                       <div class="form-group ">
                          <input class="form-control" type="text" placeholder="Tu Apellido" required name="apellido" id="apellido" maxlength="30" value="<%=estandar.getApellidos()%>" disabled >
                      </div>
                      <div class="form-group">
                         <input class="form-control" type="text" placeholder="Tu Teléfono" required name="telefono" id="telefono" maxlength="15" value="<%=estandar.getTelefono() %>" disabled >
                      </div>
                     <div class="form-group">
                         <input class="form-control"  type="text" placeholder="Tu dirección" required name="direccion" id="direccion" maxlength="90" value="<%=estandar.getDireccion()%>" disabled>   
                       </div>
					<div class="form-group">
                        <input  type="date" name="fechanacimiento">
                     </div> 
				</div>
		          <div class="form-group">
		            <label class="col-md-3 control-label"></label>
		            <div class="col-md-8">
		              <input type="button" class="btn btn-primary" value="Guardar">
		              <span></span>
		              <input type="reset" class="btn btn-default" value="Cancelar">
		            </div>
		          </div>
		        </form>
		     </div>
		  </div>
		</div>

		                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
	
	</div>

</body>
</html>