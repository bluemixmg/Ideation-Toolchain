package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import model.Ideador;
import model.ConexionBD;
import model.Validacion;

public class IdeadorDAO {

	public boolean insertarEstandar(Ideador us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();

					String sql = "INSERT INTO ideador (email, nombre, apellido, telefono,"
							+ " estatus, direccion, genero) VALUES (";
					sql+= Validacion.Apost(us.getEmail()) + ",";
					sql+= Validacion.Apost(us.getNombres()) + ",";
					sql+= Validacion.Apost(us.getApellidos()) + ",";
					sql+= Validacion.Apost(us.getTelefono()) + ",";
					sql+= Validacion.Apost("A")+ ",";
					sql+= Validacion.Apost(us.getDireccion()) + ",";
					sql+= us.getGenero() + ")";
					//System.out.println("fecha de nacimiento = " + us.getFechaNacimiento());
					//sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ")";
					
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
	
	public boolean modificarEstandar(Ideador us){
		boolean modificar = false;
		String Email = us.getEmail();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE ideador SET";
					sql+= "email=" + Validacion.Apost(us.getEmail()) + ",";
					sql+= "nombre=" + Validacion.Apost(us.getNombres()) + ",";
					sql+= "apellido=" + Validacion.Apost(us.getApellidos()) + ",";
					sql+= "telefono=" + Validacion.Apost(us.getTelefono()) + ",";
					sql+= "estatus=" + Validacion.Apost(us.getEstatus()) + ",";
					sql+= "direccion=" + Validacion.Apost(us.getDireccion()) + ",";
					sql+= "genero=" + us.getGenero() + ",";
					sql+= "fechanacimiento=" + Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ",";
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
	
	public  boolean eliminarEstandar(Ideador us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE ideador SET estatus= " + Validacion.Apost("E") +"WHERE email =" + us.getEmail();
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
	public Ideador RetornarEstandar(String email) {
		ResultSet usuario = null;
		Ideador us = new Ideador();
		
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM ideador WHERE estatus != 'E' and "
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
