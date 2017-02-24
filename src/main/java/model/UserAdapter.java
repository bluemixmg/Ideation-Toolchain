package model;

import dao.*;

public class UserAdapter{

	
	public static String nombreUsuario(int tipo, String username) {
		String nombre=null;
		switch(tipo){
		case 1: //Perfil
			PerfilDAO estdao = new PerfilDAO();
			Perfil est=estdao.RetornarPerfil(username);
			nombre=est.getNombres()+est.getApellidos();
			break;
		case 2:// Empleado
			EmpleadoDAO asodao=new EmpleadoDAO();
			Empleado aso = asodao.RetornarEmpleado(username);
			break;
		case 3://Evaluado
			EvaluacionDAO evadao = new EvaluacionDAO();
			nombre="Usuario Evaluador";
			break;
		case 4://Organizacion
			OrganizacionDAO orgdao = new OrganizacionDAO();
			Organizacion org = orgdao.BuscarOrganizacion(username);
			nombre = org.getNombre();
			default: nombre = "SuperUsuario";
		}
		return nombre;
	}

}
