package controllers.evaluation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.evaluation.Controle;
import dao.evaluation.ControleDAO;
import dao.evaluation.NoteControleDAO;

@WebServlet("/Controle/Delete")
public class ControleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ControleDAO controleDAO;
    private NoteControleDAO noteControleDAO;
    public ControleDelete() {
        super();
        controleDAO = new ControleDAO();
        noteControleDAO = new NoteControleDAO();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Controle controle = new Controle();
		controle.setId(id);
		String message = null;
		try {
			controleDAO.delete(controle);
			noteControleDAO.deleteNoteControleByControle(id);
			message="La classe � �t� supprim�e avec succ�s";
		} catch (Exception e) {
			message="Impossible de supprimer la classe";
			e.printStackTrace();
		}
		String json = new Gson().toJson(message).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}
}
