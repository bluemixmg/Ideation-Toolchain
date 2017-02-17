package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import model.ConexionBD;
import model.Desafio;
import model.Validacion;

public class DesafioDAO {
	public static boolean insertarDesafio(Desafio des){
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//String sql = "INSERT INTO desafio (codigo, titulo, descripcion, categoria, fechacaducidad, tipo, rifOrganizacion, estatus) VALUES (";
					String sql = "INSERT INTO desafio (titulo, descripcion, categoria, fechacaducidad, tipo, riforganizacion, estatus) VALUES (";
					//sql+= Validacion.Apost(des.getCodigo())+",";
					sql+= Validacion.Apost(des.getTitulo())+",";
					sql+= Validacion.Apost(des.getDescripcion())+",";
					sql+= Validacion.Apost(des.getCategoria())+",";
					sql+= Validacion.Apost(new SimpleDateFormat("yyyy-MM-dd").format(des.getFechaCaducidad()))+",";
					System.out.println("Esta es la fecha que voy a enviar a la BD: " + new SimpleDateFormat("yyyy-MM-dd").format(des.getFechaCaducidad()));
					sql+= des.getTipo()+",";
					sql+= Validacion.Apost(des.getOrg())+",";
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
	
	public static boolean modificarDesafio(Desafio des) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE desafio SET ";
					sql += "titulo=" + Validacion.Apost(des.getTitulo()) + ", ";
					sql += "descripcion=" + Validacion.Apost(des.getDescripcion()) + ", ";
					sql += "categoria=" + Validacion.Apost(des.getCategoria()) + ", ";
					sql += "fechacaducidad=" + new SimpleDateFormat("yyyy-mm-dd").format(des.getFechaCaducidad()) + ", ";
					sql += "tipo=" + des.getTipo() + ", ";
					sql += "rifOrganizacion=" + Validacion.Apost(des.getOrg()) + ", ";
					sql += "estatus=" + Validacion.Apost(String.valueOf(des.getEstatus()));
					//sql += " WHERE codigo=" + Validacion.Apost(des.getCodigo());
					sql += " WHERE id=" + des.getId();
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
	
	public static boolean eliminarDesafio(Desafio des) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//String sql = "UPDATE desafio SET estatus = 'E' WHERE codigo=" + Validacion.Apost(des.getCodigo());
					String sql = "UPDATE desafio SET estatus = 'E' WHERE id=" + des.getId();
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
	
	public List<Desafio> RetornarDesafios() {
		List<Desafio> adesafios = new ArrayList<Desafio>();
		ResultSet desafios = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					System.out.println("c es distinto de null");
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM desafio WHERE estatus != 'E'";
					System.out.println("Voy a ejecutar la consulta");
					desafios = st.executeQuery(sql);
					try{
						while(desafios.next()){
							Desafio d= new Desafio();
							d.setId(desafios.getInt("id"));
							System.out.println("Id asignado: " + d.getId());
							//d.setCodigo(desafios.getString("codigo"));
							//System.out.println("Código asignado: " + d.getCodigo());
							d.setTitulo(desafios.getString("titulo"));
							System.out.println("Título asignado: " + d.getTitulo());
							d.setDescripcion(desafios.getString("descripcion"));
							System.out.println("Descripción asignada: " + d.getDescripcion());
							d.setCategoria(desafios.getString("categoria"));
							System.out.println("Categoría asignada: " + d.getCategoria());
							d.setFechaCaducidad(desafios.getDate("fechacaducidad"));
							System.out.println("Fecha asignada: " + d.getFechaCaducidad());
							d.setTipo(desafios.getBoolean("tipo"));
							System.out.println("Tipo asignado: " + d.getTipo());
							d.setOrg(desafios.getString("rifOrganizacion"));
							System.out.println("Org asignada: " + d.getOrg());
							d.setEstatus(desafios.getString("estatus").charAt(0));
							System.out.println("Estatus asignado: " + d.getEstatus());
							adesafios.add(d);
						}
					}catch(SQLException e){
						e.printStackTrace();
					}
					st.close();
					System.out.println("Cerré statement");
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		for(int i = 0; i < adesafios.size(); i++) {
			adesafios.get(i).setCantIdeas(contarIdeasPorDesafio(adesafios.get(i).getId()));
			System.out.println("Cantidad de ideas asignada del desafío " + adesafios.get(i).getId() + ": " + adesafios.get(i).getCantIdeas());
		}
		return adesafios;
	}
	
	public List<Desafio> RetornarDesafiosPorOrganizacion(String rif) {
		List<Desafio> adesafios = new ArrayList<Desafio>();
		ResultSet desafios = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					System.out.println("c es distinto de null");
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM desafio WHERE estatus != 'E' AND riforganizacion = '" + rif + "'";
					System.out.println("Voy a ejecutar la consulta");
					desafios = st.executeQuery(sql);
					try{
						while(desafios.next()){
							Desafio d= new Desafio();
							d.setId(desafios.getInt("id"));
							System.out.println("Id asignado: " + d.getId());
							//d.setCodigo(desafios.getString("codigo"));
							//System.out.println("Código asignado: " + d.getCodigo());
							d.setTitulo(desafios.getString("titulo"));
							System.out.println("Título asignado: " + d.getTitulo());
							d.setDescripcion(desafios.getString("descripcion"));
							System.out.println("Descripción asignada: " + d.getDescripcion());
							d.setCategoria(desafios.getString("categoria"));
							System.out.println("Categoría asignada: " + d.getCategoria());
							d.setFechaCaducidad(desafios.getDate("fechacaducidad"));
							System.out.println("Fecha asignada: " + d.getFechaCaducidad());
							d.setTipo(desafios.getBoolean("tipo"));
							System.out.println("Tipo asignado: " + d.getTipo());
							d.setOrg(desafios.getString("riforganizacion"));
							System.out.println("Org asignada: " + d.getOrg());
							d.setEstatus(desafios.getString("estatus").charAt(0));
							System.out.println("Estatus asignado: " + d.getEstatus());
							adesafios.add(d);
						}
					}catch(SQLException e){
						e.printStackTrace();
					}
					st.close();
					System.out.println("Cerré statement");
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		for(int i = 0; i < adesafios.size(); i++) {
			adesafios.get(i).setCantIdeas(contarIdeasPorDesafio(adesafios.get(i).getId()));
			System.out.println("Cantidad de ideas asignada del desafío " + adesafios.get(i).getId() + ": " + adesafios.get(i).getCantIdeas());
		}
		return adesafios;
	}
	
	public Desafio consultarDesafio(int id /*String cod*/) {
		Desafio des = new Desafio();
		try {
			ConexionBD bd = new ConexionBD();
			Connection con = bd.getConexion();
			if (con != null) {
				Statement st = con.createStatement();
				//String sql = "SELECT * FROM desafio WHERE codigo = '" + cod + "'";
				String sql = "SELECT * FROM desafio WHERE id = " + id;
				ResultSet rs = st.executeQuery(sql);
				if(rs.next()) {
					des.setId(rs.getInt("id"));
					System.out.println("id traído de ConsultarDesafio = " + des.getId());
					//des.setCodigo(rs.getString("codigo"));
					des.setTitulo(rs.getString("titulo"));
					des.setDescripcion(rs.getString("descripcion"));
					System.out.println("Descripción asignada: " + des.getDescripcion());
					des.setCategoria(rs.getString("categoria"));
					System.out.println("Categoría asignada: " + des.getCategoria());
					des.setFechaCaducidad(rs.getDate("fechacaducidad"));
					System.out.println("Fecha asignada: " + des.getFechaCaducidad());
					des.setTipo(rs.getBoolean("tipo"));
					System.out.println("Tipo asignado: " + des.getTipo());
					des.setOrg(rs.getString("rifOrganizacion"));
					System.out.println("Org asignada: " + des.getOrg());
					des.setEstatus(rs.getString("estatus").charAt(0));
				}
				st.close();
			}
			bd.closeConexion();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		des.setCantIdeas(contarIdeasPorDesafio(id));
		return des;
	}
	
	public int contarIdeasPorDesafio(int id /*String codDesafio*/) {
		int cantIdeas = 0;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//String sql = "SELECT count(*) as cantideas FROM idea WHERE coddesafio=" + Validacion.Apost(codDesafio);
					String sql = "SELECT count(*) as cantideas FROM idea WHERE coddesafio='" + id + "'";
					ResultSet res = st.executeQuery(sql);
					if(res.next()) {
						cantIdeas = res.getInt("cantideas");
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
		return cantIdeas;
	}
	
}
