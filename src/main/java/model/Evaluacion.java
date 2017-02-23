package model;

import java.util.Date;

public class Evaluacion {
	
	private int idea_id;
	private String username;
	private Date fecha;
	private String detalle;
	private int impacto;
	private int factibilidad;
	
	public Evaluacion(){
		
	}
	
	public Evaluacion(int idea, String user, String detalle, int factibilidad, int impacto, Date fecha)
	{
		this.idea_id=idea;
		this.username=user;
		this.detalle=detalle;
		this.factibilidad=factibilidad;
		this.impacto=impacto;
		this.fecha=fecha;
	}

	/**
	 * @return the idea_id
	 */
	public int getIdea_id() {
		return idea_id;
	}

	/**
	 * @param idea_id the idea_id to set
	 */
	public void setIdea_id(int idea_id) {
		this.idea_id = idea_id;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the fecha
	 */
	public Date getFecha() {
		return fecha;
	}

	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	/**
	 * @return the detalle
	 */
	public String getDetalle() {
		return detalle;
	}

	/**
	 * @param detalle the detalle to set
	 */
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	/**
	 * @return the impacto
	 */
	public int getImpacto() {
		return impacto;
	}

	/**
	 * @param impacto the impacto to set
	 */
	public void setImpacto(int impacto) {
		this.impacto = impacto;
	}

	/**
	 * @return the factibilidad
	 */
	public int getFactibilidad() {
		return factibilidad;
	}

	/**
	 * @param factibilidad the factibilidad to set
	 */
	public void setFactibilidad(int factibilidad) {
		this.factibilidad = factibilidad;
	}
	
	

}
