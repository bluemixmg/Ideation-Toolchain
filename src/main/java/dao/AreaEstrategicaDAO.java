package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import model.ConexionBD;
import model.AreaEstrategica;
import model.Validacion;

public class AreaEstrategicaDAO {
	
	public static boolean insertarAreaEstrategica(AreaEstrategica ae) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO areaestrategica (codareaest, descripcion, estatus) VALUES (";
					sql+= ae.getCodigo() + ",";
					sql+= Validacion.Apost(ae.getDescripcion())+",";
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
	
	public static boolean modificarAreaEsrategica(AreaEstrategica ae) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areaestrategica SET ";
					sql+= "descripcion=" + Validacion.Apost(ae.getDescripcion());
					sql+= " WHERE codareaest=" + Validacion.Apost(Integer.toString(ae.getCodigo()));
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
	
	public static boolean eliminarAreaEstrategica(AreaEstrategica ae) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areaestrategica SET estatus = 'E' WHERE codAreaEst=" + ae.getCodigo();
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
