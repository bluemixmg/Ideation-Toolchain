package dao;

import model.Organizacion;
import model.AreaEstrategica;
import model.ConexionBD;
import model.Validacion;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class OrganizacionDAO {
	

	public OrganizacionDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static boolean insertarOrganizacion(Organizacion org){
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO organizacion (username, rif, razonsocial, direccion, telefono, sucursal, rifmatriz, nombre) VALUES (";
					sql+= Validacion.Apost(org.getUsername())+",";
					sql+= Validacion.Apost(org.getRif())+",";
					sql+= Validacion.Apost(org.getRazonSocial())+",";
					sql+= Validacion.Apost(org.getDireccion())+",";
					sql+= Validacion.Apost(org.getTelefono())+",";
					sql+= org.isSucursal()+",";
					sql+= Validacion.Apost(org.getRifOrgMatriz())+",";
					sql+= Validacion.Apost(org.getNombre())+",";
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
	
	public static boolean eliminarOrganizacion(Organizacion org) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE organizacion SET estatus = 'E' WHERE rif=" + Validacion.Apost(org.getRif());
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
	
	public static boolean insertarAreaPorOrganizacion(AreaEstrategica ae, Organizacion org) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO areaspororganizacion (codareaest, riforganizacion, estatus) VALUES (";
					sql+= ae.getCodigo() + ",";
					sql+= Validacion.Apost(org.getRif())+",";
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
	
	public static boolean eliminarAreaPorOrganizacion(AreaEstrategica ae, Organizacion org) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE areaspororganizacion SET estatus = 'E' WHERE codareaest = " + ae.getCodigo() + " AND rifOrganizacion = " + Validacion.Apost(org.getRif());
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
	
	
	public Organizacion BuscarOrganizacion(String rif){
		Organizacion org = new Organizacion();
		org= null;
		ResultSet rs = null;
		
		ConexionBD bd;
		try {
			bd = new ConexionBD();
			Connection c = bd.getConexion();
			if(c!= null){
				
				System.out.println("Estoy en el BuscarOrganizacion");
				
				Statement st;
				st = c.createStatement();
				String sql = "SELECT * FROM organizacion WHERE rif="+Validacion.Apost(rif.trim());
				System.out.println("Este es el sql de organizacion: " + sql);
				rs = st.executeQuery(sql);

				
				if(rs.next()){
//					org.setUsername(rs.getString("username"));
					org.setRif(rs.getString("rif"));
					org.setNombre(rs.getString("nombre"));
					org.setRazonSocial(rs.getString("razonsocial"));
					org.setDireccion(rs.getString("direccion"));
					org.setTelefono(rs.getString("telefono"));
					org.setSucursal(rs.getBoolean("sucursal"));
					org.setRifOrgMatriz(rs.getString("rifmatriz"));
					st.close();
					bd.closeConexion();
					return org;
				}

			} 
			bd.closeConexion();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return org=null;
		
	}
	
}
