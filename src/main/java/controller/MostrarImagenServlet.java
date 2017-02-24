package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdeaDAO;
import model.Idea;

/**
 * Servlet implementation class MostrarImagenServlet
 */
@WebServlet("/MostrarImagenServlet")
public class MostrarImagenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarImagenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_aux = request.getParameter("id");
		int id=Integer.parseInt(id_aux);
		IdeaDAO ideaDao = new IdeaDAO();
		Idea idea = new Idea();
		idea = (Idea)ideaDao.getUnaIdea(id);
		byte[] imagen = idea.getImagen();
		response.getOutputStream().write(imagen);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
