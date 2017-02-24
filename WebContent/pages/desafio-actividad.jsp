<%@page import="dao.IdeaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Desafio" %>
<%@page import="model.Idea" %>
<%@page import="model.User" %>
<%@page import="nosql.IdeaNoSQL" %>
<%@page import="java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.google.gson.JsonObject"  %>
<%@ page import = "com.google.gson.JsonArray"  %>
    
<!DOCTYPE html>

<html lang="es">
<%	 if(session.getAttribute("user") == null){
	  %>
	  <script type="text/javascript">
		window.location="pages/login.jsp";
		</script>
	  <%
	}
	User usuario = (User)session.getAttribute("user");
	
%>
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
									<span class="pull-right text-muted small"> 12 minutos</span>
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
						<i class="fa fa-user fa-fw"></i><span class="hidden-xs"> <%=((User) session.getAttribute("user")).getUsername() %> </span><i class="fa fa-caret-down"></i> 
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="/PerfilServlet"><i class="fa fa-user fa-fw"></i> Perfil</a>
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
			
<% Desafio des = (Desafio)session.getAttribute("desafio");
	System.out.print("Desafío traído:");
	 System.out.print("id = " + des.getId());
	 System.out.print("título = " + des.getTitulo());
	 System.out.print("descripción = " + des.getDescripcion());
	 System.out.print("Tipo = " + des.getTipoString());
	 System.out.print("estatus = " + des.getEstatusCompleto());
%>

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
							<a href="/Desafios"><i class="fa fa-home fa-fw"></i> Inicio</a>
						</li>
						<% if(((User) session.getAttribute("user")).getrol() <= 2) {%>
						<li>
							<a href="pages/publicarIdea.jsp" target="_blank"><i class="fa fa-pencil fa-fw"></i> Publicar Idea</a>
						</li>
						<% } %>
						<li>
							<input type="hidden" id="codDes" name="codDes" value="<%=des.getId()%>">
							<a href="/Ideas?codDes=<%=des.getId()%>"><i class="fa fa-lightbulb-o fa-fw"></i> Ver Ideas</a>
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
		
		<!-- Modal2 -->
	       <div class="modal fade" id="modalEvaluacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg">
	                                
	         <div class="modal-content col-xs-12 col-md-12">
	         <img src="../images/Grafica.png"  width="70%" height="70%">
	         </div>
	         </div>
	       </div>
	  <!-- /.modal2 -->
		
		
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" ><%=des.getTitulo() %></h1>
                </div>
                
        </div>
        
        <div class="row"> <!-- This row works as the overflow auto -->
        <div class="row col-sm-12">        
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
           <div>
           <% int num = (int) (Math.random() * 7 + 1); %>
			<img src="../images/Desafios e ideas/imagen<%=num %>.png" 
			style="opacity: 0.6; filter: alpha(opacity=60); width: 100%; height:100%">
		   </div>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            
                   <div class="panel panel-default" style="width: 100%">
                        <div class="panel-heading">
                            Información del desafío
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Descripción</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Tiempo restante</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <h4>Descripción del desafío</h4>
                                    <p><%=des.getDescripcion() %></p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                <div class="row" style="display: flex; justify-content: center">
                                    <div class="col-xs-8 col-sm-8 col-md-6 col-lg-8">
          			<div class="panel panel-yellow" style="margin-top: 2em">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-clock-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                 <% long[] tiempoRestante = des.getTiempoRestante(); %>
                                
                                    <div class="huge"><%=tiempoRestante[0] %>   <%=tiempoRestante[1] %>   <%=tiempoRestante[2] %></div>
                                    <div>días horas minutos</div>
                                </div>
                            </div>
                        </div>
                            <div class="panel-footer">
                                <span class="pull-left"><%=des.getEstatusCompleto() %></span>
                                <div class="clearfix"></div>
                            </div>
                    </div>
         </div>
         </div> <!-- row -->
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>             
            
             </div>        
           </div>
        
        <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="col-xs-7 col-sm-7 col-md-4 col-lg-4">
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
                        <a href="/Ideas?codDes=<%=des.getId()%>">
                            <div class="panel-footer">
                                <span class="pull-left">Ver</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
         </div>
                 
         <div class="col-xs-7 col-sm-7 col-md-4 col-lg-4">
           <div class="panel panel-primary">
                  <div class="panel-heading">
                      <div class="row">
                          <div class="col-xs-3">
                               <i class="fa fa-comments fa-5x"></i>
                          </div>
                          <div class="col-xs-9 text-right">
                               <div class="huge">0</div>
                               <div>Comentarios</div>
                          </div>
                      </div>
                        </div>
                   <div class="panel-heading">
                          <span class="pull-left" style="opacity:0">Ver</span>
                          <span class="pull-right" style="opacity:0"><i class="fa fa-arrow-circle-right"></i></span>
                          <div class="clearfix"></div>
                   </div>
            </div>
         </div>
         <div class="col-xs-7 col-sm-7 col-md-4 col-lg-4">
            <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-thumbs-o-up fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><%=(Integer)session.getAttribute("cantidadvotos") %></div>
                                    <div>Votos</div>
                                </div>
                            </div>
                        </div>
                            <div class="panel-heading">
                                <span class="pull-left" style="opacity:0">Ver</span>
                                <span class="pull-right" style="opacity:0"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
             </div>
         </div>
        
<!--         <div class="col-sm-3"> -->
<!--          <div class="panel panel-red"> -->
<!--                         <div class="panel-heading"> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-xs-3"> -->
<!--                                     <i class="fa fa-user fa-5x"></i> -->
<!--                                 </div> -->
<!--                                 <div class="col-xs-9 text-right"> -->
<!--                                     <div class="huge">13</div> -->
<!--                                     <div>Visitas</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                             <div class="panel-heading"> -->
<!--                                 <span class="pull-left" style="opacity:0">Ver</span> -->
<!--                                 <span class="pull-right" style="opacity:0"><i class="fa fa-arrow-circle-right"></i></span> -->
<!--                                 <div class="clearfix"></div> -->
<!--                             </div> -->
<!--            </div> -->
<!--         </div> -->
      </div> 
       	<% List<Idea> lis_i = (List<Idea>)session.getAttribute("ideas");
       		Idea idea = new Idea("","", 0, "", 0, null, null, null, '*');
       	%>
      	
      	<% for(int i=0; i<lis_i.size() && i<3; i++){ %>
        <div id="idea<%=i+1 %>" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="panel panel-default">
                 <div class="panel-heading">
                      <h4 class="panel-title">
                      		<% idea = lis_i.get(i);	%>
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i+1 %>"><%=idea.getTitulo() %></a>
                      </h4>
                 </div>
                 <div id="collapse<%=i+1 %>" class="panel-collapse collapse in">
                      <div class="panel-body">
                          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-5">
                              <div class="well">
                              <% IdeaNoSQL inosql = new IdeaNoSQL();
                              	JsonObject jsono = inosql.getUnaIdea(String.valueOf(idea.getCodigo()));
                              	String fecha =(String)jsono.get("fecha_creacion").getAsString();
                              %>
                                 <h4><b><%=idea.getIdAutor() %></b><small><i> En <%=fecha %></i></small></h4>
                                 <% num = (int) (Math.random() * 7 + 1); %>
                                   <img src="../images/Desafios e ideas/imagen<%=num %>.png" class="media-object"  alt="imagen" width="240px" height="240px">
                              </div>
                          </div>
                          <%=idea.getDescripcion() %>                          
                          <p></p>
                          <p></p>
                          
                          <div class="row">
		     					<h6>
		     						<b><i class="fa fa-flag"></i> Estatus: </b><%=idea.getNombreEstatus(idea.getEstatus())%>
		     						
		     						<a href="#">
		     							<i class="fa fa-bookmark fa-fw"></i> Categorías
	     							</a>
	     							<% IdeaDAO daoIdea = new IdeaDAO();
	     								ArrayList<String> categorias = daoIdea.getCategoriasPorIdea(idea.getCodigo());
	     								for(String cat : categorias){ %>
	     									<small><%= cat %></small>
	     								<% } %>
	     							<br></br>
	     							<section class="pull-center">
	     								<button type="submit" class="btn btn-default btn-xs">
	     									<b class="col-lg-6" > <%=idea.getCantVotos() %> <i class="fa fa-thumbs-o-up fa-fw"></i></b>
	     								</button>
	     								<button type="submit" class="btn btn-default btn-xs">		
	     									<b class="col-lg-6" > 5 <i class="fa fa-comments fa-fw"></i></b>
     									</button>
 									</section>     							
		     					</h6>
		     			<% if((idea.getEstatus()=='I' || idea.getEstatus()=='D')&& ((User) session.getAttribute("user")).getrol() ==4) {%>
		     					<a  href="#" class = "btn btn-success btn-sm" data-toggle="modal" data-target="#modalEvaluacion" >Ver Evaluacion</a>
		     					
		     					<% }%>
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