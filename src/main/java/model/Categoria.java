package model;

public class Categoria {
	private int codigo;
	private String nombre;
	private String descripcion; //Este atributo es opcional
	private String estatus;
	
	//Constructor inicial
	public Categoria() {
		// TODO Auto-generated constructor stub
	}
	//Constructor para crear una categoria con descripcion
	public Categoria(int codigo, String nombre, String descripcion, String estatus) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.estatus = estatus;
	}
	//Constructor para crear una categoria sin descripcion
	public Categoria(int codigo, String nombre, String estatus) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.estatus = estatus;
	}

	//Getter  y Setter
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	

}
