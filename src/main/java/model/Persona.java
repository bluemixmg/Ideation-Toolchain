package model;

import java.util.Date;

public class Persona {
	
	protected String username;
	protected String nombres;
	protected String apellidos;
	protected String telefono;
	protected String direccion;
	protected Date fechaNacimiento;
	protected int genero; // 0 mujer 1 hombre
	protected String estatus;

	
	//Constructor basico, solo con la informacion basica de contacto
	public Persona(String username, String nombres, String apellidos, String telefono, String direccion, String estatus) {
		super();
		this.username = username;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.direccion = direccion;
		this.estatus = estatus;
	}

	//Constructor CON TODOS LOS DATOS
	public Persona(String username, String nombres, String apellidos, String telefono, String direccion,
			Date fechaNacimiento, int genero, String estatus) {
		super();
		this.username = username;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.direccion = direccion;
		this.fechaNacimiento = fechaNacimiento;
		this.genero = genero;
		this.estatus = estatus;

	}


	public Persona() {
		// TODO Auto-generated constructor stub
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public int getGenero() {
		return genero;
	}

	public void setGenero(int genero) {
		this.genero = genero;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	

}
