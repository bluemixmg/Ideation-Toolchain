package model;

public class AreaEstrategica {
	private int codigo;
	private String descripcion;

	public AreaEstrategica() {
		// TODO Auto-generated constructor stub
	}

	//Constructor con paramateros para instanciar un area estrategica
	public AreaEstrategica(int codigo, String descripcion) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
	}

	//Getter y Setter
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	

}
