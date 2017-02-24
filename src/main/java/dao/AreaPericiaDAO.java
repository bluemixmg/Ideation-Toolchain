package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import model.ConexionBD;
import model.AreaPericia;
import model.Validacion;

public class AreaPericiaDAO {
	public static boolean insertarAreaPericia(AreaPericia ap) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO areadepericia (descripcion, estatus) VALUES (";
					sql+= Validacion.Apost(ap.getDescripcion())+",";
					sql+= Validacion.Apost("A")+")";
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
	
	public static boolean modificarAreaPericia(AreaPericia ap) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areadepericia SET ";
					sql+= "descripcion=" + Validacion.Apost(ap.getDescripcion());
					sql+= " WHERE codigoarea=" + ap.getCodigo();
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
	
	public static boolean eliminarAreaPericia(AreaPericia ap) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					
			//TODO Eliminacion Fisica 
					 
					//TODO Eliminacion los registros de Areas Por Evaluador asociados a el area a eliminar 
					Statement sp;
					sp = c.createStatement();
					String sql1 = "DELETE  FROM areasporevaluador WHERE codarea=" + ap.getCodigo() ;
					sp.executeUpdate(sql1);
					sp.close();
					eliminado = true;
					
		//-------------------------------------------------------------------------------------------
					
					Statement st;
					st = c.createStatement();
					String sql = "DELETE FROM areadepericia WHERE codigoarea=" + ap.getCodigo() ;
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
