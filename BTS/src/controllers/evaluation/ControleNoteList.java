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

import org.codehaus.jackson.map.ObjectMapper;

import Domaine.evaluation.NoteControle;
import dao.evaluation.NoteControleDAO;

/**
 * Servlet implementation class ControleNoteList
 */
@WebServlet("/ControleNote/List")
public class ControleNoteList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NoteControleDAO noteControleDAO; 
    
    public ControleNoteList() {
        super();
        noteControleDAO = new NoteControleDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int controleId=Integer.parseInt(request.getParameter("controleId"));
		String json = null;
		try {
			ArrayList<NoteControle> noteControles = noteControleDAO.getByControle(controleId);
			System.out.println("begin");
			System.out.println(controleId);
			System.out.println(noteControles);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(noteControles);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			//Object PrintWriter to respond
			PrintWriter out = response.getWriter();
			//write json
			System.out.println(json);
			out.write(json);
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
