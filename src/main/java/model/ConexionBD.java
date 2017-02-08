package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;

import dao.AsociadoDAO;
import dao.EstandarDAO;
import dao.OrganizacionDAO;
import dao.UserDAO;


public class ConexionBD {
    
    private Connection connection = null;
    
    public ConexionBD() throws ClassNotFoundException, SQLException {
        //Paso 1
        Class.forName("org.postgresql.Driver");
        
        //Paso 2
        String host = "jumbo.db.elephantsql.com";
        String dbName = "cmduwvik";
        int port = 5432;
        String urlConnection = "jdbc:postgresql://" +  host + ":" 
                + port + "/" + dbName;
        
        //Paso 3
        String username = "cmduwvik";
        String password = "HujUBj6AFg_kCYnQHVxYndHz19_V88u8";
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

		
//		User us = new User();
//		UserDAO usd = new UserDAO();
		
    	Estandar e= new Estandar();
    	EstandarDAO esdao = new EstandarDAO();
    	
    	e= esdao.RetornarEstandar("lfreitez@marna.com.ve");
    	
    	
		Asociado es = new Asociado();
		AsociadoDAO edao = new AsociadoDAO();
		
		es= edao.RetornarAsociado("aa@m.com");
		
		
		System.out.println("Usuario" + es.getApellidos() + es.getEmail() + es.getEstatus());
		
	
	    	
  }
    
	public static Date CnvStringFecha(String fecha)
	{
	    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	    Date fechaDate = null;
	    try 
	    {
	        fechaDate = formato.parse(fecha);
	    }
	    catch (ParseException ex)
	    {
	        System.out.println(ex.getMessage());
	    }
	    return fechaDate;
	}

}