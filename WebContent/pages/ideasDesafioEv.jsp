<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="model.Desafio" %>
<%@page import="model.Idea" %>
<%@page import="java.util.*" %>
    
<!DOCTYPE html>

<html lang="es">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Ideas de desafío</title>
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
	
	  .panel > .panel-heading {
          color: #333;
          background-image: none;
          background-color: #d9edf7;
          border-color: #ddd;
         }
         
         .panel-red > .panel-heading {
          border-color: #d9534f;
          color: white;
          background-color: #d9534f;
          }
          
          .panel-yellow > .panel-heading {
          border-color: #f0ad4e;
          color: white;
          background-color: #f0ad4e;
          }
          
          .panel-green > .panel-heading {
          border-color: #5cb85c;
          color: white;
          background-color: #5cb85c;
          }
          
          .panel-primary>.panel-heading {
          color: #fff;
          background-color: #337ab7;
          border-color: #337ab7;
          }
          
          .rating {
           float:left;
          }

          .rating:not(:checked) > input {
           position:absolute;
           top:-9999px;
           clip:rect(0,0,0,0);
           }

          .rating:not(:checked) > label {
           float:right;
           width:0.9em;
           padding:0 .1em;
           overflow:hidden;
           white-space:nowrap;
           cursor:pointer;
           font-size:160%;
           line-height:1.2;
           color:#ddd;
           text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
           }

          .rating > input:checked ~ label {
           color: #f70;
           text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
            }

           .rating:not(:checked) > label:hover,
           .rating:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
            }

           .rating > input:checked + label:hover,
           .rating > input:checked + label:hover ~ label,
           .rating > input:checked ~ label:hover,
           .rating > input:checked ~ label:hover ~ label,
           .rating > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
            }

           .rating > label:active {
            position:relative;
            top:2px;
            left:2px;
            }
            .img.img-circle {
             border-radius: 0%;
             width: 100%;
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
				<a class="navbar-brand" href="index.jsp">Marna CIN</a>
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
									<span class="pull-right text-muted small"> 12 minutos</small>
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
			
			<% Desafio des = (Desafio)session.getAttribute("desafio"); %>

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
					<!-- Barra de Busqueda -->
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Buscar empresa...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
						</li>
						<li>
							<a href="pages/Home.jsp"><i class="fa fa-home fa-fw"></i> Inicio</a>
						</li>
						<li>
							<a href="/Desafio?id=112"><i class="fa fa-flash fa-fw"></i> Actividad del desafío</a>
						</li>
						<li>
							<a href="/Ideas?id=112"><i class="fa fa-lightbulb-o fa-fw"></i> Ver Ideas</a>
						</li>
					</ul>

				</div>
				<!-- /.sidebar-collapse -->
				<hr />
				
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		
	 <!-- Page Content -->
	<div id="page-wrapper">	
	
	
	 <!-- Modal -->
	                            <div class="modal fade" id="modalDescIdea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog modal-lg">
	                                
	                                    <div class="modal-content col-xs-12 col-md-12">    
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													
	                                            <h3 class="modal-title" id="myModalLabel"></h3>
	                                        </div>
	                                        <!-- /.modal-header -->
	                                        <div class="modal-body">
		                                        <div class="col-xs-12 col-sm-6 col-md-8">

		                                        	<h4>
		                                        		<a href="#">
		                                        			<i class="fa fa-user fa-fw img-circle"></i><strong>Autor</strong>
		                                        		</a>en <a href="#"> <small>Categoría</small></a>
		                                        		<section class="pull-right">
		                                        			<button class="btn btn-default btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="Compartir"><i class="fa fa-share fa-fw"></i></button>
		                                        			<button class="btn btn-success btn-sm" type="submit"><i class="fa fa-plus-circle fa-fw"></i>Guardar evaluacion</button>
		                                        		</section>
		                                        	</h4>
		                                        	<br>
		                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		                                            <div>
		                                            	<i class="fa fa-key fa-fw"></i>
		                                            	<div class="chip"> Key 1</div>
		                                            	<div class="chip"> Key 2</div>
		                                            	<div class="chip"> Key 3</div>
		                                            </div>
		                                            <br>
		                                           <form role="form" action="/Evaluacion">
		                                            <div class="row col-sm-12">
		                                             <div class="col-sm-2">
		                                               <b>Impacto:</b>
		                                             </div>
		                                             <div class="col-sm-10">
		                                               <fieldset class="rating">
                                                         <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                                         <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                                                         <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                                                         <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                                                       </fieldset>  
		                                             </div>
		                                             <br>
		                                            </div>
		                                            <br><br>
		                                            <div class="row col-sm-12">
		                                             <div class="col-sm-3">
		                                               <b>Factibilidad:</b>
		                                             </div>
		                                             <div class="col-sm-9">
		                                              <fieldset class="rating">
                                                         <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                                         <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                                                         <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                                                         <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                                                       </fieldset>
		                                             </div>
		                                             <br>
		                                            </div>
		                                            <br><br>
		                                            <div class="row col-sm-12">
		                                             <div class="col-sm-2">
		                                               <b>Detalle:</b>
		                                             </div>
		                                             <div class="col-sm-10">
		                                              <textarea rows="5" cols="50" id="detalle">                                                      
                                                      </textarea>
		                                             </div>
		                                            </div>
		                                            <br><br>
		                                            <div class="row col-sm-12">
		                                            <div class="col-sm-2"></div>
		                                            <div class="col-sm-10">
		                                            <br><br>
		                                            	<button class="btn btn-success btn-sm" type="submit" formmethod="post"><i class="fa fa-plus-circle fa-fw"></i>Guardar evaluacion</button>
		                                            	</div>
		                                            </div>
		                                           </form>		                                          
		                                            <br>		
		                                            <div class="panel-body">
							                            <!-- Nav tabs -->
							                            <ul class="nav nav-tabs">
							                                <li><a href="#comentarios" data-toggle="tab">Comentarios</a>
							                                </li>
							                            </ul>
						                                <div class="tab-content">
						                                	<div class="tab-pane fade" id="comentarios">
	
					                                    	<a href="#"><h4>Ver todos</h4></a>
	                                                        <!-- Seccion de comentarios -->
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
						                                </div>
						                            </div>
		                                        </div>
		                                        <div class="col-xs-12 col-sm-6 col-md-4">
			                                         <div class="panel-body">
							                            <!-- Nav tabs -->
							                            <ul class="nav nav-tabs">
							                                <li class="active"><a href="#info" data-toggle="tab">Info</a>
							                                </li>
							                                <li><a href="#evaluacion" data-toggle="tab"></a>
							                                </li>
							                            </ul>

							                            <!-- Tab panes -->
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
							                                    <h5 align="center"></h5>
							                                    <strong></strong> 
							                                    <br>
							                                    <strong></strong> 
							                                    <br>
							                                    <strong></strong>
							                                    <br>
							                                    <strong></strong>
							                                    <br>
							                                    <strong>
							                                    	
							                                    </strong>
							                                </div>
							                                <!-- Fin del tab Evaluacion -->
							                            </div>
							                            <!-- Fin del tab -->
							                        </div>
							                        <!-- /.panel-body -->
		                                        </div>
                                        	</div>
                                        	<!-- /.modal-body -->
                                		</div>
                                    	<!-- /.modal-content -->
	                                
	                                </div>
	                                <!-- /.modal-dialog -->
	                            </div>
	                            <!-- /.modal -->
	 
	  
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" ><%=des.getTitulo() %></h1>
                </div>
                
        </div>
        
        <div class="row"> <!-- This row works as the overflow auto -->
        <div class="row col-sm-12">        
          <div class="col-sm-6">
           <div>
           <% int num = (int) (Math.random() * 7 + 1); %>
			<img src="../images/Desafios e ideas/imagen<%=num %>.png" 
			style="opacity: 0.6; filter: alpha(opacity=60); width: 80%; height:300px; margin-left: 40px">
		   </div>
          </div>
          <div class="col-sm-6">
            
                   <div class="panel panel-default" style="width: 100%">
                        <div class="panel-heading">
                            Informacion del desafio
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Descripcion</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Justificacion</a>
                                </li>
                                <li><a href="#messages" data-toggle="tab">Importancia</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">Impacto</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <h4>Descripcion del desafio</h4>
                                    <p><%=des.getDescripcion() %></p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Justificacion del desafio</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>Importancia del desafio</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>Impacto del desafio</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>             
            
             </div>        
           </div>
        
        <div class="row col-sm-12">
        <div class="col-sm-3">
          <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-graduation-cap fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><%=des.getCantIdeas() %></div>
                                    <div>Ideas</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Ver</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
         </div>
                 
         <div class="col-sm-3">
           <div class="panel panel-primary">
                  <div class="panel-heading">
                      <div class="row">
                          <div class="col-xs-3">
                               <i class="fa fa-comments fa-5x"></i>
                          </div>
                          <div class="col-xs-9 text-right">
                               <div class="huge">26</div>
                               <div>Comentarios</div>
                          </div>
                      </div>
                        </div>
                        <a href="#">
                   <div class="panel-footer">
                          <span class="pull-left">Ver</span>
                          <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                          <div class="clearfix"></div>
                   </div>
                    </a>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-thumbs-o-up fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">10</div>
                                    <div>Votos</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Ver</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
             </div>
         </div>
        
        <div class="col-sm-3">
         <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Visitas</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Ver</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
           </div>
        </div>
      </div> 
      
      <% List<Idea> lis_i = (List<Idea>)session.getAttribute("ideas");
       		Idea idea = new Idea("", "", 0, "", -1, null, null, null, '*');
       	%>
      	
      	<% for(int i=0; i<lis_i.size() && i<3; i++){ %>
        <div id="idea<%=i+1 %>" class="row col-sm-12">
            <div class="panel panel-default">
                 <div class="panel-heading">
                      <h4 class="panel-title">
                      <% idea = lis_i.get(i);	%>
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Titulo de la idea</a>
                      </h4>
                 </div>
                 <div id="collapse<%=i+1 %>" class="panel-collapse collapse in">
                      <div class="panel-body">
                          <div class="col-lg-4">
                              <div class="well">
                                 <h4><b><%=idea.getIdAutor() %></b><small><i>  En Agosto 30, 2016</i></small></h4>
                                 <% num = (int) (Math.random() * 7 + 1); %>
                                   <img src="../images/Desafios e ideas/imagen<%=num %>.png" class="media-object img-circle"  alt="imagen" style="margin-left:0px; width:100%">
                              </div>
                          </div>
                          
                          <%=idea.getDescripcion() %> 
                          <p></p>
                          <p></p>
                          
                          <div class="row">
		     					<h6>
		     						<b><i class="fa fa-flag"></i> Estatus: </b><%=idea.getEstatus() %>
		     						
		     						<a href="#">
		     							<i class="fa fa-bookmark fa-fw"></i> Categoría
	     							</a>
	     							<br></br>
	     							<section class="pull-center">
	     								<button type="submit" class="btn btn-default btn-xs">
	     									<b class="col-lg-6" > 10 <i class="fa fa-thumbs-o-up fa-fw"></i></b>
	     								</button>
	     								<button type="submit" class="btn btn-default btn-xs">		
	     									<b class="col-lg-6" > 5 <i class="fa fa-comments fa-fw"></i></b>
     									</button>
 									</section>     							
		     					</h6>
		     		        <a  href="#" class = "btn btn-success btn-sm" data-toggle="modal" data-target="#modalDescIdea">Evaluar</a>
		     		       
		     		      </div>     
		   
                      </div>
            
                 </div>
            </div>
            
            
        </div> <!-- Col row 12 --> 
        <% } %>   
	
       </div> <!-- This row works as the overflow auto -->
	
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