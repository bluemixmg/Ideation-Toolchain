package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Asociado;
import model.ConexionBD;
import model.Validacion;

public class AsociadoDAO {
	
	public boolean insertarAsociado(Asociado us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					System.out.println("Antes de insertar un asociado");
					String sql = "INSERT INTO asociado (email, nombre, apellido, telefono, cargo, "
							+ "riforganizacion, estatus, direccion, genero, fechanacimiento) VALUES (";
					sql+= Validacion.Apost(us.getEmail()) + ",";
					sql+= Validacion.Apost(us.getNombres()) + ",";
					sql+= Validacion.Apost(us.getApellidos()) + ",";
					sql+= Validacion.Apost(us.getTelefono()) + ",";
					sql+= Validacion.Apost(us.getCargo()) + ",";
					sql+= Validacion.Apost(us.getRifOrganizacion()) + ",";
					sql+= Validacion.Apost("A")+",";
					sql+= Validacion.Apost(us.getDireccion()) + ",";
					sql+= us.getGenero() + ",";
					sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ")";
					System.out.println(sql);
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
	
	public boolean modificarAsociado(Asociado us){
		boolean modificar = false;
		String Email = us.getEmail();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE asociado SET";
					sql+= "email=" + Validacion.Apost(us.getEmail()) + ",";
					sql+= "nombre=" + Validacion.Apost(us.getNombres()) + ",";
					sql+= "apellido=" + Validacion.Apost(us.getApellidos()) + ",";
					sql+= "telefono=" + Validacion.Apost(us.getTelefono()) + ",";
					sql+= "cargo=" + Validacion.Apost(us.getCargo()) + ",";
					sql+= "estatus=" + Validacion.Apost(us.getEstatus()) + ",";
					sql+= "direccion=" + Validacion.Apost(us.getDireccion()) + ",";
					sql+= "genero=" + us.getGenero() + ",";
					sql+= "fechanacimiento=" + Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ")" + ",";
					sql+= "WHERE email =" + Validacion.Apost(Email);
					st.executeUpdate(sql);
					st.close();
					modificar=true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			modificar=false;
			e.printStackTrace();
			
		}
		return modificar;
	}
	
	public  boolean eliminarAsociado(Asociado us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE asociado SET estatus= " + Validacion.Apost("E") +"WHERE email =" + us.getEmail();
					st.executeUpdate(sql);
					st.close();
					modificar=true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			modificar=false;
			e.printStackTrace();
			
		}
		return modificar;
	}
	
	
//-----------SUJETOS A CAMBIOS-----------
	public Asociado RetornarAsociado(String email) {
		ResultSet usuario = null;
		Asociado us = new Asociado();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
									
					String sql = "SELECT * FROM empleado WHERE estatus != 'E' and "
							+ "email="+ Validacion.Apost(email) ;
					System.out.println(sql);
					usuario = st.executeQuery(sql);
					
					if(usuario.next()){
						 us.setEmail(usuario.getString("email"));
						 us.setNombres(usuario.getString("nombre"));
						 us.setApellidos(usuario.getString("apellido"));
						 us.setTelefono(usuario.getString("telefono"));
						 us.setCargo(usuario.getString("cargo"));
						 us.setRifOrganizacion(usuario.getString("riforganizacion"));
						 System.out.println("Este es el rif traido por el asociado: " +usuario.getString("riforganizacion"));
						 us.setEstatus(usuario.getString("estatus"));
						 us.setDireccion(usuario.getString("direccion"));
						 us.setGenero(usuario.getInt("genero"));						 
					}
					st.close();
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return us;
	}
	
	public List<Asociado> RetornarListaAsociado(String rif) {
		ResultSet usuario = null;
		Asociado us = new Asociado();
		List<Asociado> list = new ArrayList<Asociado>();
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
									
					String sql = "SELECT * FROM empleado WHERE estatus != 'E' and "
							+ " riforganizacion = "+ Validacion.Apost(rif) ;
					System.out.println(sql);
					usuario = st.executeQuery(sql);
					
					while(usuario.next()){
						 us.setEmail(usuario.getString("email"));
						 us.setNombres(usuario.getString("nombre"));
						 us.setApellidos(usuario.getString("apellido"));
						 us.setTelefono(usuario.getString("telefono"));
						 us.setCargo(usuario.getString("cargo"));
						 us.setRifOrganizacion(usuario.getString("riforganizacion"));
						 System.out.println("Este es el rif traido por el asociado: " +usuario.getString("riforganizacion"));
						 us.setEstatus(usuario.getString("estatus"));
						 us.setDireccion(usuario.getString("direccion"));
						 us.setGenero(usuario.getInt("genero"));	
						 list.add(us);
					}
					st.close();
					
					
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	

}
