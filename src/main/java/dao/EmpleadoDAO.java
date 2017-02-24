package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Empleado;
import model.ConexionBD;
import model.Validacion;

public class EmpleadoDAO {
	
	public boolean insertarEmpleado(Empleado us){
		boolean registrado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					System.out.println("Antes de insertar un empleado");
					String sql = "INSERT INTO empleado (username, cargo, "
							+ "riforganizacion, tipo, estatus) VALUES (";
					sql+= Validacion.Apost(us.getUsername()) + ",";
					sql+= Validacion.Apost(us.getCargo()) + ",";
					sql+= Validacion.Apost(us.getRifOrganizacion()) + ",";
					sql+= us.getTipo() + ",";
					sql+= Validacion.Apost("A")+")";

					System.out.println("Inserta Empleado" + sql);
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
	
	public boolean modificarEmpleado(Empleado us){
		boolean modificar = false;
		String username = us.getUsername();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE empleado SET";
					sql+= "username=" + Validacion.Apost(us.getUsername()) + ",";
					sql+= "cargo=" + Validacion.Apost(us.getCargo()) + ",";
					sql+= "estatus=" + Validacion.Apost(Character.toString(us.getStatus())) + ",";
					sql+= "riforganizacion=" + Validacion.Apost(us.getRifOrganizacion()) + ",";
					sql+= "tipo=" + us.getTipo() + ")" + ",";
					sql+= "WHERE usrname =" + Validacion.Apost(username);
					System.out.println(sql);
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
	
	public  boolean eliminarEmpleado(Empleado us){
		boolean modificar = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE empleado SET estatus= " + Validacion.Apost("E") +"WHERE username =" + us.getUsername();
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
	public Empleado RetornarEmpleado(String email) {
		ResultSet usuario = null;
		Empleado us = new Empleado();
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
						 us.setUsername(usuario.getString("username"));
						 us.setCargo(usuario.getString("cargo"));
						 us.setRifOrganizacion(usuario.getString("riforganizacion"));
						 System.out.println("Este es el rif traido por el empleado: " +usuario.getString("riforganizacion"));
						 String estatus = usuario.getString("estatus");
						 us.setTipo(estatus.charAt(0));
						 us.setTipo(usuario.getInt("tipo"));
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
	
	public List<Empleado> RetornarListaEmpleado(String rif) {
		ResultSet usuario = null;
		List<Empleado> list = new ArrayList<Empleado>();
		
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
						Empleado us = new Empleado();
						 us.setUsername(usuario.getString("username"));
						 us.setCargo(usuario.getString("cargo"));
						 us.setRifOrganizacion(usuario.getString("riforganizacion"));
						 System.out.println("Este es el rif traido por el empleado: " +usuario.getString("riforganizacion"));
						 String estatus = usuario.getString("estatus");
						 us.setTipo(estatus.charAt(0));
						 us.setTipo(usuario.getInt("tipo"));
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
