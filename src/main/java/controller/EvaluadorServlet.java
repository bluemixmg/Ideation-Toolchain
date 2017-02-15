package controller;

import model.Organizacion;
import model.Desafio;
import model.User;

import dao.EvaluadoresDesafioDAO;
import dao.OrganizacionDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "EvaluadorServlet", urlPatterns = { "/Evaluador" })
public class EvaluadorServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private static String EVALUADOR_JSP =  "empresasEvaluador.jsp";
	
	public EvaluadorServlet() {
		super();
	}
		
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	    List<Desafio> desafios = new ArrayList<Desafio>();
	    List<Organizacion> organizaciones =  new ArrayList<Organizacion>();
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		//retornar los desafios de un evaluador
		
		EvaluadoresDesafioDAO evdesafio = new EvaluadoresDesafioDAO();
		desafios = evdesafio.desafiosEvaluador((User) session.getAttribute("user"));
		organizaciones = this.organizacionesEvaluador(desafios);
		session.setAttribute("organizaciones", organizaciones);
	
		RequestDispatcher rd = request.getRequestDispatcher("/pages/" + EVALUADOR_JSP);
		rd.forward(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Entro por el doGet de EvaluadorServlet");
		this.processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public List<Organizacion> organizacionesEvaluador(List<Desafio> desafios){
		List<Organizacion> organizaciones = new ArrayList<Organizacion>();
		Organizacion org;
		OrganizacionDAO orgdao = new OrganizacionDAO();
		for(int i=0; i<desafios.size(); i++){
			org= new Organizacion();
			org = orgdao.BuscarOrganizacion(desafios.get(i).getOrg());
			organizaciones.add(org);
		}
		return organizaciones;
	}


}
