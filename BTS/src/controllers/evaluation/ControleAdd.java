package controllers.evaluation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Domaine.classe.Classe;
import Domaine.etudiant.Scolarite;
import Domaine.evaluation.Controle;
import Domaine.evaluation.FormeEvaluation;
import Domaine.evaluation.NoteControle;
import Domaine.locaux.Salle;
import Domaine.matiere.Matiere;
import Domaine.matiere.Module;
import Domaine.personnel.Professeur;
import dao.etudiant.ScolariteDAO;
import dao.evaluation.ControleDAO;
import dao.evaluation.NoteControleDAO;


/**
 * Servlet implementation class ControleAdd
 */
@WebServlet("/Controle/Add")
public class ControleAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControleDAO controleDAO;
	private ScolariteDAO scolariteDAO;
	private NoteControleDAO noteControleDAO;
    public ControleAdd() {
        super();
        controleDAO = new ControleDAO();
        scolariteDAO = new ScolariteDAO();
        noteControleDAO = new NoteControleDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String result = null;
	    int matiere = Integer.parseInt(request.getParameter("matiere"));
	    int module = Integer.parseInt(request.getParameter("module"));
	    int classe = Integer.parseInt(request.getParameter("classe"));
	    int salle = Integer.parseInt(request.getParameter("salle"));
	    //int prof = Integer.parseInt(request.getParameter("prof"));
	    int prof = (Integer) session.getAttribute("userID");
	    int formev = Integer.parseInt(request.getParameter("formev"));

	    Controle controle = new Controle();
	    Module module2 = new Module();
	    module2.setId(module);
	    controle.setModule(module2);

	    Matiere matiere2 = new Matiere();
	    matiere2.setId(matiere);
	    controle.setMatiere(matiere2);

	    Classe classe2 = new Classe();
	    classe2.setId(classe);
	    controle.setClasse(classe2);

	    Salle salle2 = new Salle();
	    salle2.setId(salle);
	    controle.setSalle(salle2);

	    Professeur professeur = new Professeur();
	    professeur.setId(prof);
	    controle.setProfesseur(professeur);

	    FormeEvaluation formeEvaluation = new FormeEvaluation();
	    formeEvaluation.setId(formev);
	    controle.setFormeEvaluation(formeEvaluation);

	    try {
	        ArrayList<Scolarite> scolarites = scolariteDAO.getByClasse(classe2);
	        System.out.println("List de scolarite: " +scolarites);
	        int controleId = controleDAO.insert(controle);
	        controle.setId(controleId);
	        for (Scolarite scolarite : scolarites) {
	        	System.out.println("scolarite:" + scolarite);
	            NoteControle noteControle = new NoteControle();
	            noteControle.setControle(controle);
	            noteControle.setEtudiant(scolarite.getEtudiant());
	            noteControleDAO.addNoteControle(noteControle);
	        }
	        System.out.println("god is good");
	        result = "Le controle a ete ajoutee avec succes";
	    } catch (SQLException ex) {
	        result = "Impossible d'ajouter le controle";
	        ex.printStackTrace();
	    }
	    String json = new Gson().toJson(result).toString();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(json);
	    out.flush();
	}

}
