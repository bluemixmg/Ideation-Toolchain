package model;

import java.util.Date;

public class Ideador extends Persona{

	public Ideador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ideador(String email, String nombres, String apellidos, String telefono, String direccion, String estatus) {
		super(email, nombres, apellidos, telefono, direccion, estatus);
		// TODO Auto-generated constructor stub
	}

	public Ideador(String email, String nombres, String apellidos, String telefono, String direccion,
			Date fechaNacimiento, int genero, String estatus) {
		super(email, nombres, apellidos, telefono, direccion, fechaNacimiento, genero, estatus);
		// TODO Auto-generated constructor stub
	}

	

}
