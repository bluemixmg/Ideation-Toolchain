package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpleadoDAO;
import dao.CategoriaDAO;
import dao.DesafioDAO;
import dao.IdeaDAO;
import dao.OrganizacionDAO;
import model.Empleado;
import model.Categoria;
import model.Desafio;
import model.Organizacion;
import model.User;

/**
 * Servlet implementation class OrganizacionServlet
 */
@WebServlet(name = "OrganizationServlet", urlPatterns = { "/OrganizacionServlet" })
public class OrganizacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrganizacionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("\nEntro a processRequest\n");
		try {
			//Lista que guarda todos los desafíos disponibles
			
			response.setContentType("text/html;charset=UTF-8");
			HttpSession session = request.getSession();
			
			
			//------------Busqueda del los desafio por el RIF a travez del asiciado--------------
			
			EmpleadoDAO adao = new EmpleadoDAO();
			Empleado as=adao.RetornarEmpleado(((User)session.getAttribute("user")).getEmail());
	
			List<Desafio> lis_des = getDesafios(as.getRifOrganizacion());
			session.setAttribute("desafios", lis_des);

			//Mapa que guarda las votaciones totales por cada desafío
			Map<String, Integer> mp = new HashMap<String, Integer>();
			IdeaDAO daoI = new IdeaDAO();
			for (int i = 0; i < lis_des.size(); i++) {
				String codDesafio = lis_des.get(i).getCodigo();
				mp.put(codDesafio, daoI.retornarVotacionesTotalesPorIdeasDeDesafio(codDesafio));
			}
			session.setAttribute("votaciones", mp);
			
			//Lista de asociado a la organizacion 
			
			EmpleadoDAO asd = new EmpleadoDAO();
			//List<Empleado> list_as  = asd.RetornarListaAsociado(as.getRifOrganizacion());
			//session.setAttribute("asociados", list_as);
			
			//Datos de la organizacion 
			
			Organizacion org = new Organizacion();
			OrganizacionDAO odao = new  OrganizacionDAO();
			org= odao.BuscarOrganizacion(as.getRifOrganizacion());
			
			session.setAttribute("organizacion", org);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/pages/perfil-organization.jsp");
			rd.forward(request, response);			
		}catch(IOException ioe) {
			response.getWriter().print("Genero un error en IOException");
    		response.getWriter().print(ioe.getMessage());
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private List<Desafio> getDesafios(String rif) {
		System.out.println("\nEntro a getDesafios() del servlet\n");
		DesafioDAO daod = new DesafioDAO();
		List<Desafio> lista_desafios = daod.RetornarDesafiosPorOrganizacion(rif);
		return lista_desafios;
	}

}
