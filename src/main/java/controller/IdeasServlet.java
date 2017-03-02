package controller;

import java.io.DataInputStream;
import java.io.IOException;
import java.util.List;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Random;

import com.cloudant.client.api.Database;
import com.google.gson.JsonObject; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.IdeaDAO;
import model.Idea;
import model.User;
import nosql.IdeaNoSQL;
import model.ConexionCloudantBD;
import model.Desafio;

/**
 * Servlet implementation class IdeaServlet
 */
@MultipartConfig
@WebServlet(name = "Ideas", urlPatterns = { "/Ideas" })

public class IdeasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VERIDEAS_JSP =  "verIdeas.jsp";
	
	//private static String HOME_JSP = "index.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdeasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    	System.out.println("Entro al process");
    	response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
    		
    		HttpSession session = request.getSession(false);
	    	User user = new User();
	    	user = (User) session.getAttribute("user");
	    	Desafio des = (Desafio)session.getAttribute("desafio");
	    	IdeaDAO daoIdea = new IdeaDAO();
	    	
	    	response.setContentType("text/html;charset=UTF-8");
	    	Idea i = new Idea();
	    	String titulo = request.getParameter("titulo");
	    	String descripcion = request.getParameter("descripcion");
	    	String palabras = request.getParameter("palabraclave");
	    	String[] categorias = request.getParameterValues("categoria");
	    	ArrayList<String> palabrasC = separarPalabrasClave(palabras);
	    	ArrayList<Integer> categoriasI = convertirArrayToArrayList(categorias);
	    	Part fotoPart = request.getPart("imagen");
	    	int fotoSize = (int)fotoPart.getSize(); //Si no tiene tamanno, no hay imagen
	    	byte[] foto=null;
	    	if(fotoSize>0){
	    		foto= new byte[fotoSize];
	    		try(DataInputStream dis = new DataInputStream(fotoPart.getInputStream())){
	    			dis.readFully(foto);
	    		}
	    	}
	    	i.setTitulo(titulo);
	    	i.setDescripcion(descripcion);
	    	i.setCantVotos(0);
	    	i.setCodDesafio(des.getId());
	    	i.setIdAutor(user.getUsername());
	    	i.setPalabrasClave(palabrasC);
	    	i.setCategorias(categoriasI);
	    	i.setEstatus('A');
	    	if(fotoSize>0)
	    		i.setImagen(foto);
	    	
	    	for(String p : i.getPalabrasClave())
	    		System.out.println(p);
	    	for(Integer c : i.getCategorias())
	    		System.out.println("Codigo Categoria:"+c);
	    		
	    		System.out.println("Estoy en el processRequest de IdeaServlet");
	    		System.out.println("El siguiente codigo: "+daoIdea.siguienteCodigoIdea());
	    		if(fotoSize>0)
	    			if(daoIdea.insertarIdeaConImagen(i)){
	    				System.out.println("Inserto idea");
	    				guardarIdeaEnCloudant(i, daoIdea.siguienteCodigoIdea()-1);
	    			}
	    		else
	    			if(daoIdea.insertarIdea(i)){
	    				System.out.println("Inserto idea");
	    				guardarIdeaEnCloudant(i, daoIdea.siguienteCodigoIdea()-1);
	    			}
	    		
	    		for(Integer cate : i.getCategorias())
	    			daoIdea.insertarCategoriasPorIdea(cate, daoIdea.siguienteCodigoIdea()-1);
	    		
	    		//session.setAttribute("nom_cate", daoIdea.getCategoriasPorIdea(i.getCodigo()));
		    	System.out.println(daoIdea.getCategoriasPorIdea(daoIdea.siguienteCodigoIdea()-1));
	    		
	    		
	    		//String p=porcentajeProgresoIdea(i.getEstatus());
	    		//System.out.println(i.getEstatus());
	    		//session.setAttribute("idea_nosql", conNSQL.getUnaIdea(i.getCodigo()));
	    		//session.setAttribute("progreso", p);
	    		processRequest2(request, response);
	    		RequestDispatcher rq=request.getRequestDispatcher("/pages/"+VERIDEAS_JSP);
	    		rq.forward(request, response);
   
    	/*catch(IOException ioe){
    		throw new ServletException(ioe);
    		//response.getWriter().print("Genero un error en IOException");
    		response.getWriter().print(ioe.getMessage());
    	}*/
    }

   private void guardarIdeaEnCloudant(Idea i, int siguienteValor)
   {
	   Database db = null;
   	   db = ConexionCloudantBD.getDB();
   	   IdeaNoSQL conNSQL = new IdeaNoSQL();
   	   System.out.println("recibe: "+siguienteValor);
	   try {
   			db = conNSQL.getDB();
			JsonObject resultadoIdeaJson = conNSQL.create(db, siguienteValor, i);
			System.out.println("Carga de la idea completa en la BD NoSQL"+" con el id: "+siguienteValor);
			System.out.println(resultadoIdeaJson.toString());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Entro en la excepcion del no sql");
			e.printStackTrace();
		}
   }
	private ArrayList<String> separarPalabrasClave(String cadena){
		ArrayList<String> palabras = new ArrayList<String>();
		String[] aux = cadena.split("[ ,]+");
		for(String aux1 : aux){
			palabras.add(aux1);
		}
	return palabras;
	}
	private ArrayList<Integer> convertirArrayToArrayList(String[] arrayBase){
		ArrayList<Integer> salida = new ArrayList<Integer>();
		for(String obj1: arrayBase)
			salida.add(Integer.parseInt(obj1));
		return salida;
	}
    
	//Determinar el porcentaje de la idea e acuerdo al progreso registrado
	private String porcentajeProgresoIdea(char e){
		String progreso;
		System.out.println(e);
		switch(e){
			case 'A': progreso="25";
			break;
			case 'V': progreso="50";
			break;
			case 'I': progreso="75";
			break;
			case 'F': progreso="100";
			break;
			default: progreso="0";
		}
		System.out.println(progreso);
		return progreso;
	}
	protected void processRequest2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
		HttpSession session = request.getSession(false);
		int id = Integer.parseInt(request.getParameter("codDes"));
		System.out.println("El codigo del desafio es: "+id);
   	 	List<Idea> lis_i = new IdeaDAO().retornarIdeasPorDesafio(id);
   	 	session.setAttribute("ver_ideas", lis_i);
   	 	RequestDispatcher rq=request.getRequestDispatcher("/pages/"+VERIDEAS_JSP);
		rq.forward(request, response);
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    //response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest2(request, response);
		//response.getWriter().append("Estoy en el GET");
		//service(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		processRequest(request, response);
		//System.out.println("Estoy en el post");
	}

}
