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
import javax.websocket.Session;

import org.codehaus.jackson.map.ObjectMapper;

import Domaine.evaluation.Controle;
import dao.evaluation.ControleDAO;

/**
 * Servlet implementation class ControleList
 */
@WebServlet("/Controle/List")
public class ControleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControleDAO controleDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleList() {
        super();
        controleDAO = new ControleDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//preparer arraylist des controles
		ArrayList<Controle> controles = new ArrayList<>();
		//String json va contenir les controles et le envoyer vers client
		String json = null;
		try {

			int classId =Integer.parseInt(request.getParameter("classeId"));
			int profId = (Integer) session.getAttribute("userID");
			//fetch controls from DB
			controles = controleDAO.getByProfByClass(profId, classId);
			//ObjectMapper to transfer java object to json
			ObjectMapper mapper = new ObjectMapper();
			//Arraylist of controls to json
			json = mapper.writeValueAsString(controles);
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
