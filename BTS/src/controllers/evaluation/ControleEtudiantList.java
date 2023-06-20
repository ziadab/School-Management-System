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

import org.codehaus.jackson.map.ObjectMapper;

import Domaine.evaluation.NoteControle;
import dao.evaluation.ControleDAO;
import dao.evaluation.NoteControleDAO;

/**
 * Servlet implementation class ControleEtudiantList
 */
@WebServlet("/Controle/Etudiant/List")
public class ControleEtudiantList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoteControleDAO noteControleDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleEtudiantList() {
        super();
        noteControleDAO = new NoteControleDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ArrayList<NoteControle> notes = new ArrayList<>();
		int studnetId = (Integer) session.getAttribute("userID");
		String json = null;
		try {
			notes = noteControleDAO.getByEtudiantForEtudiant(studnetId);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(notes);
			System.out.println(json);
			//type of response is json
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			//Object PrintWriter to respond
			PrintWriter out = response.getWriter();
			//write json
			out.write(json);
			out.flush();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
