package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;

import dao.EmpleadoDAO;
import dao.PerfilDAO;
import dao.OrganizacionDAO;
import dao.UserDAO;


public class ConexionBD {
    
    private Connection connection = null;
    
    public ConexionBD() throws ClassNotFoundException, SQLException {
        //Paso 1
        Class.forName("org.postgresql.Driver");
        
        //Paso 2
        String host = "echo-01.db.elephantsql.com";
        String dbName = "xsmmmlol";
        int port = 5432;
        String urlConnection = "jdbc:postgresql://" +  host + ":" 
                + port + "/" + dbName;
        
        //Paso 3
        String username = "xsmmmlol";
        String password = "atWHingwEHVF-m8VTdCDLOOmu9bWDE9A";
        connection = DriverManager.getConnection(urlConnection, username, password);
        connection.setAutoCommit(true);
        System.out.println("Conexion Exitosa");
    }
    
    public Connection getConexion() {
        return this.connection;
    }
    
    public void closeConexion() {
        if(connection != null) {
            try {
                connection.close();
                System.out.println("Conexion Cerrrada");
            } catch(SQLException ex) {
                java.util.logging.Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
    //Pruebas locales 
    public static void main (String[] args){

		
    	User us = new User();
		UserDAO usd = new UserDAO();
		
		us.setAvatar("https//Este es el avatar");
		us.setEmail("lfreitez@mar7na.7com.vde0");
		us.setPassword("qwert123457");
		us.setrol(2);
		us.setUsername("luisffg24377");
		
		usd.insertarUsuario(us);
		
		us = null;	
		us = usd.buscarUser("luisffg24377");		
		System.out.println("Usuario" + us.getAvatar() + us.getEmail() + us.getPassword() + us.getrol()+ us.getStatus()+ us.getUsername());
		
		List<User> list = new ArrayList<User>();
		
		list = usd.ListaUsuario_Rol(2);
		for(User u : list ){
			System.out.println("Usuario" + u.getAvatar() + u.getEmail() + u.getPassword() + u.getrol()+ u.getStatus()+ u.getUsername());

		
		}
	
	    	
  }


}