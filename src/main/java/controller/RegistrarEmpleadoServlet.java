package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpleadoDAO;
import dao.OrganizacionDAO;
import dao.PerfilDAO;
import dao.UserDAO;
import model.Empleado;
import model.Perfil;
import model.Organizacion;
import model.User;

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet(name = "RegistrarEmpleadoServlet", urlPatterns = { "/RegistrarEmpleadoServlet" })
public class RegistrarEmpleadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VARIABLES_JSP = "perfil.jsp";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarEmpleadoServlet() {
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
   	 response.setContentType("text/html;charset=UTF-8");

		 HttpSession session= request.getSession(true);
		 RequestDispatcher rq;
		 
		 User us= new User();
		 UserDAO userdao = new UserDAO();
		 
		 Organizacion org = new Organizacion();
		 OrganizacionDAO orgdao = new OrganizacionDAO();

		 EmpleadoDAO daoAs = new EmpleadoDAO();
    	 Empleado emp = new Empleado();
    	     	 
		 us = (User)session.getAttribute("user");
		 
    //---------------Busqueda de la organizacion --------------
		 
		 emp = daoAs.RetornarEmpleado(us.getUsername());
		 
		 
		 System.out.println("USUARIOORGANIZACION: " + us.getEmail()+us.getPassword()+us.getrol()+us.getUsername());
		 System.out.println("Retorno el EmpRganizacion : "+ emp.getUsername() + " y el rif es : " + emp.getRifOrganizacion());

		 org=orgdao.BuscarOrganizacion(emp.getRifOrganizacion());
		 		 
		 
	 //-------------------	VARIABLES GENERALES---------------------
		 String email, password, username, rifOrg;
		 email= request.getParameter("email");
		 password= request.getParameter("inputPassword");
		 username = request.getParameter("user");
		 rifOrg = org.getRif();
		 

    	 
  
    //--------------- Asignacion de parametros a la clase User------------------------------
    	 User user = new User();
		 user.setEmail(email);
		 user.setPassword(password);
		 user.setUsername(username);
		 user.setrol(2);
		
	//--------------- Asignacion de parametros a la clase Empleado------------------------------

		 emp.setUsername(username);
		 emp.setRifOrganizacion(rifOrg);
		 emp.setTipo(2);
		 
 
	//----------------Asignacion a Perfil------------------------------------------------------	 
    	 Perfil perf = new Perfil();
    	 PerfilDAO daop = new PerfilDAO();
    	 
    	 perf.setNombres(request.getParameter("nombre"));
    	 perf.setApellidos(request.getParameter("apellido"));
    	 perf.setTelefono(request.getParameter("telefono"));
    	 perf.setDireccion(request.getParameter("direccion"));
		
    	 String fech= request.getParameter("fechanacimiento");
		 
		 System.out.println("FechaAsociado: " + fech);
		 Date fechaD = CnvStringFecha(fech);
		 perf.setFechaNacimiento(fechaD); 

		 String genero = request.getParameter("genero");
		 response.getWriter().print(genero);

		 if (genero=="Masculino"){
			 perf.setGenero(1);
		 }else 
			 perf.setGenero(0);
		 
			
    	 if(userdao.insertarUsuario(user) && daoAs.insertarEmpleado(emp))   	 
    	 {
    		 //#######################################
    		 response.getWriter().print("Estoy en el processRequest de Registrar");
    		 System.out.println("Inserto");
    		 //#######################################
    		 response.getWriter().print("inserto al empleado ");

    		 session.setAttribute("inserto", user);
    		 rq = request.getRequestDispatcher("/pages/desa.jsp");
    		 rq.forward(request, response);
    		 
    	 }else{
    		 
    		 System.out.println("No inserto");
    		 rq = request.getRequestDispatcher("/pages/" + "error.jsp");
    		 rq.forward(request, response);
    	 }
        	 
    	    	 
	}
	
	//----- funcion para convertir String a fecha con formato yyyy-MM-dd
	public Date CnvStringFecha(String fecha)
	{
		System.out.println("CNVStringfecha" + fecha );
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


