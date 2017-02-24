package model;

public class AreaPericia {
	private int codigo;
	private String descripcion;
	private char estatus;

	public AreaPericia() {
		// TODO Auto-generated constructor stub
	}
	
	public AreaPericia(int codigo, String descripcion, char estatus) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
		this.estatus = estatus;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripion(String descripcion) {
		this.descripcion = descripcion;
	}

	public char getEstatus() {
		return estatus;
	}

	public void setEstatus(char estatus) {
		this.estatus = estatus;
	}
	

}
