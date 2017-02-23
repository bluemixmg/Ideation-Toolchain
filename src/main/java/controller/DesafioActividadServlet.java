package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DesafioDAO;
import dao.IdeaDAO;
import model.Desafio;
import model.Idea;


/**
 * Servlet implementation class DesafioActividadServlet
 */
@WebServlet(name = "DesafioActividadServlet", urlPatterns = { "/Desafio" })
public class DesafioActividadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VERDESAFIOACTIVIDAD_JSP =  "desafio-actividad.jsp";
	//private static String HOME_JSP = "index.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesafioActividadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    	System.out.println("Entro al process");
    	try{ 
    	 Desafio des= new Desafio();
    	 HttpSession session = request.getSession(false);
    	 
    	 int id = Integer.parseInt(request.getParameter("id"));
    	 System.out.println("Se trajo este id por request en DesafioActividadServlet: " + id);
    	 des= new DesafioDAO().consultarDesafio(id);
    	 session.setAttribute("desafio", des);
    	 
    	 List<Idea> lis_i = new IdeaDAO().retornarIdeasPorDesafio(id);
    	 session.setAttribute("ideas", lis_i);
    	 
    	 int votosTotales = new IdeaDAO().retornarVotacionesTotalesPorIdeasDeDesafio(id);
    	 session.setAttribute("cantidadvotos", votosTotales);
    	 
    	 if(des!=null){
    		 response.getWriter().print("Estoy en el processRequest de DesafioActividadServlet");
    		 System.out.println("entro");
    		 RequestDispatcher rq=request.getRequestDispatcher("/pages/"+VERDESAFIOACTIVIDAD_JSP);
    		 rq.forward(request, response);
    	 }else{
    		 response.getWriter().print("Estoy en el processRequest de IdeasServlet y fallo el insertar ");
    		 System.out.println("No entro");
    	 }
    	}catch(IOException ioe){
    		throw new ServletException(ioe);
    	}
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req, resp);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entro por post");
		processRequest(request, response);
	}

}
