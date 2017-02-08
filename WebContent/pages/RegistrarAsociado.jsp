<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@page import="dao.DesafioDAO" --%>

<!DOCTYPE html>
<html lang="es">

<head>

    <!-- <meta charset="utf-8"> -->
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>App Thinking - Gestión de ciclo de vida de los proyectos de innovación</title>

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
    <br><br><br>
    <div class="col-md-10 col-md-offset-3" >
       <div class="row">
           <div class="col-lg-12 col-md-offset-3" >
               <h1 class="page-header" align="">Registro de Empleado</h1>
           </div>
       </div>
       <!-- /.row -->
       <div class="col-md-12 col-md-offset-3">
            <form action="/RegistrarAsociadoServlet" method="POST" role="form" data-toggle="validator">   <!-- FORM HACIA EL SERVLET -->
                <div class="col-md-4 ">                                       
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
				<!-- .col-md-4 -->
				<div class="col-md-4">
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
			    <div align="center">	
			    	<br>		    
				    <button type="submit" class="btn btn-primary btn-lg btn-block">Regístrate</button>
			    </div>	
			  </div>    	 	
             </form>

       </div>
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
    
    <!-- Date Picker JavaScript -->
    <script src="../dist/js/bootstrap-datepicker.js"></script>

</body>

</html>
