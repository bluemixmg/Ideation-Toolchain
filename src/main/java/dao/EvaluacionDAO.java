package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.ResultSet;
import model.ConexionBD;
import model.Evaluacion;
import model.Validacion;

public class EvaluacionDAO {
	
	public static boolean registrarEvaluacion(Evaluacion evaluacion){		
		boolean registrado=false;
		try{
			
			try{
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!=null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO evaluacion (evaluador_username, impacto, factibilidad, detalle_evaluacion, fecha, codigo_idea) VALUES (";
					sql+= Validacion.Apost(evaluacion.getUsername())+",";
					sql+= evaluacion.getImpacto()+",";
					sql+= evaluacion.getFactibilidad()+",";
					sql+= Validacion.Apost(evaluacion.getDetalle())+",";
					sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(evaluacion.getFecha()))+",";
					sql+= evaluacion.getIdea_id()+")";
					st.executeUpdate(sql);
					st.close();
					registrado=true;
				}
				
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}catch(SQLException e){
			registrado=false;
			e.printStackTrace();
			
		}
		
		return registrado;
	}

}
