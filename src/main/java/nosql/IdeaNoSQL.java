package nosql;

import model.ConexionCloudantBD;
import model.Idea;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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

public class IdeaNoSQL {
	
	public IdeaNoSQL(){
		
	}
	@POST
	public Response create(Idea idea)
			throws Exception {

		System.out.println("En el primer create");
		Database db = null;
		JsonObject resultObject=null;
		try {
			db = getDB();
			//String idOficial = id == null ? null : idea.getCodigo().toString();
			resultObject = create(db, idea.getCodigo(), idea);
			System.out.println("En el try para obtener la BDNoSQL con el codigo: "+idea.getCodigo());
		} catch (Exception re) { 
			System.out.println("En el error del try DB");
			re.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
		}
		System.out.println("Create Successful.");

		return Response.ok(resultObject.toString()).build();
	}
	
	public JsonObject create(Database db, int idP, Idea idea)
			throws IOException {
		Date f = new Date();
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		String fecha_creacion = formato.format(f);
		System.out.println(idP+"--"+idea.getCodigo());
		
		// Revisa si existe un documento con este id
		HashMap<String, Object> obj = null;
		
		//Crear un nuevo documento
		System.out.println("Creando un nuevo documento con el id : " + idP);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("_id", "I"+String.valueOf(idP)+"D"+idea.getCodDesafio());
		data.put("codigo", String.valueOf(idea.getCodigo()));
		data.put("titulo", idea.getTitulo());
		data.put("votos",0);
		data.put("palabras_clave",idea.getPalabrasClave());
		data.put("creation_date", fecha_creacion);
		db.save(data);

		obj = db.find(HashMap.class, String.valueOf(idP)+idea.getTitulo());
		JsonObject resultObject = toJsonObject(obj);

		return resultObject;
	}
	
	@GET
	public Response get(Long id, String cmd) throws Exception {

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
					HashMap<String, Object> obj = db.find(HashMap.class, doc.get("id") + "");
					JsonObject jsonObject = new JsonObject();
					JsonArray palabras = (JsonArray)obj.get("palabras_clave");

					if (palabras.isJsonArray() && palabras.size()>0) {
						//JsonArray palabrasList = getListaPalabras(palabras); 
						jsonObject.addProperty("id", obj.get("_id") + "");
						jsonObject.addProperty("titulo", obj.get("titulo") + "");
						jsonObject.addProperty("votos", obj.get("votos") + "");
						jsonObject.add("palabras_clave", palabras);
 
					} else {
						jsonObject.addProperty("id", obj.get("_id") + "");
						jsonObject.addProperty("titulo", obj.get("titulo") + "");
						jsonObject.addProperty("votos", obj.get("votos") + "");
					}

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

	public JsonObject getUnaIdea(String id){
		Database db = null;
		try {
			db = getDB();
		} catch (Exception re) {
			re.printStackTrace();
		}
		JsonObject jsonObject=new JsonObject();
		//JsonArray jsonArray = new JsonArray();
		// check if document exists 
		HashMap<String, Object> obj = db.find(HashMap.class, id + "");
		if (obj != null) {
			jsonObject = toJsonObject(obj);
			return jsonObject;
		} else {
			System.out.println("FALLA AL BUSCAR EL DOC EN LA BD");
		}
		return jsonObject;
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
	public Response update(long id, String titulo, int cant_votos, ArrayList<String> palabras_clave){

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
			obj.put("votos", cant_votos);
			obj.put("palabras_clave", getListaPalabras(palabras_clave));
			obj.put("creation_date", new Date().toString());
			db.update(obj);

			System.out.println("Actualización Exitosa!");

			return Response.ok("OK").build();
		}
	}

	@PUT
	public Response updateVotos(long id){
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
			System.out.println("No pudo encontar el objeto en la BD No SQL");
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			obj.put("votos", (int)obj.get("votos")+1);
			db.update(obj);
	
			System.out.println("Actualización Exitosa!");
	
			return Response.ok("OK").build();
		}
	}
	public Database getDB() {
		return ConexionCloudantBD.getDB();
	}
	
	private JsonObject toJsonObject(HashMap<String, Object> obj) {
		JsonObject jsonObject = new JsonObject();
		ArrayList<String> p_clav = (ArrayList<String>)obj.get("palabras_clave");
			if(p_clav!=null && p_clav.size()>0){
				jsonObject.add("palabras_clave", getListaPalabras(p_clav));
			}
		jsonObject.addProperty("id", obj.get("_id") + "");
		jsonObject.addProperty("titulo", obj.get("titulo") + "");
		jsonObject.addProperty("votos", obj.get("votos") + "");
		jsonObject.addProperty("fecha_creacion", obj.get("creation_date") + "");
		return jsonObject;
	}

	private JsonArray getListaPalabras(ArrayList<String> palabras){
		JsonArray palabrasClave = new JsonArray();
		for(int i=0; i<palabras.size(); i++){
			JsonObject p = new JsonObject();
			p.addProperty("key"+i, palabras.get(i));
			palabrasClave.add(p);
	
		}
		return palabrasClave;
	}
	/*
	 * Crear un documento en blanco para el caso en que se encuentre vacia la BD
	 */
	private List<HashMap> inicializarDocumentoEjemplo(Database db) throws Exception {

		long id = System.currentTimeMillis();
		String titulo = "Ejemplo del titulo de una idea";
		int votos = 0;

		// crear un nuevo documento 
		System.out.println("Creando un nuevo documento con el id : " + id);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("titulo", titulo);
		data.put("_id", id + "");
		data.put("votos", votos);
		data.put("creation_date", new Date().toString());
		db.save(data);

		return db.getAllDocsRequestBuilder().includeDocs(true).build().getResponse().getDocsAs(HashMap.class);

	}

}
