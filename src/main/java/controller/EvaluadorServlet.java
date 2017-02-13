package controller;

import model.Organizacion;
import model.Desafio;

import java.io.IOException;

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
		HttpSession session = request.getSession();
		RequestDispatcher rd = request.getRequestDispatcher("/pages/" + EVALUADOR_JSP);
		rd.forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


}
