package model;

import dao.*;

public class UserAdapter{

	
	public static String nombreUsuario(int tipo, String username) {
		String nombre=null;
		switch(tipo){
		case 1: //Ideador
			IdeadorDAO estdao = new IdeadorDAO();
			Ideador est=estdao.RetornarEstandar(username);
			nombre=est.getNombres()+est.getApellidos();
			break;
		case 2:// Empleado
			EmpleadoDAO asodao=new EmpleadoDAO();
			Empleado aso = asodao.RetornarAsociado(username);
			nombre = aso.getNombres()+aso.getApellidos();
		case 3://Evaluado
			EvaluacionDAO evadao = new EvaluacionDAO();
			nombre="Usuario Evaluador";
		case 4://Organizacion
			OrganizacionDAO orgdao = new OrganizacionDAO();
			Organizacion org = orgdao.BuscarOrganizacion(username);
			nombre = org.getNombre();
			default: nombre = "SuperUsuario";
		}
		return nombre;
	}

}
