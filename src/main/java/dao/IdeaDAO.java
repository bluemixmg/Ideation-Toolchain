package dao;

import java.awt.HeadlessException;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.ConexionBD;
import model.Idea;
import model.Validacion;

public class IdeaDAO {
	
	
	public IdeaDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean insertarIdea(Idea idea) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				
					//(codigo, titulo, descripcion, cantidadvotos, autor, coddesafio, estatus)
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO idea (titulo, descripcion, cantidadvotos, autor, coddesafio, estatus) VALUES (";
					sql+= Validacion.Apost(idea.getTitulo())+", ";
					sql+= Validacion.Apost(idea.getDescripcion())+", ";
					sql+= idea.getCantVotos()+", ";
					sql+= Validacion.Apost(idea.getIdAutor())+", ";
					sql+= idea.getCodDesafio()+", ";
					sql+= Validacion.Apost("A")+");";
					st.executeUpdate(sql);
					st.close();
					registrado=true;
				
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
	
	public boolean insertarIdeaConImagen(Idea idea) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
					//(codigo, titulo, descripcion, cantidadvotos, autor, coddesafio, estatus)
					PreparedStatement ps;
					
					String sql = "INSERT INTO idea (titulo, descripcion, cantidadvotos, idautor, estatus, coddesafio, url_imagen) VALUES(?, ?, ?, ?, ?, ?, ?)";
					ps = c.prepareStatement(sql);
					ps.setString(1,idea.getTitulo());
					ps.setString(2, idea.getDescripcion());
					ps.setInt(3, idea.getCantVotos());
					ps.setString(4, idea.getIdAutor());
					ps.setString(5, "A");
					ps.setInt(6, idea.getCodDesafio());
					ps.setBytes(7,  idea.getImagen());
					ps.execute();
					ps.close();
					registrado=true;
				
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}catch(SQLException | NumberFormatException | HeadlessException x){
			registrado=false;
			x.printStackTrace();
		}
		return registrado;
	}
	
	public boolean modificarIdea(Idea idea){
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				Statement st=null;
				if(c!= null){
					st = c.createStatement();
					String sql = "UPDATE idea SET ";
					sql += "titulo=" + Validacion.Apost(idea.getTitulo()) + ", ";
					sql += "descripcion=" + Validacion.Apost(idea.getDescripcion()) + ", ";
					sql += "estatus=" + Validacion.Apost(String.valueOf(idea.getEstatus()));
					sql += "WHERE codigo="+idea.getCodigo();
					st.executeUpdate(sql);
					
					modificado = true;
				}
				st.close();	
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
	
	public boolean eliminarIdea(Idea idea) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE idea SET estatus = 'E' WHERE codigo=" +idea.getCodigo();
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
	
	public List<Idea> retornarIdeasPorDesafio(int codDesafio) {
		ResultSet ideas = null;
		List<Idea> lis_i = new ArrayList<>();
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM idea WHERE estatus != 'E' AND coddesafio="+codDesafio+ " ORDER BY cantidadvotos DESC";
					ideas = st.executeQuery(sql);
					while (ideas.next()) {
						Idea idea = new Idea();
						idea.setCodigo(ideas.getInt("codigo"));
						idea.setTitulo(ideas.getString("titulo"));
						idea.setDescripcion(ideas.getString("descripcion"));
						idea.setCantVotos(ideas.getInt("cantidadvotos"));
						idea.setIdAutor(ideas.getString("autor"));
						idea.setCodDesafio(ideas.getInt("coddesafio"));
						idea.setEstatus(ideas.getString("estatus").charAt(0));
						lis_i.add(idea);
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
		return lis_i;
	}

	public int retornarVotacionesTotalesPorIdeasDeDesafio(int codDesafio) {
		ResultSet votaciones;
		int votos = 0;
		try {
			ConexionBD bd = new ConexionBD();
			Connection c = bd.getConexion();
			if (c != null) {
				Statement st;
				st = c.createStatement();
				String sql = "SELECT sum(cantidadvotos) AS votos FROM idea WHERE estatus != 'E' AND coddesafio="+codDesafio;
				votaciones = st.executeQuery(sql);
				if (votaciones.next()) {
					votos = votaciones.getInt("votos");
				}
				st.close();
			}
			bd.closeConexion();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return votos;
	}
	

	public boolean buscarIdea(int id){
		ResultSet idea = null;
		boolean encontro=false;
		try{
			try{
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM idea WHERE estatus != 'E' AND codigo="+id;
					idea = st.executeQuery(sql);
					
					if(idea.next())
						encontro=true;
					st.close();
				}
				bd.closeConexion();
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return encontro;
	}

	public Idea getUnaIdea(int id){
		ResultSet idea = null;
		Idea i= new Idea();
		try{
			try{
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM idea WHERE estatus != 'E' AND codigo="+id;
					idea = st.executeQuery(sql);
					
					while (idea.next()) {
						i.setCodigo(idea.getInt("codigo"));
						i.setTitulo(idea.getString("titulo"));
						i.setDescripcion(idea.getString("descripcion"));
						i.setCantVotos(idea.getInt("cantidadvotos"));
						i.setIdAutor(idea.getString("autor"));
						i.setCodDesafio(idea.getInt("coddesafio"));
						i.setEstatus(idea.getString("estatus").charAt(0));
					}
					st.close();
				}
				bd.closeConexion();
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return i;
	}

	public boolean insertarCategoriasPorIdea(int codigoCategoria, int codigoIdea){
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO categoriasporidea (codigocategoria, codigoidea, estatus) VALUES (";
					sql+= codigoCategoria+",";
					sql+= codigoIdea+",";
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
	public ArrayList<String> getCategoriasPorIdea(int codigoIdea){
		ResultSet cate = null;
		ArrayList<String> categorias = new ArrayList<String>();
		try{
			try{
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT nombre FROM categoria, categoriasporidea WHERE codigocategoria = codigo AND codigoidea ="+codigoIdea;
					cate = st.executeQuery(sql);
					while (cate.next())
						categorias.add(cate.getString("nombre"));
					st.close();
					
				}
				bd.closeConexion();
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categorias ;
	}
		
}
