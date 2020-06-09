package controllers.classe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.classe.Cycle;

import dao.classe.CycleDAO;

/**
 * Servlet implementation class CycleList
 */
@WebServlet("/Cycle/List")
public class CycleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CycleDAO cycleDAO;
    public CycleList() {
        super();
        cycleDAO = new CycleDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cycle> cycles= new ArrayList<Cycle>();
		try {
			cycles = cycleDAO.getAll();
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(cycles).toString();
			
			/****Simulation d'un retard pour tester l'animation de chargement d'ajax ***/
//				int timeToWait = 5; //second
//		        System.out.println("Loading Cycles .... ");
//		        try {
//		            for (int i=0; i<timeToWait ; i++) {
//		                Thread.sleep(1000);
//		                System.out.print(".");
//		            }
//		        } catch (InterruptedException ie)
//		        {
//		            Thread.currentThread().interrupt();
//		        }
			/*** fin de la simulation retard**/
			
			//System.out.println(json);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
