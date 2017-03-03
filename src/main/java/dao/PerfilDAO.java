package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Perfil;
import model.ConexionBD;
import model.Validacion;

public class PerfilDAO {

	public boolean insertarPerfil(Perfil us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();

					String sql = "INSERT INTO perfil (username, nombre, apellido, telefono,"
							+ " estatus, direccion, genero) VALUES (";
					sql+= Validacion.Apost(us.getusername()) + ",";
					sql+= Validacion.Apost(us.getNombres()) + ",";
					sql+= Validacion.Apost(us.getApellidos()) + ",";
					sql+= Validacion.Apost(us.getTelefono()) + ",";
					sql+= Validacion.Apost("A")+ ",";
					sql+= Validacion.Apost(us.getDireccion()) + ",";
					sql+= us.getGenero() + ")";
					//System.out.println("fecha de nacimiento = " + us.getFechaNacimiento());
					//sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ")";
					System.out.println("Entro al registrar perfil");
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
	
	public boolean modificarPerfil(Perfil us){
		boolean modificar = false;
		String username = us.getusername();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE perfil SET";
					sql+= "username=" + Validacion.Apost(us.getusername()) + ",";
					sql+= "nombre=" + Validacion.Apost(us.getNombres()) + ",";
					sql+= "apellido=" + Validacion.Apost(us.getApellidos()) + ",";
					sql+= "telefono=" + Validacion.Apost(us.getTelefono()) + ",";
					sql+= "estatus=" + Validacion.Apost(us.getEstatus()) + ",";
					sql+= "direccion=" + Validacion.Apost(us.getDireccion()) + ",";
					sql+= "genero=" + us.getGenero() + ",";
					sql+= "fechanacimiento=" + Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaNacimiento())) + ",";
					sql+= "WHERE username =" + Validacion.Apost(username);
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
	
	public  boolean eliminarPerfil(Perfil us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE perfil SET estatus= " + Validacion.Apost("E") +"WHERE username =" + us.getusername();
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
	public Perfil RetornarPerfil(String username) {
		ResultSet usuario = null;
		Perfil us = new Perfil();
		
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM perfil WHERE estatus != 'E' and "
							+ "username ="+ Validacion.Apost(username);
					System.out.println(sql);

					usuario = st.executeQuery(sql);
					if(usuario.next()){
						 us.setusername(usuario.getString("username"));
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
		System.out.println("Retorno el perfil:" + us.getApellidos() +us.getusername() +us.getNombres());
		return us;
	}

	public List<Perfil> Retornar_Perfil_Rol(int rol){
		List<Perfil> list = new ArrayList<Perfil>();
		ResultSet usuario = null;

		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM perfil p INNER JOIN usuario u ON (u.username = p.username) WHERE u.estatus != 'E' and "
							+ "u.rol =" + rol;
					System.out.println(sql);

					usuario = st.executeQuery(sql);
					while(usuario.next()){
						 Perfil us = new  Perfil();
						 us.setusername(usuario.getString("username"));
						 System.out.println("username = " + us.getusername());
						 us.setNombres(usuario.getString("nombre"));
						 System.out.println("nombres = " + us.getNombres());
						 us.setApellidos(usuario.getString("apellido"));
						 System.out.println("apellidos = " + us.getApellidos());
						 us.setTelefono(usuario.getString("telefono"));
						 System.out.println("telefono = " + us.getTelefono());
						 us.setEstatus(usuario.getString("estatus"));
						 System.out.println("estatus = " + us.getEstatus());
						 us.setDireccion(usuario.getString("direccion"));
						 System.out.println("direccion = " + us.getDireccion());
						 us.setGenero(usuario.getInt("genero"));
						 System.out.println("genero = " + us.getGenero());
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
