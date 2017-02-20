package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.ConexionBD;
import model.User;
import model.Validacion;
import model.Desafio;
import dao.DesafioDAO;

public class EvaluadoresDesafioDAO {

	
	public EvaluadoresDesafioDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public List<Desafio> desafiosEvaluador(User evaluador){
		ResultSet rs = null;
		Desafio desafio;
		DesafioDAO desdao = new DesafioDAO();
		List<Desafio> desafios_ev = new ArrayList<Desafio>();
		try{
			try{
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!=null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT iddesafio FROM evaluadoresdesafio WHERE evaluador= "+Validacion.Apost(evaluador.getUsername())+"";
					rs = st.executeQuery(sql);
					while(rs.next()){
						desafio = new Desafio();
						desafio = desdao.consultarDesafio(rs.getInt("iddesafio"));	
						desafios_ev.add(desafio);
						
					}
					st.close();
				}
				bd.closeConexion();
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}		
		return desafios_ev;
	}
	
}
