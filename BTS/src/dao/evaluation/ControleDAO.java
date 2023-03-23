package dao.evaluation;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.classe.Cycle;
import Domaine.classe.Filiere;
import Domaine.classe.Niveau;
import Domaine.evaluation.Controle;
import Domaine.evaluation.DocumentEvaluation;
import Domaine.evaluation.FormeEvaluation;
import Domaine.evaluation.NoteControle;
import Domaine.locaux.Salle;
import Domaine.matiere.Matiere;
import Domaine.matiere.Module;
import Domaine.personnel.Professeur;
import Domaine.personnel.Specialite;
import Domaine.utilisateur.Utilisateur;
import dao.database.Db;

public class ControleDAO {
	private Connection con;
	public ControleDAO() {
		this.con = Db.getInstance().con;
	}
	public ArrayList<Controle> getAll() throws SQLException{
		String query ="SELECT `controle`.*, `professeur`.*, `utilisateur`.*, `matiere`.`ID` AS `matID`, `matiere`.`Code` AS `matCode`, `matiere`.`Nom_Fr` AS `matNom_Fr`, `matiere`.`Nom_Ar` AS `matNom_Ar`, `module`.`ID` AS `modID`, `module`.`Code` AS `modCode`, `module`.`Nom_Fr` AS `modNom_Fr`, `module`.`Nom_Ar` AS `modNom_Ar`, `formeevaluation`.`ID` AS `feID`, `formeevaluation`.`Code` AS `feCode`, `formeevaluation`.`Nom_Ar` AS `feNom_Ar`, `formeevaluation`.`Nom_Fr` AS `feNom_Fr`\r\n"
				+ "FROM `controle` \r\n"
				+ "	LEFT JOIN `professeur` ON `controle`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID` \r\n"
				+ "	LEFT JOIN `utilisateur` ON `professeur`.`UtilisateurID` = `utilisateur`.`ID` \r\n"
				+ "	LEFT JOIN `matiere` ON `controle`.`MatiereID` = `matiere`.`ID` \r\n"
				+ "	LEFT JOIN `module` ON `controle`.`ModuleID` = `module`.`ID` \r\n"
				+ "	LEFT JOIN `formeevaluation` ON `controle`.`FormeEvaluationID` = `formeevaluation`.`ID`;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = statement.executeQuery();
		ArrayList<Controle> controles = new ArrayList<Controle>();
		
		while (rs.next()) {
			Controle controle =new Controle();
			controle.setId(rs.getInt("ID"));
			controle.setComptabilise(rs.getBoolean("Comptabilise"));
			controle.setDateDepotNotes(rs.getDate("DateDepotNotes"));
			controle.setDatePassage(rs.getDate("DatePassage"));
			controle.setDatePlanifiee(rs.getDate("DatePlanifiee"));
			controle.setDescription(rs.getString("Description"));
			controle.setDuree(rs.getShort("Duree"));
			controle.setEtat(rs.getString("Etat"));
			controle.setObservation(rs.getString("Observation"));
			
			/*Classe classe = new Classe();
			classe.setId(rs.getInt("ClasseID"));
			controle.setClasse(classe);*/
			
			Salle salle = new Salle();
			salle.setId(rs.getInt("SalleID"));
			controle.setSalle(salle);
			
			Matiere matiere = new Matiere();
			matiere.setId(rs.getInt("matID"));
			matiere.setCode(rs.getString("matCode"));
			matiere.setNom_Fr(rs.getString("matNom_Fr"));
			matiere.setNom_Ar(rs.getString("matNom_Ar"));
			controle.setMatiere(matiere);
			
			Module module = new Module();
			module.setId(rs.getInt("modID"));
			module.setCode(rs.getString("modCode"));
			module.setNom_Fr(rs.getString("modNom_Fr"));
			module.setNom_Ar(rs.getString("modNom_Ar"));
			controle.setModule(module);
			
			/*DocumentEvaluation docEvsujet = new DocumentEvaluation();
			docEvsujet.setId(rs.getInt("docevID"));
			docEvsujet.setCode(rs.getString("docevCode"));
			docEvsujet.setNom(rs.getString("docevNom"));
			docEvsujet.setEmplacement(rs.getString("docevEmplacement"));
			docEvsujet.setType(rs.getString("docevType"));
			docEvsujet.setDateUpload(rs.getDate("docevDateUpload"));
			controle.setSujet(docEvsujet);*/
			
			Professeur professeur = new Professeur();
			professeur.setId(rs.getInt("UtilisateurID"));
			professeur.setPhoto(rs.getString("Photo"));
			professeur.setNom_Fr(rs.getString("Nom_Fr"));
			professeur.setNom_Ar(rs.getString("Nom_Ar"));
			professeur.setPrenom_Fr(rs.getString("Prenom_Fr"));
			professeur.setPrenom_Ar(rs.getString("Prenom_Ar"));
			professeur.setSexe(rs.getString("Sexe"));
			professeur.setTitre(rs.getString("Titre"));
			professeur.setCin(rs.getString("Cin"));
			professeur.setNationalite(rs.getString("Nationalite"));
			professeur.setDateNais(rs.getDate("DateNais"));
			professeur.setLieuNais_Fr(rs.getString("LieuNais_Fr"));
			professeur.setLieuNais_Ar(rs.getString("LieuNais_Ar"));
			professeur.setAdresse_Fr(rs.getString("Adresse_Fr"));
			professeur.setAdresse_Ar(rs.getString("Adresse_Ar"));
			professeur.setEmail(rs.getString("Email"));
			professeur.setSituationF(rs.getString("SituationF"));
			professeur.setTeleMobile(rs.getString("TeleMobile"));
			professeur.setTeleDomicile(rs.getString("TeleDomicile"));
			
			Cycle cycle = new Cycle();
			cycle.setId(rs.getInt("CycleID"));
			professeur.setCycle(cycle);
			
			Specialite specialite = new Specialite();
			specialite.setId(rs.getInt("SpecialiteID"));
			professeur.setSpecialite(specialite);
			controle.setProfesseur(professeur);
			
			FormeEvaluation formeEvaluation = new FormeEvaluation();
			formeEvaluation.setId(rs.getInt("feID"));
			formeEvaluation.setCode(rs.getString("feCode"));
			formeEvaluation.setNom_Ar(rs.getString("feNom_Ar"));
			formeEvaluation.setNom_Fr(rs.getString("feNom_Fr"));
			controle.setFormeEvaluation(formeEvaluation);
			
			controles.add(controle);
		}
		rs.close();
		statement.close();
		return controles;
	}
	public ArrayList<Controle> getByProfByClass(int idProf,int idClasse) throws SQLException{
		String query ="SELECT `controle`.*, `professeur`.*, `utilisateur`.*, `matiere`.`ID` AS `matID`, `matiere`.`Code` AS `matCode`, `matiere`.`Nom_Fr` AS `matNom_Fr`, `matiere`.`Nom_Ar` AS `matNom_Ar`, `module`.`ID` AS `modID`, `module`.`Code` AS `modCode`, `module`.`Nom_Fr` AS `modNom_Fr`, `module`.`Nom_Ar` AS `modNom_Ar`, `formeevaluation`.`ID` AS `feID`, `formeevaluation`.`Code` AS `feCode`, `formeevaluation`.`Nom_Ar` AS `feNom_Ar`, `formeevaluation`.`Nom_Fr` AS `feNom_Fr`\r\n"
				+ "FROM `controle` \r\n"
				+ "	LEFT JOIN `professeur` ON `controle`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID` \r\n"
				+ "	LEFT JOIN `utilisateur` ON `professeur`.`UtilisateurID` = `utilisateur`.`ID` \r\n"
				+ "	LEFT JOIN `matiere` ON `controle`.`MatiereID` = `matiere`.`ID` \r\n"
				+ "	LEFT JOIN `module` ON `controle`.`ModuleID` = `module`.`ID` \r\n"
				+ "	LEFT JOIN `formeevaluation` ON `controle`.`FormeEvaluationID` = `formeevaluation`.`ID`"
				+ " where `professeur`.`UtilisateurID` = ? and `controle`.`ClasseID` = ?;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, idProf);
		statement.setInt(2, idClasse);
		ResultSet rs = statement.executeQuery();
		ArrayList<Controle> controles = new ArrayList<Controle>();
		
		while (rs.next()) {
			Controle controle =new Controle();
			controle.setId(rs.getInt("ID"));
			controle.setComptabilise(rs.getBoolean("Comptabilise"));
			controle.setDateDepotNotes(rs.getDate("DateDepotNotes"));
			controle.setDatePassage(rs.getDate("DatePassage"));
			controle.setDatePlanifiee(rs.getDate("DatePlanifiee"));
			controle.setDescription(rs.getString("Description"));
			controle.setDuree(rs.getShort("Duree"));
			controle.setEtat(rs.getString("Etat"));
			controle.setObservation(rs.getString("Observation"));
			
			Classe classe = new Classe();
			classe.setId(rs.getInt("ClasseID"));
			//controle.setClasse(classe);
			
			Salle salle = new Salle();
			salle.setId(rs.getInt("SalleID"));
			controle.setSalle(salle);
			
			Matiere matiere = new Matiere();
			matiere.setId(rs.getInt("matID"));
			matiere.setCode(rs.getString("matCode"));
			matiere.setNom_Fr(rs.getString("matNom_Fr"));
			matiere.setNom_Ar(rs.getString("matNom_Ar"));
			controle.setMatiere(matiere);
			
			Module module = new Module();
			module.setId(rs.getInt("modID"));
			module.setCode(rs.getString("modCode"));
			module.setNom_Fr(rs.getString("modNom_Fr"));
			module.setNom_Ar(rs.getString("modNom_Ar"));
			controle.setModule(module);
			
			/*DocumentEvaluation docEvsujet = new DocumentEvaluation();
			docEvsujet.setId(rs.getInt("docevID"));
			docEvsujet.setCode(rs.getString("docevCode"));
			docEvsujet.setNom(rs.getString("docevNom"));
			docEvsujet.setEmplacement(rs.getString("docevEmplacement"));
			docEvsujet.setType(rs.getString("docevType"));
			docEvsujet.setDateUpload(rs.getDate("docevDateUpload"));
			controle.setSujet(docEvsujet);*/
			
			Professeur professeur = new Professeur();
			professeur.setId(rs.getInt("UtilisateurID"));
			professeur.setPhoto(rs.getString("Photo"));
			professeur.setNom_Fr(rs.getString("Nom_Fr"));
			professeur.setNom_Ar(rs.getString("Nom_Ar"));
			professeur.setPrenom_Fr(rs.getString("Prenom_Fr"));
			professeur.setPrenom_Ar(rs.getString("Prenom_Ar"));
			professeur.setSexe(rs.getString("Sexe"));
			professeur.setTitre(rs.getString("Titre"));
			professeur.setCin(rs.getString("Cin"));
			professeur.setNationalite(rs.getString("Nationalite"));
			professeur.setDateNais(rs.getDate("DateNais"));
			professeur.setLieuNais_Fr(rs.getString("LieuNais_Fr"));
			professeur.setLieuNais_Ar(rs.getString("LieuNais_Ar"));
			professeur.setAdresse_Fr(rs.getString("Adresse_Fr"));
			professeur.setAdresse_Ar(rs.getString("Adresse_Ar"));
			professeur.setEmail(rs.getString("Email"));
			professeur.setSituationF(rs.getString("SituationF"));
			professeur.setTeleMobile(rs.getString("TeleMobile"));
			professeur.setTeleDomicile(rs.getString("TeleDomicile"));
			
			Cycle cycle = new Cycle();
			cycle.setId(rs.getInt("CycleID"));
			professeur.setCycle(cycle);
			
			Specialite specialite = new Specialite();
			specialite.setId(rs.getInt("SpecialiteID"));
			professeur.setSpecialite(specialite);
			controle.setProfesseur(professeur);
			
			FormeEvaluation formeEvaluation = new FormeEvaluation();
			formeEvaluation.setId(rs.getInt("feID"));
			formeEvaluation.setCode(rs.getString("feCode"));
			formeEvaluation.setNom_Ar(rs.getString("feNom_Ar"));
			formeEvaluation.setNom_Fr(rs.getString("feNom_Fr"));
			controle.setFormeEvaluation(formeEvaluation);
			
			controles.add(controle);
		}
		rs.close();
		statement.close();
		return controles;
	}

	public int insert(Controle controle) throws SQLException {
	    PreparedStatement statement = (PreparedStatement) con.prepareStatement("INSERT INTO `controle` (`MatiereID`, `ModuleID`,`ClasseID`, `SalleID`, `ProfesseurUtilisateurID`, `FormeEvaluationID`) VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
	    statement.setInt(1, controle.getMatiere().getId());
	    if (controle.getModule().getId() != -1) {
	        statement.setInt(2, controle.getModule().getId());
	    } else {
	        statement.setNull(2, Types.INTEGER);
	    }
	    statement.setInt(3, controle.getClasse().getId());
	    statement.setInt(4, controle.getSalle().getId());
	    statement.setInt(5, controle.getProfesseur().getId());
	    statement.setInt(6, controle.getFormeEvaluation().getId());
	    statement.execute();
	    ResultSet rs = statement.getGeneratedKeys();
	    if (rs.next()) {
	        return rs.getInt(1);
	    }
	    statement.close();
	    return -1;
	}
	public void update(Controle controle) throws SQLException{
		PreparedStatement statement =(PreparedStatement) con.prepareStatement("update `controle` set `MatiereID` = ?, `ModuleID` = ?,`ClasseID` = ?, `SalleID` = ?, `ProfesseurUtilisateurID` = ?, `FormeEvaluationID` = ? where `ID` = ?");
		statement.setInt(1, controle.getMatiere().getId());
		statement.setInt(2, controle.getModule().getId());
		statement.setInt(3, controle.getClasse().getId());
		statement.setInt(4, controle.getSalle().getId());
		statement.setInt(5, controle.getProfesseur().getId());
		statement.setInt(6, controle.getFormeEvaluation().getId());
		statement.setInt(7, controle.getId());
		statement.execute();
		statement.close();
	}
	public void delete(Controle controle) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("DELETE FROM `controle` WHERE `ID` = ?");
		statement.setInt(1, controle.getId());
		statement.execute();
		statement.close();
	}
	public Controle getById(int id) throws SQLException{
		String query ="SELECT `controle`.*, `professeur`.*, `utilisateur`.*, `matiere`.`ID` AS `matID`, `matiere`.`Code` AS `matCode`, `matiere`.`Nom_Fr` AS `matNom_Fr`, `matiere`.`Nom_Ar` AS `matNom_Ar`, `module`.`ID` AS `modID`, `module`.`Code` AS `modCode`, `module`.`Nom_Fr` AS `modNom_Fr`, `module`.`Nom_Ar` AS `modNom_Ar`, `formeevaluation`.`ID` AS `feID`, `formeevaluation`.`Code` AS `feCode`, `formeevaluation`.`Nom_Ar` AS `feNom_Ar`, `formeevaluation`.`Nom_Fr` AS `feNom_Fr`\r\n"
				+ "FROM `controle` \r\n"
				+ "	LEFT JOIN `professeur` ON `controle`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID` \r\n"
				+ "	LEFT JOIN `utilisateur` ON `professeur`.`UtilisateurID` = `utilisateur`.`ID` \r\n"
				+ "	LEFT JOIN `matiere` ON `controle`.`MatiereID` = `matiere`.`ID` \r\n"
				+ "	LEFT JOIN `module` ON `controle`.`ModuleID` = `module`.`ID` \r\n"
				+ "	LEFT JOIN `formeevaluation` ON `controle`.`FormeEvaluationID` = `formeevaluation`.`ID` where `controle`.`ID` = ?;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		Controle controle = new Controle();
		while(rs.next()) {
			controle.setId(rs.getInt("ID"));
			controle.setComptabilise(rs.getBoolean("Comptabilise"));
			controle.setDateDepotNotes(rs.getDate("DateDepotNotes"));
			controle.setDatePassage(rs.getDate("DatePassage"));
			controle.setDatePlanifiee(rs.getDate("DatePlanifiee"));
			controle.setDescription(rs.getString("Description"));
			controle.setDuree(rs.getShort("Duree"));
			controle.setEtat(rs.getString("Etat"));
			controle.setObservation(rs.getString("Observation"));
			
			/*Classe classe = new Classe();
			classe.setId(rs.getInt("ClasseID"));
			controle.setClasse(classe);*/
			
			Salle salle = new Salle();
			salle.setId(rs.getInt("SalleID"));
			controle.setSalle(salle);
			
			Matiere matiere = new Matiere();
			matiere.setId(rs.getInt("matID"));
			matiere.setCode(rs.getString("matCode"));
			matiere.setNom_Fr(rs.getString("matNom_Fr"));
			matiere.setNom_Ar(rs.getString("matNom_Ar"));
			controle.setMatiere(matiere);
			
			Module module = new Module();
			module.setId(rs.getInt("modID"));
			module.setCode(rs.getString("modCode"));
			module.setNom_Fr(rs.getString("modNom_Fr"));
			module.setNom_Ar(rs.getString("modNom_Ar"));
			controle.setModule(module);
			
			/*DocumentEvaluation docEvsujet = new DocumentEvaluation();
			docEvsujet.setId(rs.getInt("docevID"));
			docEvsujet.setCode(rs.getString("docevCode"));
			docEvsujet.setNom(rs.getString("docevNom"));
			docEvsujet.setEmplacement(rs.getString("docevEmplacement"));
			docEvsujet.setType(rs.getString("docevType"));
			docEvsujet.setDateUpload(rs.getDate("docevDateUpload"));
			controle.setSujet(docEvsujet);*/
			
			Professeur professeur = new Professeur();
			professeur.setId(rs.getInt("UtilisateurID"));
			professeur.setPhoto(rs.getString("Photo"));
			professeur.setNom_Fr(rs.getString("Nom_Fr"));
			professeur.setNom_Ar(rs.getString("Nom_Ar"));
			professeur.setPrenom_Fr(rs.getString("Prenom_Fr"));
			professeur.setPrenom_Ar(rs.getString("Prenom_Ar"));
			professeur.setSexe(rs.getString("Sexe"));
			professeur.setTitre(rs.getString("Titre"));
			professeur.setCin(rs.getString("Cin"));
			professeur.setNationalite(rs.getString("Nationalite"));
			professeur.setDateNais(rs.getDate("DateNais"));
			professeur.setLieuNais_Fr(rs.getString("LieuNais_Fr"));
			professeur.setLieuNais_Ar(rs.getString("LieuNais_Ar"));
			professeur.setAdresse_Fr(rs.getString("Adresse_Fr"));
			professeur.setAdresse_Ar(rs.getString("Adresse_Ar"));
			professeur.setEmail(rs.getString("Email"));
			professeur.setSituationF(rs.getString("SituationF"));
			professeur.setTeleMobile(rs.getString("TeleMobile"));
			professeur.setTeleDomicile(rs.getString("TeleDomicile"));
			
			Cycle cycle = new Cycle();
			cycle.setId(rs.getInt("CycleID"));
			professeur.setCycle(cycle);
			
			Specialite specialite = new Specialite();
			specialite.setId(rs.getInt("SpecialiteID"));
			professeur.setSpecialite(specialite);
			controle.setProfesseur(professeur);
			
			FormeEvaluation formeEvaluation = new FormeEvaluation();
			formeEvaluation.setId(rs.getInt("feID"));
			formeEvaluation.setCode(rs.getString("feCode"));
			formeEvaluation.setNom_Ar(rs.getString("feNom_Ar"));
			formeEvaluation.setNom_Fr(rs.getString("feNom_Fr"));
			controle.setFormeEvaluation(formeEvaluation);
		}
		return controle;
	}
	public ArrayList<NoteControle> getNoteByControle(int controleId) throws SQLException{
		Controle controle = getById(controleId);
		String sql = "SELECT`ClasseID` FROM `controle` WHERE `ID` = ?";
		PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
		preparedStatement.setInt(1,controleId);
		ResultSet rs = preparedStatement.executeQuery();
		rs.next();
		int classId = rs.getInt("ClasseID");
		
		return null;
	}
	public static void main(String[] args) {
		ControleDAO controleDAO = new ControleDAO();
		try {
			controleDAO.getNoteByControle(3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
