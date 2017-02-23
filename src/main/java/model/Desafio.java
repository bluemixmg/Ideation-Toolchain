package model;

import java.util.Date;

public class Desafio {
	private int id;
	//private String codigo;
	private String titulo;
	private String descripcion;
	private boolean tipo; //false=Publico true=Privado
	//private int duracion; //Cantidad de dias que durara el desafio
	private Date fechaCaducidad; //Fecha de inicio del desafio
	private String categoria;
	private String org;
	private char estatus;
	private int cantIdeas;
	
	public Desafio() {
		// TODO Auto-generated constructor stub
	}

	/*public Desafio(String codigo, String titulo, String descripcion, boolean tipo, //int duracion,
	  				Date fechaInicio,	String categoria, String org) {
		super();
		this.codigo = codigo;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.tipo = tipo;
		//this.duracion = duracion;
		this.fechaCaducidad = fechaInicio;
		this.categoria = categoria;
		this.org = org;
	}*/
	
	//Constructor con todos los parametros
	public Desafio(int id, String titulo, String descripcion, boolean tipo, Date fechaCaducidad,
			String categoria, String org, char estatus, int cantIdeas) {
		super();
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.fechaCaducidad = fechaCaducidad;
		this.categoria = categoria;
		this.org = org;
		this.estatus = estatus;
		this.cantIdeas = cantIdeas;
	}

	//Constructor sin Organizacion
	public Desafio(int id, String titulo, String descripcion, boolean tipo, /*int duracion, */Date fechaInicio,
			String categoria, char estatus, int cantIdeas) {
		super();
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.tipo = tipo;
		//this.duracion = duracion;
		this.fechaCaducidad = fechaInicio;
		this.categoria = categoria;
	}
	
	//Getter y Setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean getTipo() {
		return tipo;
	}

	public void setTipo(boolean tipo) {
		this.tipo = tipo;
	}

//	public int getDuracion() {
//		return duracion;
//	}

//	public void setDuracion(int duracion) {
//		this.duracion = duracion;
//	}

	public Date getFechaCaducidad() {
		return fechaCaducidad;
	}

	public void setFechaCaducidad(Date fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public void setCategoriaServlet(String categoria) {
		int cat = Integer.parseInt(categoria);
		categoria = "C-";
		if(cat <= 9) {
			categoria += "00";
		}
		else if(cat <= 99) {
			categoria += "0";
		}
		this.categoria = categoria + cat;
	}
	
	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}
	
	public char getEstatus() {
		return estatus;
	}
	
	public void setEstatus(char estatus) {
		this.estatus = estatus;
	}
	
	public String getEstatusCompleto() {
		switch(this.estatus) {
		case 'A':
			return "Activo";
		case 'E':
			return "Eliminado";
		case 'S':
			return "Selección";
		case 'I':
			return "Implementación";
		case 'F':
			return "Finalizado";
		default:
			return "Desconocido";
		}
	}
	
	public String getTipoString() {
		if(this.tipo) {
			return "Privado";
		}
		return "Público";
	}
	
	public int getCantIdeas() {
		return cantIdeas;
	}
	
	public void setCantIdeas(int cantIdeas) {
		this.cantIdeas = cantIdeas;
	}
	
	public long[] getTiempoRestante() {
		//Tiempo restante se define en días, horas y minutos, en ese orden
		long[] tiempo = {0, 0, 0};
		Date hoy = new Date();
		long milisegundos = fechaCaducidad.getTime() - hoy.getTime();
		if (milisegundos > 0) {
			tiempo[2] = milisegundos / (1000 * 60); //conversión a minutos
			tiempo[1] = tiempo[2] / 60; //conversión a horas
			tiempo[0] = tiempo[1] / 24; //conversión a días
			tiempo[2] %= 60;
			tiempo[1] %= 24;
		}
		return tiempo;
	}

}
