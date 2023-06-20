package controllers.evaluation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import Domaine.classe.Classe;
import Domaine.evaluation.Controle;
import Domaine.evaluation.Soutenance;
import dao.evaluation.ControleDAO;

/**
 * Servlet implementation class ControleDetails
 */
@WebServlet("/Controle/Details")
public class ControleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ControleDAO controleDAO;
    
    public ControleDetails() {
        super();
        controleDAO = new ControleDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
        System.out.println("servlet calleeeed\nid=" + id);
		Controle controle= new Controle();
		try {
			controle = controleDAO.getById(id);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(controle);
			response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			System.out.println(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
