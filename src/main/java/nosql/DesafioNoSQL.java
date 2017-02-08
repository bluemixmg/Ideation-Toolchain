package nosql;

import model.ConexionCloudantBD;
import model.Desafio;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.cloudant.client.api.Database;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.internal.LinkedTreeMap;

public class DesafioNoSQL {

	public DesafioNoSQL() {
		// TODO Auto-generated constructor stub
	}

	@POST
	public Response create(@QueryParam("id") String id, @FormParam("titulo") String titulo, @FormParam("value") String value)
			throws Exception {

		Database db = null;
		JsonObject resultObject = null;
		try {
			db = getDB();
		} catch (Exception re) {
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}

		resultObject = create(db, id, titulo, null, null);

		System.out.println("Create Successful.");

		return Response.ok(resultObject.toString()).build();
	}
	
	public JsonObject create(Database db, String idP, String titulo, Part imagen, String nombreImagen)
			throws IOException {
		String id = idP;
		
		// Revisa si existe un documento con este id
		System.out.println("Entró a la función JsonObject create()");
		//db.find(classType, id)
		//HashMap<String, Object> obj = /*(id == null) ? null :*/ db.find(HashMap.class, id);
		//System.out.println("Lo que se trajo obj fue: " + obj.get(id) + " (obj.get("+ id +"))");
		HashMap<String, Object> obj = null;
		//if (obj == null) {
			System.out.println("Entró a if de obj == null");
			//Crear un nuevo documento
			System.out.println("Creando un nuevo documento con el id : " + id);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("_id", id);
			data.put("titulo", titulo);
			data.put("creation_date", new Date().toString());
			db.save(data);
			System.out.println("Guardó id, título y creation_date en la bd NoSQL");
			//adjunta la imagen
			obj = db.find(HashMap.class, id);
			System.out.println("Lo que se trajo obj.toString() fue: " + obj.toString());
			System.out.println("Lo que se trajo obj fue: " + obj.get("_id") + " (obj.get(\"_id\"))");
			saveAttachment(db, id, imagen, nombreImagen, obj);
			System.out.println("Adjuntó la imagen y la guardó");
		/*} else {
			System.out.println("Entró a else de obj == null");
			// Si el documento existe
			// Actualiza los valores en el documento
			System.out.println("Actualizando los valores de un documento");
			obj = db.find(HashMap.class, id);
			obj.put("titulo", titulo);
			db.update(obj);
		}*/

		System.out.println("Voy a buscar el documento en la bd por el id");
		obj = db.find(HashMap.class, id);
		System.out.println("obj tiene las siguientes claves: " + obj.keySet().toString());
		System.out.println("Lo que se trajo obj.toString() fue: " + obj.toString());
		System.out.println("Lo que se trajo obj fue: " + obj.get("_id") + " (obj.get(\"_id\"))");
		JsonObject resultObject = toJsonObject(obj);
		System.out.println("Este es el JsonObject obtenido: " + resultObject);
		return resultObject;
	}
	
	@GET
	public Response get(String id, String cmd) throws Exception {

		Database db = null;
		try {
			db = getDB();
		} catch (Exception re) {
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}

		JsonObject resultObject = new JsonObject();
		JsonArray jsonArray = new JsonArray();

		if (id == null) {
			try {
				// Obtener todos los documentos en la BD
				List<HashMap> allDocs = db.getAllDocsRequestBuilder().includeDocs(true).build().getResponse().getDocsAs(HashMap.class);

				if (allDocs.size() == 0) {
					allDocs = inicializarDocumentoEjemplo(db);
				}

				for (HashMap doc : allDocs) {
					HashMap<String, Object> obj = db.find(HashMap.class, doc.get("_id") + "");
					JsonObject jsonObject = new JsonObject();
					
						jsonObject.addProperty("id", obj.get("_id") + "");
						jsonObject.addProperty("titulo", obj.get("titulo") + "");
						//jsonObject.addProperty("votos", obj.get("votos") + "");

					jsonArray.add(jsonObject);
				}
			} catch (Exception dnfe) {
				System.out.println("Exception thrown : " + dnfe.getMessage());
			}

			resultObject.addProperty("id", "todos");
			resultObject.add("body", jsonArray);

			return Response.ok(resultObject.toString()).build();
		}

		// check if document exists
		
		HashMap<String, Object> obj = db.find(HashMap.class, id + "");
		if (obj != null) {
			JsonObject jsonObject = toJsonObject(obj);
			return Response.ok(jsonObject.toString()).build();
		} else {
			return Response.status(Response.Status.NOT_FOUND).build();
		}
	}

	@DELETE
	public Response delete(long id) {

		Database db = null;
		try {
			db = getDB();
		} catch (Exception re) {
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}

		// revisar si el documento existe
		HashMap<String, Object> obj = db.find(HashMap.class, id + "");

		if (obj == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			db.remove(obj);
			System.out.println("Eliminación Exitosa!");

			return Response.ok("OK").build();
		}
	}

	@PUT
	public Response update(long id, String titulo){

		Database db = null;
		try {
			db = getDB();
		} catch (Exception re) {
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}

		// verificar si el documento existe en la BD
		HashMap<String, Object> obj = db.find(HashMap.class, id + "");

		if (obj == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			obj.put("titulo", titulo);

			db.update(obj);

			System.out.println("Actualización Exitosa!");

			return Response.ok("OK").build();
		}
	}

	/*@PUT
	public Response updateVotos(long id, int cant_votos){
		Database db = null;
		try{
			db = getDB();
		}catch(Exception re){
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}
		// verificar si el documento existe en la BD
				HashMap<String, Object> obj = db.find(HashMap.class, id + "");

		if (obj == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			obj.put("votos", cant_votos);
			db.update(obj);
	
			System.out.println("Actualización Exitosa!");
	
			return Response.ok("OK").build();
		}
	}*/
	
	public Database getDB() {
		return ConexionCloudantBD.getDB();
	}
	
	private JsonObject toJsonObject(HashMap<String, Object> obj) {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("id", obj.get("_id") + "");
		jsonObject.addProperty("titulo", obj.get("titulo") + "");
		return jsonObject;
	}
	
	/*
	 * Crear un documento en blanco para el caso en que se encuentre vacia la BD
	 */
	private List<HashMap> inicializarDocumentoEjemplo(Database db) throws Exception {

		long id = System.currentTimeMillis();
		String titulo = "Ejemplo del título de un desafío";

		// crear un nuevo documento 
		System.out.println("Creando un nuevo documento con el id : " + id);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("titulo", titulo);
		data.put("_id", id + "");
		data.put("creation_date", new Date().toString());
		db.save(data);

		return db.getAllDocsRequestBuilder().includeDocs(true).build().getResponse().getDocsAs(HashMap.class);

	}
	
	private void saveAttachment(Database db, String id, Part part, String fileName, HashMap<String, Object> obj)
			throws IOException {
		if (part != null) {
			InputStream inputStream = part.getInputStream();
			try {
				db.saveAttachment(inputStream, fileName, part.getContentType(), id, (String) obj.get("_rev"));
			} finally {
				inputStream.close();
			}
		}
	}
	
}
