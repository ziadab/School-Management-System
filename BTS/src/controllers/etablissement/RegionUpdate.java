package controllers.etablissement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Domaine.etablissement.Region;

import com.google.gson.Gson;
import dao.etablissement.RegionDAO;

/**
 * Servlet implementation class ClasseController
 */
@WebServlet("/Region/Update")
public class RegionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RegionDAO regionDAO;  
    public RegionUpdate() {
        super();
        regionDAO = new RegionDAO();
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int id=Integer.parseInt(request.getParameter("id"));
		String code=request.getParameter("code");
		String nom_Fr= request.getParameter("nom_Fr");
		String nom_Ar=request.getParameter("nom_Ar");
		
		Region region = new Region();
		region.setId(id);
		region.setCode(code);
		region.setNom_Fr(nom_Fr);
		region.setNom_Ar(nom_Ar);
		System.out.print("Test  : " +region);
		String result=null;
		
		try {
			regionDAO.update(region);
			result="Le région à été modifiée avec succès";
		} catch (SQLException e) {
			result="Impossible de modifier le région";
			e.printStackTrace();
		}
		String json = new Gson().toJson(result).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

}
