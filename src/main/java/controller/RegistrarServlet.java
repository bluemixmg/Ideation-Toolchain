package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpleadoDAO;
import dao.IdeadorDAO;
import dao.UserDAO;
import model.Ideador;
import model.User;
import model.Validacion;

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet(name = "RegistrarServlet", urlPatterns = { "/RegistrarServlet" })
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VARIABLES_JSP = "/Desafios";
	private static String HOME_JSP = "index.jsp";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Entro al doPost del Registrar");
		
    	 UserDAO userdao = new UserDAO();
    	 response.setContentType("text/html;charset=UTF-8");
    	 IdeadorDAO daoEs = new IdeadorDAO();
    	 
    	 String email, password, username;
    	 email= request.getParameter("email");
    	 password= request.getParameter("inputPassword");
    	 username = request.getParameter("user");
    	 
    	 
    //--------------- Asignacion de parametros a la clase User------------------------------
    	 User user = new User();
		 user.setEmail(email.trim().toLowerCase());
		 user.setPassword(password);
		 user.setUsername(username.trim());
		 user.setTipo(1);
		
    //--------------- Asignacion de parametros a la clase Estandamndar------------------------------

    	 Ideador es = new Ideador(); 
    	 es.setEmail(email);
    	 es.setNombres(request.getParameter("nombre"));
    	 es.setApellidos(request.getParameter("apellido"));
    	 es.setTelefono(request.getParameter("telefono"));
		 es.setDireccion(request.getParameter("direccion"));
		 System.out.println("Fecha traída por request: " + request.getParameter("fechanacimiento"));
		 Date fecha = CnvStringFecha(request.getParameter("fechanacimiento"));
		 es.setFechaNacimiento(fecha); 
		 
		 String genero = request.getParameter("genero");
		 response.getWriter().print(genero);

		 if (genero=="Masculino"){
			 es.setGenero(1);
		 }else 
			 es.setGenero(0);
		 
	//---------- INSERTAR EL USER Y EL ESTANDAR EN LA BASE DE DATOS-------------
		
    	 if(userdao.insertarUsuario(user) && daoEs.insertarEstandar(es))   	 
    	 {
    		 HttpSession misession= request.getSession(true);
    		 //#######################################
    		 response.getWriter().print("Estoy en el processRequest de Registrar");
    		 System.out.println("Inserto estandar");
    		 //#######################################

    		 misession.setAttribute("user", user);
    		 RequestDispatcher rq = request.getRequestDispatcher("/pages/desa.jsp");
    		 rq.forward(request, response);
    	 }else{
    		 
    		 response.getWriter().print("Error al intentar Registrarse, comuniquese con el administrador de la pagina");
    		 System.out.println("No inserto");
    	 }
	}
	
	//----- funcion para convertir estrin a fecha con formato yyyy-MM-dd
	public Date CnvStringFecha(String fecha)
	{
	    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	    Date fechaDate = null;
	    try 
	    {
	        fechaDate = formato.parse(fecha);
	    }
	    catch (ParseException ex)
	    {
	        System.out.println(ex.getMessage());
	    }
	    return fechaDate;
	}

}


