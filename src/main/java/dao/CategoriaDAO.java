package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Categoria;
import model.Validacion;
import model.ConexionBD;


public class CategoriaDAO {

	public static boolean insertarCategoria(Categoria cat){
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO categoria (codigo, nombre, descripcion, estatus) VALUES (";
					sql+= Validacion.Apost(cat.getCodigo())+",";
					sql+= Validacion.Apost(cat.getNombre())+",";
					sql+= Validacion.Apost(cat.getDescripcion())+",";
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
	
	public static boolean modificarCategoria(Categoria cat) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE categoria SET ";
					sql += "nombre=" + Validacion.Apost(cat.getNombre()) + ", ";
					sql += "descripcion=" + Validacion.Apost(cat.getDescripcion()) + ", ";
					sql += "estatus=" + Validacion.Apost(cat.getEstatus());
					sql += "WHERE codigo="+Validacion.Apost(cat.getCodigo());
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
	
	public static boolean eliminarCategoria(Categoria cat) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE categoria SET estatus = 'E' WHERE codigo=" + Validacion.Apost(cat.getCodigo());
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
	public static boolean eliminarCategoriasPorIdea(Categoria cat) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE categoriasporidea SET estatus = 'E' WHERE codigocategoria=" + Validacion.Apost(cat.getCodigo());
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
	
	public List<Categoria> RetornarCategorias() {
		ResultSet categorias = null;
		List<Categoria> lis_cat = new ArrayList<>();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM categoria WHERE estatus != 'E' ORDER BY codigo";
					categorias = st.executeQuery(sql);
					while(categorias.next()) {
						Categoria cat = new Categoria();
						cat.setCodigo(categorias.getString("codigo"));
						System.out.println("Código de la categoría: " + cat.getCodigo());
						cat.setNombre(categorias.getString("nombre"));
						System.out.println("Nombre de la categoría: " + cat.getNombre());
						cat.setDescripcion(categorias.getString("descripcion"));
						System.out.println("Descripción de la categoría: " + cat.getDescripcion());
						cat.setEstatus(categorias.getString("estatus"));
						System.out.println("Estatus de la categoría: " + cat.getEstatus());
						lis_cat.add(cat);
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
		return lis_cat;
	}
}
