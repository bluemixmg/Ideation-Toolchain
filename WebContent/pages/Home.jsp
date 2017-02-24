<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>

<%--@page import="dao.DesafioDAO" --%>

<!DOCTYPE html>
<html lang="es">

<head>

<%	
	 if(session.getAttribute("user") != null){
		 System.out.print("User no es null por tanto entró al if");
	   	User us = new User();
	 	us= (User) session.getAttribute("user");
	 	switch(us.getrol()){
				case 1:
					%>
					  <script type="text/javascript">
					  	window.location.href ="/Desafios";
					  </script>
					<%
					break;
				case 2:
					%>
					  <script type="text/javascript">
					  	window.location.href ="/Desafios";
					  </script>
					<%
				case 3: 
					%>
					  <script type="text/javascript">
					  	window.location="/EvaluadorServlet";
					  </script>
					<%
					 break;
				case 4:
					%>
					  <script type="text/javascript">
					  	window.location="/pages/perfil-organizacion.jsp";
					  </script>
					<%
					 break;			
			}

	}
	
%>

    <!-- <meta charset="utf-8"> -->
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>Marna Centro de Innovación y Negocio</title>

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
    
    <style>
    	body {
		    background-color: transparent;
		    background-image: url('../images/ideas3.jpg');
		    background-repeat: no-repeat;
		    background-position: center top;
		    background-attachment: fixed;
		    backgroudn-size: 50%;
		}
		
		/* Ahora podemos cambiar solo la propiedad background-image */
		@media (min-width: 480px) {
		    body {
		        background-image: url('../images/ideas3.jpg');
		    }
		}
		@media (min-width: 768px) {
		    body {
		        background-image: url('../images/ideas3.jpg');
		    }
		}
		@media (min-width: 1200px) {
		    body {
		        background-image: url('../images/ideas3.jpg');
		    }
		}
		

    </style>
	
</head>

<body>
    <div id="wrapper" >

     <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

		<div class="nav navbar-top-links ">
			<div class="row"><br></div>
		 	<div class="row">
			 	<div Class="col-md-3"  align="center">
			 	  <a class="navbar-brand" href="#">Marna CIN</a>	
			 	</div>
			 	<div class="col-md-3">
			 	</div>
			 	<div class="col-md-6" align="right"style="margin: 0 2 0 0">
			 	  <form action="/LoginServlet" method="POST" role="form" >
			 		 <input  placeholder="Email" name="usuario" id="usuario"type="text" >
					 <input  placeholder="Contraseña" name="pass" type="password" id="pass">
					 <button type="submit" class="btn btn-primary btn-sm">Entrar</button><br>
					 <div class="col-md-6"></div>
					 <div class="col-md-6" align="left">		
					      <a href="#" style="color: #999999; font-weight: 900; text-align: center"><small>¿Olvidaste tu contraseña?</small></a>				 
					 </div>
		 		  </form>
		 		</div>
		 	</div>
        
    	</div>
   </nav> 
    <!-- /.navbar-header -->
   
    <div class="col-sm-12">
       <div class="row">
           <div class="col-sm-6" style="float: right">
               <h1 class="page-header" style="color:white">Regístrate</h1>
           </div>
       </div>
       <!-- /.row -->
	   <div class="col-sm-6" style="float: left">
	  
	   
	   </div>
	      <div class="col-sm-6" style="float: right">
            <form action="/RegistrarServlet" method="POST" role="form">   <!-- FORM HACIA EL SERVLET -->
                <div class="col-md-6 ">                                       
               	   	<div class="form-group has-success">
                          <input class="form-control" placeholder="Elige un nombre de usuario" required name="user" id="user" maxlength="25">
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon">@</span>
                        <input type="email" class="form-control" placeholder="Correo Electronico" required name="email" id="email" maxlength="30">
                    </div>

                       <div class="form-group" id="pass_1">
	                       <input class="form-control" id="inputPassword" type="password" name="inputPassword" placeholder="Contraseña" data-minLength="6" data-error="some error" required/>

                       </div>
                       <div class="form-group" id="pass_2">
                       		<input class="form-control" id="inputPasswordConfirm" type="password" name="inputPasswordConfirm" placeholder="Confirmar contraseña"  required/>

                          
                       </div>
           		 </div>
				<!-- .col-md-4 -->
				<div class="col-md-6">
					  <div class="form-group">
                         <input class="form-control"  type="text" placeholder="Tu Nombre" required name="nombre" id="nombre" maxlength="30">   
                       
                       </div>
                       <div class="form-group ">
                          <input class="form-control" type="text" placeholder="Tu Apellido" required name="apellido" id="apellido" maxlength="30">
                      </div>
                      
                     <div class="form-group" >
                        <label style="color: #999999; font-weight: 900;">Género: </label>
                        <label class="radio-inline" style="color: #999999; font-weight: 900;">
                            <input type="radio" name="genero" id="genero" value="Femenino" checked >Femenino
                        </label>
                        <label class="radio-inline" style="color: #999999; font-weight: 900;">
                            <input type="radio" name="genero" id="genero" value="Masculino" >Masculino
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
    
       <script type="text/javascript">
		$(function(){
		$('#password').keyup(function(){
			var _this1 = $('#inputPassword');
			var pass_1 = $('#inputPassword').val();
	                _this1.attr('style', 'background:white');
			if(pass_1.charAt(0) == ''){
				_this1.attr('class', 'form-group has-error');
			}
	 
			if(_this.val() == ''){
				_this1.attr('class', 'form-group has-error');
			}
		});
	 
		$('#inputPasswordConfirm').keyup(function(){
			var _this1 = $('#pass_1');
			var _this2 = $('#pass_2')
			
			var pass_1 = $('#inputPassword').val();
			var pass_2 = $('#inputPasswordConfirm').val();
			var _this = $('#inputPasswordConfirm');
	                _this.attr('style', 'background:white');
	               
	               console.log(pass_1);
	               console.log(pass_2);
			
			if(pass_1 != pass_2 && pass_2 != ''){
				_this1.attr('class', 'form-group has-error');
				_this2.attr('class', 'form-group has-error')
			}else{
				_this1.attr('class', 'form-group has-success');
				_this2.attr('class', 'form-group has-success')
			}
		});
	});
    </script>

</body>
</html>
