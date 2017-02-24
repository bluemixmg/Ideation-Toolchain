package model;

import java.util.Date;

public class Empleado  {



	protected String username, cargo, rifOrganizacion;
	protected int tipo;
	protected char status;
	
	/*
	 * 1 - Administrador     de la cuenta de la empresa 
	 * 2 - Ideador
	 * 3 - Desafiante        de la empresa  
	 * 
	 */
	
	
	public Empleado(String username, String cargo, String rifOrganizacion, int tipo, char status) {
		super();
		this.username = username;
		this.cargo = cargo;
		this.rifOrganizacion = rifOrganizacion;
		this.tipo = tipo;
		this.status = status;
	}
	
	public Empleado() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}

	

	
}
