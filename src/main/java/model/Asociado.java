package model;

import java.util.Date;

public class Asociado extends Persona  {



	protected String cargo, rifOrganizacion;
	
	public Asociado(){
		super();
	}
	
	public Asociado(String email, String nombres, String apellidos, String telefono, String direccion,
			Date fechaNacimiento, int genero, String estatus) {
		super(email, nombres, apellidos, telefono, direccion, fechaNacimiento, genero, estatus);
		// TODO Auto-generated constructor stub
	}
	
	

	public Asociado(String email, String nombres, String apellidos, String telefono, String direccion, String estatus,
			String cargo, String rifOrganizacion) {
		super(email, nombres, apellidos, telefono, direccion, estatus);
		this.cargo = cargo;
		this.rifOrganizacion = rifOrganizacion;
	}



	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getRifOrganizacion() {
		return rifOrganizacion;
	}

	public void setRifOrganizacion(String rifOrganizacion) {
		this.rifOrganizacion = rifOrganizacion;
	}

	
}
