package model;

public class Organizacion {
	
	//Definicion de los atributos
	private String username;
	private String rif;
	private String nombre;
	private String razonSocial;
	private String direccion;
	private String telefono;

	//Sino así:
	private boolean sucursal; //true si es sucursal, false en caso contrario
	private String rifOrgMatriz; //Este campo se llenara si y solo la organizacion en registro es una sucursal
	
	
	
	
	public Organizacion() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Organizacion(String username, String rif, String nombre, String razonSocial, String direccion,
			String telefono, boolean sucursal, String rifOrgMatriz) {
		super();
		this.username = username;
		this.rif = rif;
		this.nombre = nombre;
		this.razonSocial = razonSocial;
		this.direccion = direccion;
		this.telefono = telefono;
		this.sucursal = sucursal;
		this.rifOrgMatriz = rifOrgMatriz;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRif() {
		return rif;
	}
	public void setRif(String rif) {
		this.rif = rif;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public boolean isSucursal() {
		return sucursal;
	}
	public void setSucursal(boolean sucursal) {
		this.sucursal = sucursal;
	}
	public String getRifOrgMatriz() {
		return rifOrgMatriz;
	}
	public void setRifOrgMatriz(String rifOrgMatriz) {
		this.rifOrgMatriz = rifOrgMatriz;
	}
	
	


}
