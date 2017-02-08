<!DOCTYPE html>
<html lang= "es">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>App Thinking New</title>
	
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
                        <li data-toggle="modal" data-target="#myModal">
                            <a href="#"> <i class="fa fa-pencil fa-fw"></i> Crear desafío</a>
                        </li>

                      
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
                <div class="panel ">
                    <h1 class="page-header">DESAFIO</h1>
               
            	</div>
          
     	<div class="row">
            	<div class="col-lg-8">
            	
            		<div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div><div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div><div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div><div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div><div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div><div class="col-lg-4">
                    <div class="panel panel-primary">
                    
                        <div class="panel-heading">
                        <a href="desafio-actividad.jsp" style="text-decoration:none; color:white">
                            <div class="row">
                                <div class="col-xs-3" >
                                    <img src="../images/flechas.jpeg"
                            			width="60px" height="60px">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <strong>Titulo del desafio</strong>
                                    <div>Comienzo de la descripcion del desafio...</div>
                                </div>
                            </div>
                        </a>
                        </div>
                        
                            <div class="panel-footer">
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
	                         		</ul>
	                            </div>
	                    </div>
               		 </div>
               	 </div>
               	 <!-- .div fin del panel de desafios -->
               	 
               	              <!-- row Secuencias de actividades  -->	

	           <div class="col-lg-4 visible-desktop" style="float:left">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
				    			<h3 class="panel-title">Actividades</h3>
	                        </div>
	                        <div class="panel-body">
	                        	<ul class="list-group">
						    		<li  class="list-group-item">
							    		<div>
							    			<a href="#" class="pull-left"  data-toggle="modal" data-target="#modalDescIdea">
										      <img src="../images/user2.png" class="media-object img-circle" alt="imagen" WIDTH=20 HEIGHT=20>
										    </a>
						    				<h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
						       					<small>hace 18 minutos</small>
						      				</h6>
											    <h5 class="list-group-item-heading">Nombre de la idea</h6></h4>
											    <small>Nombre del desafio</small>
												<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>2</b>
												<i class="fa fa-comment-o fa-fw" align="right"></i><b>2</b>
							    		</div>
						    		</li>
						    		<li class="list-group-item">
							    		<div>
							    			<a href="#" class="pull-left"  data-toggle="modal" data-target="#modalDescIdea">
										      <img src="../images/user2.png" class="media-object img-circle" alt="imagen" WIDTH=20 HEIGHT=20>
										    </a>
						    				<h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
						       					<small>hace 18 minutos</small>
						      				</h6>
											    <h5 class="list-group-item-heading">Nombre de la idea</h6></h4>
											    <small>Nombre del desafio</small>
												<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>0</b>
												<i class="fa fa-comment-o fa-fw" align="right"></i><b>1</b>
							    		</div>
						    		</li>
						    	</ul>
	                       
	                        </div>
	                    </div>
	                </div>
               	 <!--Fin panel de notificaciones -->
               	 
               	 <div class="col-lg-4 visible-desktop" style="float:left">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
				    			<h3 class="panel-title">Tus Ideas</h3>
	                        </div>
	                        <div class="panel-body">
	                        	<ul class="list-group">
						    		<li  class="list-group-item">
							    		<div>
										    <h4 class="list-group-item-heading"><a href="#">Nombre de la idea</a></h4>
										    <small>Nombre del desafio</small><br>
											<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>2</b>
											<i class="fa fa-comment-o fa-fw" align="right"></i><b>2</b>
											<small>hace 18 minutos</small>
							    		</div>
						    		</li>
						    		<li  class="list-group-item">
							    		<div>
										    <h4 class="list-group-item-heading"><a href="#">Nombre de la idea</a></h4>
										    <small>Nombre del desafio</small><br>
											<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>2</b>
											<i class="fa fa-comment-o fa-fw" align="right"></i><b>2</b>
											<small>hace 18 minutos</small>
							    		</div>
						    		</li>
						    		<li  class="list-group-item">
							    		<div>
										    <h4 class="list-group-item-heading"><a href="#">Nombre de la idea</a></h4>
										    <small>Nombre del desafio</small><br>
											<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>2</b>
											<i class="fa fa-comment-o fa-fw" align="right"></i><b>2</b>
											<small>hace 18 minutos</small>
							    		</div>
						    		</li>
						    		<li  class="list-group-item">
							    		<div>
										    <h4 class="list-group-item-heading"><a href="#">Nombre de la idea</a></h4>
										    <small>Nombre del desafio</small><br>
											<i class="fa fa-thumbs-o-up fa-fw" align="right"></i><b>2</b>
											<i class="fa fa-comment-o fa-fw" align="right"></i><b>2</b>
											<small>hace 18 minutos</small>
							    		</div>
						    		</li>
						    		
						    	</ul>
	                       
	                        </div>
	                    </div>
	                </div>
               	 
               	 
          	 </div>
               		 
               
        </div>
 	
     	 </div>	
      </div>	
      
            
            <!-- /.row -->
      
        <!-- /#page-wrapper -->

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