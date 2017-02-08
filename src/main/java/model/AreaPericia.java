package model;

public class AreaPericia {
	private String codigo;
	private String descripcion;
	private char estatus;

	public AreaPericia() {
		// TODO Auto-generated constructor stub
	}
	
	public AreaPericia(String codigo, String descripcion, char estatus) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
		this.estatus = estatus;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDecripion(String descripcion) {
		this.descripcion = descripcion;
	}

	public char getEstatus() {
		return estatus;
	}

	public void setEstatus(char estatus) {
		this.estatus = estatus;
	}
	

}
