package dao.evaluation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import Domaine.etudiant.Etudiant;
import Domaine.evaluation.Controle;
import Domaine.evaluation.NoteControle;
import dao.database.Db;
import dao.etudiant.EtudiantDAO;

public class NoteControleDAO {
    private Connection con;
    private EtudiantDAO etudiantDAO;

    public NoteControleDAO() {
        this.con = Db.getInstance().con;
        etudiantDAO = new EtudiantDAO();
    }

    // insert a new record into notecontrole table
    public void addNoteControle(NoteControle noteControle) throws SQLException {
        String query = "INSERT IGNORE INTO notecontrole (EtudiantUtilisateurID, ControleID) VALUES (?, ?)";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        statement.setInt(1, noteControle.getEtudiant().getId());
        statement.setInt(2, noteControle.getControle().getId());
        statement.executeUpdate();
    }

    
    public void add(NoteControle noteControle) throws SQLException {
        String query = "UPDATE notecontrole SET Note = ?, Valide = ? WHERE EtudiantUtilisateurID = ? AND ControleID = ?";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        statement.setFloat(1, noteControle.getNote());
        statement.setBoolean(2, noteControle.getNote() >= 10);
        statement.setInt(3, noteControle.getEtudiant().getId());
        statement.setInt(4, noteControle.getControle().getId());
        statement.executeUpdate();
    }


    
    //get all
    public ArrayList<NoteControle> getAll() throws SQLException {
        String query = "SELECT * FROM notecontrole";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<NoteControle> noteControles = new ArrayList<>();
        while (resultSet.next()) {
            NoteControle noteControle = new NoteControle();
            noteControle.setId(resultSet.getInt("ID"));
            noteControle.getEtudiant().setId(resultSet.getInt("EtudiantUtilisateurID"));
            noteControle.setNote(resultSet.getFloat("Note"));
            noteControle.setValide(resultSet.getBoolean("Valide"));
            noteControle.setObservation(resultSet.getString("Observation"));
            noteControles.add(noteControle);
        }
        return noteControles;
    }

    //get by etudiant
    public ArrayList<NoteControle> getByEtudiant(int etudiantId) throws SQLException {
        String query = "SELECT * FROM notecontrole WHERE EtudiantUtilisateurID=?";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        statement.setInt(1, etudiantId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<NoteControle> noteControles = new ArrayList<>();
        while (resultSet.next()) {
            NoteControle noteControle = new NoteControle();
            noteControle.setId(resultSet.getInt("ID"));
            noteControle.getEtudiant().setId(resultSet.getInt("EtudiantUtilisateurID"));
            noteControle.setNote(resultSet.getFloat("Note"));
            noteControle.setValide(resultSet.getBoolean("Valide"));
            noteControle.setObservation(resultSet.getString("Observation"));
            noteControles.add(noteControle);
        }
        return noteControles;
    }

    //get by controle
    public ArrayList<NoteControle> getByControle(int controleId) throws SQLException {
        String query = "SELECT * FROM notecontrole WHERE ControleID=?";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        statement.setInt(1, controleId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<NoteControle> noteControles = new ArrayList<>();
        while (resultSet.next()) {
            NoteControle noteControle = new NoteControle();
            noteControle.setId(resultSet.getInt("ID"));
            noteControle.setEtudiant(etudiantDAO.getById((resultSet.getInt("EtudiantUtilisateurID"))));
            noteControle.setNote(resultSet.getFloat("Note"));
            noteControle.setValide(resultSet.getBoolean("Valide"));
            noteControle.setObservation(resultSet.getString("Observation"));
            noteControles.add(noteControle);
        }
        return noteControles;
    }
    
    //delete by controle
    public void deleteNoteControleByControle(int controleId) throws SQLException {
        String query = "DELETE FROM notecontrole WHERE ControleID = ?";
        PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
        statement.setInt(1, controleId);
        statement.executeUpdate();
    }
    public static void main(String[] args) {
		NoteControle noteControle = new NoteControle();
		Controle controle = new Controle();
		controle.setId(18);
		noteControle.setControle(controle);
		Etudiant etudiant = new Etudiant();
		etudiant.setId(1);
		noteControle.setEtudiant(etudiant);
		NoteControleDAO noteControleDAO = new NoteControleDAO();
		try {
			noteControleDAO.addNoteControle(noteControle);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}