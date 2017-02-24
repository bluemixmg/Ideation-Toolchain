package model;

import java.util.Date;

public class Perfil extends Persona{

	public Perfil() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Perfil(String username, String nombres, String apellidos, String telefono, String direccion, String estatus) {
		super(username, nombres, apellidos, telefono, direccion, estatus);
		// TODO Auto-generated constructor stub
	}

	public Perfil(String username, String nombres, String apellidos, String telefono, String direccion,
			Date fechaNacimiento, int genero, String estatus) {
		super(username, nombres, apellidos, telefono, direccion, fechaNacimiento, genero, estatus);
		// TODO Auto-generated constructor stub
	}

	

}
