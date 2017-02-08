package model;

import java.util.Date;

public class Estandar extends Persona{

	public Estandar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Estandar(String email, String nombres, String apellidos, String telefono, String direccion, String estatus) {
		super(email, nombres, apellidos, telefono, direccion, estatus);
		// TODO Auto-generated constructor stub
	}

	public Estandar(String email, String nombres, String apellidos, String telefono, String direccion,
			Date fechaNacimiento, int genero, String estatus) {
		super(email, nombres, apellidos, telefono, direccion, fechaNacimiento, genero, estatus);
		// TODO Auto-generated constructor stub
	}

	
	
	

}
