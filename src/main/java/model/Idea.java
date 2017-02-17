package model;

import java.util.ArrayList;

public class Idea {
	private String codigo;
	private String titulo;
	private String descripcion;
	private int cantVotos; //Cantidad de votos
	private String idAutor; //Rif o ID del autor de la idea
	private String codDesafio; //Codigo del desafio al cual pertenece la idea
	private char estatus; //Este valor vendra desde la BD para definir la etapa en la que encuentra la idea
	private ArrayList<String> palabrasClave; //Palabras clave de una idea
	private ArrayList<Integer> categorias; //
	//Constructor sin parametros
	public Idea() {
		// TODO Auto-generated constructor stub
	}
	//Constructor para crear una idea que se esta trayendo desde la base de datos y ya todos los campos estan llenos 
	public Idea(String codigo, String titulo, String descripcion, int cantVotos, String idAutor, String codDesafio, ArrayList<String> palabras, ArrayList<Integer> categorias,char estatus) {
		super();
		this.codigo = codigo;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.cantVotos = cantVotos;
		this.idAutor = idAutor;
		this.codDesafio = codDesafio;
		this.palabrasClave = palabras;
		this.categorias = categorias;
		this.estatus = estatus;
	}
	//Constructor para crear una idea inicial, es decir, sin la cantidad de votos
	public Idea(String codigo, String titulo, String descripcion, String idAutor, String codDesafio, char estatus) {
		super();
		this.codigo = codigo;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.idAutor = idAutor;
		this.codDesafio = codDesafio;
		this.estatus = estatus;
	}

	//Getter & Setter
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCantVotos() {
		return cantVotos;
	}

	public void setCantVotos(int cantVotos) {
		this.cantVotos = cantVotos;
	}

	public String getIdAutor() {
		return idAutor;
	}

	public void setIdAutor(String idAutor) {
		this.idAutor = idAutor;
	}

	public String getCodDesafio() {
		return codDesafio;
	}

	public void setCodDesafio(String codDesafio) {
		this.codDesafio = codDesafio;
	}
	public char getEstatus() {
		return estatus;
	}
	public void setEstatus(char estatus) {
		this.estatus = estatus;
	}
	public ArrayList<String> getPalabrasClave() {
		return palabrasClave;
	}
	public void setPalabrasClave(ArrayList<String> palabrasClave) {
		this.palabrasClave = palabrasClave;
	}
	
	public void setUnaPalabraClave(String palabra){
		this.palabrasClave.add(palabra);
	}
	
	public String getUnaPalabraClave(int pos){
		return this.palabrasClave.get(pos);
	}
	public ArrayList<Integer> getCategorias() {
		return categorias;
	}
	public void setCategorias(ArrayList<Integer> categorias) {
		this.categorias = categorias;
	}
	
	public void setUnaCategoria(int categoria){
		this.categorias.add(categoria);
	}
	
	public int getUnaCategoria(int pos){
		return this.categorias.get(pos);
	}
	
	public String getNombreEstatus(char e){
		String s="";
		
		switch(e){
		case 'A': s= "Activa";
	break;
		case 'E': s= "Eliminada";
	break;
		case 'V': s= "En Evaluacion";
	break;
		case 'I': s="Implementada";
	break;
		case 'D': s= "Descartada";
	break;
		case 'F': s= "Finalizada";
	break;
		default: s= "No se encuentra el estado especificado";
		}
		System.out.println(s);
		return s;
	}
}
