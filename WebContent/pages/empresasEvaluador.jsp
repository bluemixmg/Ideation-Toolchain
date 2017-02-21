<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "model.Organizacion" %>
    <%@ page import = "model.Desafio" %>
    <%@page import="model.User" %>
    <%@ page import  = "java.util.ArrayList" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "java.util.Date" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
    
<jsp:useBean id="org1" class="model.Organizacion" scope="session"/>

<% User usuario = (User) session.getAttribute("user"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="es">

<head>

 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
 <meta name="author" content="">
 
<title>Empresas asociadas</title>
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
		
		.table-fixed thead {
           width: 97%;
          }
        .table-fixed tbody {
           height: 180px;
           overflow-y: scroll;
           width: 100%;
          }
        .table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
           display: block;
          }
        .table-fixed tbody td, .table-fixed thead > tr> th {
           display: inline-block;
           border-bottom-width: 0;
          }
          
          #button{
          margin-top: 1px;
          }
          
          tr.selected {
           background-color: #FFCF8B
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
				<a class="navbar-brand" href="index.jsp">App Thinking Nueva</a>
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
									<i class="fa fa-comment fa-fw"></i><small> 3 Nuevo Comentarios </small>
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
						<li><a href="#"><i class="fa fa-user fa-fw"></i> <%=usuario.getUsername() %></a>
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
							<a href="page/Home.jsp"><i class="fa fa-home fa-fw"></i> Inicio</a>
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
	 
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" >Desafios por organizacion</h1>
                </div>
                <!-- /.col-lg-12 -->
        </div>
        
<div class="row"> <!-- This row works as the overflow auto -->
	     
<div class="row col-sm-12">
<div class="col-sm-8">
<div class="table-responsive">


<table id="table-organizaciones" class="table table-fixed">

          <thead>
            <tr>
              <th class="col-xs-4">Nombre</th><th class="col-xs-4">Razon social</th><th class="col-xs-4">Pais</th>
            </tr>
          </thead>
          <tbody>
          <% List<Organizacion> organizaciones = (List<Organizacion>)session.getAttribute("organizaciones");
            Organizacion organizacion;
             for(int i=0; i<organizaciones.size(); ++i){
				organizacion = new Organizacion();
				organizacion.setDireccion(organizaciones.get(i).getDireccion());
				organizacion.setNombre(organizaciones.get(i).getNombre());
				organizacion.setRazonSocial(organizaciones.get(i).getRazonSocial());
				organizacion.setRif(organizaciones.get(i).getRif());

                    %>
            <tr>            
              <td class="col-xs-4"><%= organizacion.getNombre()%></td><td class="col-xs-4"><%= organizacion.getRazonSocial() %></td><td class="col-xs-4">Colombia</td>   
            </tr>
            <%} %>
            <tr>            
              <td class="col-xs-4">Prueba</td><td class="col-xs-4">Prueba</td><td class="col-xs-4">Colombia</td> 
            </tr>  
          </tbody>
        </table>

</div>	     
</div>

<div class="col-sm-4">
        <div class="panel panel-primary">
             <div class="panel-heading">
                     Spinetti
              </div>
                 <div class="panel-body" style="min-height: 145px; max-height: 145px;">
                  <img src="../images/logo_prueba.jpg" class="media-object"  alt="imagen" style="margin-left:40px">
                 </div>
                 <div class="panel-footer">
                   Panel Footer
                 </div>
        </div>                
</div>

</div>   
      
  <br>
  </br>
       
<div class="row col-sm-12">
<div class="col-sm-8">
<div class="table-responsive">
<table class="table table-fixed">
          <thead>
            <tr>
              <th class="col-xs-3">Titulo</th><th class="col-xs-4">Categoria</th><th class="col-xs-3">Fecha de caducidad</th><th class="col-xs-2">Prioridad</th>
            </tr>
          </thead>
          <tbody>
          <% List<Desafio> desafios = (List<Desafio>)session.getAttribute("desafios_organizacion");
              Desafio desafio;
              for(int i=0; i<desafios.size(); ++i){
				desafio = new Desafio();
				desafio.setTitulo(desafios.get(i).getTitulo());
				desafio.setCategoria(desafios.get(i).getCategoria());
				desafio.setFechaCaducidad(desafios.get(i).getFechaCaducidad());
                    %>
            <tr onClick="HighLightTR(this,'#c9cc99','cc3333');">
              <td class="col-xs-3"><%= desafio.getTitulo()%></td><td class="col-xs-4"><%= desafio.getCategoria() %></td><td class="col-xs-3"><%= desafio.getFechaCaducidad() %></td><td class="col-xs-2">Alta</td>
            </tr>
             <%} %>          
          </tbody>
        </table>
   </div>	     
  </div>
  
  <div class="col-sm-4"> 
  
    <div class="panel panel-primary">
             <div class="panel-heading">
                     Descripcion.
              </div>
                 <div class="panel-body" style="min-height: 145px; max-height: 145px;">
                 <%desafio = desafios.get(0); %>
                  <p><%= desafio.getDescripcion() %></p>
                 </div>
                 <div class="panel-footer">
                 <form method="get" action="/Evaluacion">
                  <input type="hidden" name="id" id="id" value="<%= desafio.getId() %>">
                  <button id= "button" type="submit" class="btn btn-primary">Ver ideas</button>
                 </form>
                 </div>
    </div> 
       
   </div>
   
</div> 
    
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
	
	<script type="text/javascript"> 
    function addRowHandlers() {
    var table = document.getElementById("table-organizaciones");
    var rows = table.getElementsByTagName("tr");
    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = 
            function(row) 
            {
                return function() { 
                                        var cell = row.getElementsByTagName("td")[0];
                                        var id = cell.innerHTML;
                                        alert("id:" + id);
                                 };
            };

        currentRow.onclick = createClickHandler(currentRow);
     }
   }
		
</script>

  <script>
  var preEl ;
  var orgBColor;
  var orgTColor;
  function HighLightTR(el, backColor,textColor){
  if(typeof(preEl)!='undefined') {
     preEl.bgColor=orgBColor;
     try{ChangeTextColor(preEl,orgTColor);}catch(e){;}
  }
   orgBColor = el.bgColor;
   orgTColor = el.style.color;
   el.bgColor=backColor;

    try{ChangeTextColor(el,textColor);}catch(e){;}
    preEl = el;
  }


  function ChangeTextColor(a_obj,a_color){  ;
     for (i=0;i<a_obj.cells.length;i++)
      a_obj.cells(i).style.color=a_color;
  }
</script>



 </body>

</html>