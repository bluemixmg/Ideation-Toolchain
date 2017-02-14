package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User us = new User();
		UserDAO usdao = new UserDAO();
		String usuario, password;
		RequestDispatcher rq = null;

		usuario = request.getParameter("usuario");
		usuario = usuario.toLowerCase();
		password =  request.getParameter("pass");

		System.out.println("Entro al servlet");
		password =  request.getParameter("pass");

	
		if(usdao.validarUsuario(usuario.trim(), password)){
			HttpSession session = request.getSession(true);
			us = usdao.buscarUser(usuario.trim());
			session.setAttribute("user", us);
			
			response.getWriter().print("Entro a la session");
			

			System.out.println("Atributos del USER: "+ usuario + password + us.getEmail().trim() + us.getPassword() + us.getTipo());

			switch(us.getTipo()){
				case 1:
					rq = request.getRequestDispatcher("/pages/desa.jsp");
					break;
				case 2:
					rq = request.getRequestDispatcher("/pages/desa.jsp");
					break;
				case 3: 
					 rq = request.getRequestDispatcher("/EvaluadorServlet");
					 break;
				case 4:
					 rq = request.getRequestDispatcher("/OrganizacionServlet");
					 break;
				case 0:
					 rq = request.getRequestDispatcher("/pages/" + "");
					 break;
				default:
					System.out.println("Entro por defecto");
			}
			
			rq.forward(request, response);
		}else{
			 rq = request.getRequestDispatcher("/pages/" + "login.jsp");
			 rq.forward(request, response);
			 request.setAttribute("error", false);
			 }
		
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
		doPost(request, response);

		
    }
	

}
