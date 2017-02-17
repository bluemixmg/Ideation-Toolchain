package controller;


import dao.EmpleadoDAO;
import dao.CategoriaDAO;
import dao.DesafioDAO;
import dao.IdeaDAO;
import model.Empleado;
import model.Categoria;
import model.Desafio;
import model.User;
import nosql.DesafioNoSQL;

import com.cloudant.client.api.Database;
import com.google.gson.JsonObject;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "DesafioServlet", urlPatterns = { "/Desafios" })
@MultipartConfig
public class DesafioServlet extends HttpServlet {
	private static final int readBufferSize = 8192;
	private static final long serialVersionUID = 1L;
	private static String DESAFIOS_JSP =  "desafios.jsp";
	
	public DesafioServlet() throws ClassNotFoundException {
		super();
	}

	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("\nEntro a processRequest\n");
		try {
			//Lista que guarda todos los desafíos disponibles
			List<Desafio> lis_des = getDesafios();
			response.setContentType("text/html;charset=UTF-8");
			HttpSession session = request.getSession();
			session.setAttribute("desafios", lis_des);
			
			//Mapa que guarda las votaciones totales por cada desafío
			Map<String, Integer> mp = new HashMap<String, Integer>();
			IdeaDAO daoI = new IdeaDAO();
			for (int i = 0; i < lis_des.size(); i++) {
				String codDesafio = "" + lis_des.get(i).getId();
				mp.put(codDesafio, daoI.retornarVotacionesTotalesPorIdeasDeDesafio(codDesafio));
			}
			session.setAttribute("votaciones", mp);
			
			//Lista que guarda todas las categorías disponibles para los desafíos
			List<Categoria> lis_cat = new CategoriaDAO().RetornarCategorias();
			session.setAttribute("categorias", lis_cat);
			
			RequestDispatcher rd = request.getRequestDispatcher("/pages/" + DESAFIOS_JSP);
			rd.forward(request, response);			
		}catch(IOException ioe) {
			response.getWriter().print("Genero un error en IOException");
    		response.getWriter().print(ioe.getMessage());
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        //Logger.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
	
	private String getPartString(Part part) throws IOException {
		String str = "";
		if (part != null) {
			BufferedReader r = new BufferedReader(new InputStreamReader(part.getInputStream()));
			str = r.readLine();
		}
		return str;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entró a doPost");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Database db = null;
    	//db = ConexionCloudantBD.getDB();
    	DesafioNoSQL desNoSQL = new DesafioNoSQL();
    	
    	HttpSession session = request.getSession(false);
    	
    	User user = (User) session.getAttribute("user");
    	
    	Desafio des = new Desafio();
    	DesafioDAO daod = new DesafioDAO();
    	
    	//int id = daod.consultarUltimoDesafioDeOrganizacion(user.getUsername());
    	//String codigo = "D" + user.getUsername() + "-" + entero4Digitos(id);
    	//System.out.println("Código generado: " + codigo);
		String titulo = getPartString(request.getPart("titulo"));
		System.out.println("Título traído por request: " + titulo);
		String descripcion = getPartString(request.getPart("descripcion"));
		System.out.println("Descripción traída por request: " + descripcion);
		EmpleadoDAO daoa = new EmpleadoDAO();
		Empleado aso = daoa.RetornarAsociado(user.getEmail());
		String org = aso.getRifOrganizacion();
		System.out.println("Rif organizacion: " + org);
		String categoria = getPartString(request.getPart("categoria"));
		System.out.println("Categoría traída por request: " + categoria);
		//categoria = "1";
		System.out.println("Tipo traído por request: " + request.getPart("tipo").toString());
		boolean tipo = (getPartString(request.getPart("tipo")) != null) ? true : false;
		String fecha = getPartString(request.getPart("fecha"));
		System.out.println("Fecha retornada por input date: " + fecha);
		Date fechacad = new Date();
		try {
			fechacad = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//des.setCodigo(codigo);
		des.setTitulo(titulo);
		System.out.println("Título traído: " + des.getTitulo());
		des.setDescripcion(descripcion);
		System.out.println("Descripción traída: " + des.getDescripcion());
		des.setOrg(org);
		des.setCategoriaServlet(categoria);
		System.out.println("Categoría traída: " + des.getCategoria());
		des.setTipo(tipo);
		System.out.println("Tipo traído: " + des.getTipoString());
		des.setFechaCaducidad(fechacad);
		System.out.println("Fecha traída: " + des.getFechaCaducidad());
		if(DesafioDAO.insertarDesafio(des)) {
			System.out.println("Insertó exitosamente en la BD PostgreSQL");
			System.out.println("Entró al if porque insertó exitosamente");
			Part filePart = request.getPart("inputFile");
	        //long size = filePart.getSize();
	        //System.out.println("size = " + size);
	        String fileName = getFileName(filePart);
	        System.out.println("fileName = " + fileName);
	        //String contentType = filePart.getContentType();
	        //System.out.println("contentType = " + contentType);
	        
	        try {
	        	System.out.println("Entró al try para insertar en BD NoSQL");
	        	db = desNoSQL.getDB();
	        	System.out.println("Obtuvo db");
//	        	String url = "https://568a6849-af1d-4d0c-b0da-1447d8cd6a81-bluemix:4748a55601e6ba1e4977cc628f27facd5cff9b5811e928fd892ab9f80dae1b88@568a6849-af1d-4d0c-b0da-1447d8cd6a81-bluemix.cloudant.com";
//	        	String username = "568a6849-af1d-4d0c-b0da-1447d8cd6a81-bluemix";
//	        	String password = "4748a55601e6ba1e4977cc628f27facd5cff9b5811e928fd892ab9f80dae1b88";
//	        	HttpClient httpClient = new StdHttpClient.Builder()
//	        			.url(url)
//	        			.username(username)
//	        			.password(password)
//	        			.build();
//	        			CouchDbInstance bd = new StdCouchDbInstance(httpClient);
//	        			//Create your DB connector.  If the DB doesn't exist, it will create it (based on the boolean)
//	        			CouchDbConnector dbc = bd.createConnector("app_thinking", true);
//	        			//Get your document from Cloudant using the _id field as the key
//	        			InputStream input = dbc.getAsStream(des.getCodigo());
//	        			
//	        				int readBytes = 0;
//	        				byte[] buffer = new byte[readBufferSize];
//	        				readBytes = input.read(buffer);
	        			
	        			/*BufferedImage bImageFromConvert = ImageIO.read(input);
	        			String imageId = request.getParameter("imageId");
	        			byte[] imageData = getImageFromDatabase(imageId);*/
//	        			response.setContentType("image/jpeg");
//	        			response.getOutputStream().write(buffer);
	        			
	        			/*OutputStream output = response.getOutputStream();

	        			try {
	        				int readBytes = 0;
	        				byte[] buffer = new byte[readBufferSize];
	        				while ((readBytes = input.read(buffer)) >= 0) {
	        					output.write(buffer, 0, readBytes);
	        				}
	        			} finally {
	        				input.close();
	        			}*/	
				JsonObject resultadoDesafioJson = desNoSQL.create(db, des.getCodigo(), des.getTitulo(), filePart, fileName);
				System.out.println("Carga del desafío completo en la BD NoSQL");
				System.out.println("resultadoDesafioJson = " + resultadoDesafioJson.toString());

			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Entro en la excepcion del no sql");
				e.printStackTrace();
			}
	        
			RequestDispatcher rd = request.getRequestDispatcher("/pages/desa.jsp");
			rd.forward(request, response);
		}
		else {
			System.out.println("Falló al insertar");
		}

	}
	
	private List<Desafio> getDesafios() {
		System.out.println("\nEntro a getDesafios() del servlet\n");
		DesafioDAO daod = new DesafioDAO();
		List<Desafio> lista_desafios = daod.RetornarDesafios();
		return lista_desafios;
	}
	
	private List<Object> getImagenesDesafio() {
		List<Object> l = new ArrayList<Object>();
		return l;
	}
	
	private String entero4Digitos(int num) {		
		if(num < 10)
			return "000" + num;
		if(num < 100)
			return "00" + num;
		if(num < 1000)
			return "0" + num;
		return "" + num;
	}
	
}
