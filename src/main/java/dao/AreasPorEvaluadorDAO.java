package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import model.ConexionBD;
import model.User;
import model.AreaPericia;
import model.Validacion;

public class AreasPorEvaluadorDAO {
	public static boolean insertarAreaPorEvaluador(AreaPericia ap, User us, int annosexperiencia) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO areasporevaluador (codarea, rifev, annosexperiencia) VALUES (";
					sql+= ap.getCodigo() + ",";
					sql+= Validacion.Apost(us.getUsername()) + "," ;
					sql+= annosexperiencia + ")";
					
					//TODO Hay un problema con los años de experiencia
					
					sql+= Validacion.Apost("A")+");";
					st.executeUpdate(sql);
					st.close();
					registrado=true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			registrado=false;
			e.printStackTrace();
			
		}
		return registrado;
	}
	
	public static boolean modificarAreasPorEvaluador(AreaPericia ap,  User us, int annosexperiencia) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areasporevaluador SET ";
					//sql+= "codarea= " + ap.getCodigo() + ",";
					sql+= "usuariousername= " + Validacion.Apost(us.getUsername())+",";
					sql+= "annosexperiencia= " + annosexperiencia+",";
					sql+= "WHERE codarea= " + ap.getCodigo()+ ",";
					//TODO Hay un problema con los años de experiencia
					
					st.executeUpdate(sql);
					st.close();
					modificado = true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			modificado = false;
		}
		return modificado;
	}
	
	public static boolean eliminarEvaluador(AreaPericia ap,  User us) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areasporevaluador SET estatus = 'E' WHERE codarea=" + ap.getCodigo() + " AND usuariousername=" + Validacion.Apost(us.getUsername());
					st.executeUpdate(sql);
					st.close();
					eliminado = true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			eliminado = false;
		}
		return eliminado;
	}
	
}
