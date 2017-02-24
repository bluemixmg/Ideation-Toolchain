package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpleadoDAO;
import dao.PerfilDAO;
import model.Empleado;
import model.Perfil;
import model.User;

/**
 * Servlet implementation class PerfilServlet
 */
@WebServlet(name = "PerfilServlet", urlPatterns = { "/PerfilServlet" })
public class PerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	User user = (User) session.getAttribute("user");
    	RequestDispatcher rq;
    	
    	switch(user.getrol()){
			case 1: 
				PerfilDAO  idao = new PerfilDAO();
				Perfil perfil = new Perfil() ;
				perfil = idao.RetornarPerfil(user.getEmail());
				session.setAttribute("perfil", perfil);
				 rq = request.getRequestDispatcher("/pages/perfil.jsp");
				rq.forward(request, response);
			break;
			case 2:
				EmpleadoDAO edao = new EmpleadoDAO();
				Empleado emp = new Empleado();
				emp = edao.RetornarEmpleado(user.getEmail());
				rq = request.getRequestDispatcher("/pages/perfil.jsp");
				rq.forward(request, response);
			
    	}

    			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
