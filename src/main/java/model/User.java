package model;

public class User {
	protected String username=null; // hasta 30 caracteres
	protected String password=null;
	protected String email=null;
	protected String avatar = null;
	protected char status;

	protected int rol=-1; /* TODO Este rol sera quien defina el usuario que ingresara a la aplicación
							*	   	1-Ideador
							*		2-Empleado 
							*		3-Evaluador de ideas
							*		4-Asociado ede negocio 
							*	
							*		0-SuperUser
	 						*/
	
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String password, String email, int rol) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.rol = rol;
	}


	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
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
	public int getrol() {
		return rol;
	}
	public void setrol(int rol) {
		this.rol = rol;
	}	
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
