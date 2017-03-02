package controller;

import model.Correo;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.Transport;

public class ControladorCorreo {
	
	private Correo correo = new Correo();
	
	//Para determinar si se ha enviado o no el correo. 
	public boolean enviarCorreo(){
		try{
			
			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.setProperty("mail.smtp.starttls.enable", "true");
			prop.setProperty("mail.smtp.prot", "587");
			prop.setProperty("mail.smtp.user", correo.getUsuarioCorreo());
			prop.setProperty("mail.smtp.auth", "true");
			
			Session sesion = Session.getDefaultInstance(prop, null);				
			BodyPart texto = new MimeBodyPart();
			texto.setText(correo.getMensaje());
			
			MimeMultipart m  = new MimeMultipart();
			m.addBodyPart(texto);
			
			MimeMessage mensaje = new MimeMessage(sesion);
			mensaje.setFrom(new InternetAddress(correo.getUsuarioCorreo()));
			mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correo.getDestino()));
			mensaje.setSubject(correo.getAsunto());
			mensaje.setContent(m);
			
			Transport t = sesion.getTransport("smtp");	
			t.connect(correo.getUsuarioCorreo(), correo.getContrasenna());
			t.sendMessage(mensaje, mensaje.getAllRecipients());
			t.close();
			System.out.println("Correo enviado exitosamente");
			return true;
			
		}catch(Exception e){
			System.out.println("Error al enviar correo" + e);
			return false;
			
		}
	}

}
