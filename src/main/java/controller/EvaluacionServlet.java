package controller;

import model.Desafio;
import model.Evaluacion;
import model.Idea;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DesafioDAO;
import dao.EvaluacionDAO;
import dao.IdeaDAO;

import java.io.IOException;

@WebServlet(name = "EvaluacionServlet", urlPatterns = { "/Evaluacion" })
public class EvaluacionServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static String EVALUACIONES_JSP =  "ideasDesafioEv.jsp";
	
	public EvaluacionServlet() {
		super();
	}
		
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Entro al process");
    	try{ 
    	 Desafio des= new Desafio();
    	 HttpSession session = request.getSession();
    	 
    	 String id = request.getParameter("id");
    	 des= new DesafioDAO().consultarDesafio(Integer.parseInt(id));
    	 session.setAttribute("desafio", des);
    	 
    	 List<Idea> lis_i = new IdeaDAO().retornarIdeasPorDesafio(id);
    	 session.setAttribute("ideas", lis_i);
    	 
    	 int votosTotales = new IdeaDAO().retornarVotacionesTotalesPorIdeasDeDesafio(id);
    	 session.setAttribute("cantidadvotos", votosTotales);
    	 
    	 if(des!=null){
    		 response.getWriter().print("Estoy en el processRequest de DesafioActividadServlet");
    		 System.out.println("entro");
    		 RequestDispatcher rq=request.getRequestDispatcher("/pages/"+EVALUACIONES_JSP);
    		 rq.forward(request, response);
    	 }else{
    		 response.getWriter().print("Estoy en el processRequest de IdeasServlet y fallo el insertar ");
    		 System.out.println("No entro");
    	 }
    	}catch(IOException ioe){
    		throw new ServletException(ioe);
    	}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entró a doPost");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Evaluacion evaluacion = new Evaluacion();
		Date fecha = new Date();
		evaluacion.setUsername("prueba");
		evaluacion.setIdea_id("prueba");
		evaluacion.setDetalle(request.getParameter("detalle"));
		evaluacion.setFactibilidad(1);
		evaluacion.setImpacto(2);		
		evaluacion.setFecha(fecha);
		if(EvaluacionDAO.registrarEvaluacion(evaluacion)) {
			RequestDispatcher rd = request.getRequestDispatcher("/pages/" + EVALUACIONES_JSP);
			rd.forward(request, response);
		}
		else{
			System.out.println("No registro");
		}
	}

}
