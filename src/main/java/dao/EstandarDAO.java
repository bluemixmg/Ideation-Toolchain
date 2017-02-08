package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import model.Estandar;
import model.ConexionBD;
import model.Validacion;

public class EstandarDAO {

	public boolean insertarEstandar(Estandar us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();

					String sql = "INSERT INTO estandar (email, nombre, apellido, telefono,"
							+ " estatus, direccion, genero, fechanacimiento) VALUES (";
					sql+= Validacion.Apost(us.getEmail()) + ",";
					sql+= Validacion.Apost(us.getNombres()) + ",";
					sql+= Validacion.Apost(us.getApellidos()) + ",";
					sql+= Validacion.Apost(us.getTelefono()) + ",";
					sql+= Validacion.Apost("A")+ ",";
					sql+= Validacion.Apost(us.getDireccion()) + ",";
					sql+= us.getGenero() + ",";
					System.out.println("fecha de nacimiento = " + us.getFechaNacimiento());
					sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ")";
					
					System.out.println(sql);
					
					st.executeUpdate(sql);
					st.close();
					registrado=true;
					System.out.println(sql);
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
	
	public boolean modificarEstandar(Estandar us){
		boolean modificar = false;
		String Email = us.getEmail();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE estandar SET";
					sql+= "email=" + Validacion.Apost(us.getEmail()) + ",";
					sql+= "nombre=" + Validacion.Apost(us.getNombres()) + ",";
					sql+= "apellido=" + Validacion.Apost(us.getApellidos()) + ",";
					sql+= "telefono=" + Validacion.Apost(us.getTelefono()) + ",";
					sql+= "estatus=" + Validacion.Apost(us.getEstatus()) + ",";
					sql+= "direccion=" + Validacion.Apost(us.getDireccion()) + ",";
					sql+= "genero=" + us.getGenero() + ",";
					sql+= "fechanacimiento=" + us.getFechaNacimiento() + ",";
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
	
	public  boolean eliminarEstandar(Estandar us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE estandar SET estatus= " + Validacion.Apost("E") +"WHERE email =" + us.getEmail();
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
	public Estandar RetornarEstandar(String email) {
		ResultSet usuario = null;
		Estandar us = new Estandar();
		
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM estandar WHERE estatus != 'E' and "
							+ "email ="+ Validacion.Apost(email);
					System.out.println(sql);

					usuario = st.executeQuery(sql);
					if(usuario.next()){
						 us.setEmail(usuario.getString("email"));
						 us.setNombres(usuario.getString("nombre"));
						 us.setApellidos(usuario.getString("apellido"));
						 us.setTelefono(usuario.getString("telefono"));
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

	

}
