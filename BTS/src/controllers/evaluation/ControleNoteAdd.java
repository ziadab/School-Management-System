package controllers.evaluation;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import Domaine.etudiant.Etudiant;
import Domaine.evaluation.Controle;
import Domaine.evaluation.NoteControle;
import dao.evaluation.NoteControleDAO;

/**
 * Servlet implementation class ControleNoteAdd
 */
@WebServlet("/ControleNote/Add")
public class ControleNoteAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoteControleDAO noteControleDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleNoteAdd() {
        super();
        noteControleDAO = new NoteControleDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int controleId = Integer.parseInt(request.getHeader("X-ControleId"));
		 BufferedReader reader = request.getReader();
	    StringBuilder sb = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	        sb.append(line);
	    }
	    String requestBody = sb.toString();

	    // Parse the JSON String into a JsonArray
	    JsonArray jsonArray = new Gson().fromJson(requestBody, JsonArray.class);

	    System.out.println(jsonArray);
	    // Iterate over the JsonArray and use the data as desired
	    for (JsonElement element : jsonArray) {
	        JsonObject obj = element.getAsJsonObject();
	        int etudiantId = obj.get("etudiantId").getAsInt();
	        float note = obj.get("note").getAsFloat();
	        NoteControle noteControle = new NoteControle();
	        Controle controle = new Controle();
	        controle.setId(controleId);
	        noteControle.setControle(controle);
	        Etudiant etudiant = new Etudiant();
	        etudiant.setId(etudiantId);
	        noteControle.setEtudiant(etudiant);
	        noteControle.setNote(note);
	        
	        try {
				noteControleDAO.add(noteControle);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		
		
	}

}
