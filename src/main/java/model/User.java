package model;

public class User {
	protected String username=null; // hasta 30 caracteres
	protected String password=null;
	protected String email=null;
	protected int tipo=-1; /* TODO Este tipo sera quien defina el usuario que ingresara a la aplicación
							*	   	1-Ideador
							*		2-Asociado (Empleado)
							*		3-Evaluador de ideas
							*		4-Organizacion
							*	
							*		0-SuperUser
	 						*/
	
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String password, String email, int tipo) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.tipo = tipo;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}	
	
}
