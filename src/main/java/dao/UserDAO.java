package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Asociado;
import model.ConexionBD;
import model.User;
import model.Validacion;

public class UserDAO {
	public boolean insertarUsuario(User us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();

					String sql = "INSERT INTO usuario (username, email, pass, tipo)	VALUES (";
					sql+= Validacion.Apost(us.getUsername()) + ",";
					sql+= Validacion.Apost(us.getEmail()) + ",";
					sql+= Validacion.Apost(us.getPassword()) + ",";
					sql+= us.getTipo() + ")";
					
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
	
	
	public  boolean eliminarUser(User us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE user SET estatus= " + Validacion.Apost("E") +
							"WHERE email=" + us.getEmail();
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

	
	public boolean validarUsuario(String username, String password)
	{
		boolean correcto= false;
		ResultSet usuario; 
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();					
					//Verificacion  con el correo y la clave 

					String sql = "SELECT * FROM usuario WHERE (email="+Validacion.Apost(username)
					+"  or username = " + Validacion.Apost(username) + ") and pass="+ Validacion.Apost(password);	
					usuario = st.executeQuery(sql);
						System.out.println("Hizo la consulta" + sql);
					if(usuario.next()){
						 correcto = true;
						System.out.println("Encontro y va al true ");
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
	
		return correcto;		
	}

	public User buscarUser(String username) {
		ResultSet usuario = null;
		User us = new User();
		
		
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM usuario WHERE email="+Validacion.Apost(username) + "or username = "
						+	Validacion.Apost(username);
					System.out.println(sql);
					usuario = st.executeQuery(sql);

					if(usuario.next()){
						if (usuario!=null){
							us.setEmail(usuario.getString("email"));
							us.setPassword(usuario.getString("pass"));
							us.setTipo(usuario.getInt("tipo"));
							us.setUsername(usuario.getString("username"));	
							return us;
						}
					}
					st.close();
					bd.closeConexion();
					
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
