package dao.evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domaine.classe.Classe;
import Domaine.evaluation.DocumentEvaluation;
import Domaine.evaluation.Examen;
import Domaine.evaluation.FormeEvaluation;
import Domaine.evaluation.TypeExamen;
import Domaine.locaux.Salle;
import Domaine.matiere.Matiere;
import Domaine.personnel.Professeur;
import dao.database.Db;

public class ExamenDAO {
    private Connection connection;

    public ExamenDAO(Connection connection) {
    	this.connection = Db.getInstance().con;
    }

    public ArrayList<Examen> getAllExamens() throws SQLException {
        ArrayList<Examen> examens = new ArrayList<>();
        String query = "SELECT `examen`.*, `professeur`.*, `utilisateur`.*, `matiere`.`ID` AS `matID`, `matiere`.`Code` AS `matCode`, `matiere`.`Nom_Fr` AS `matNom_Fr`, `matiere`.`Nom_Ar` AS `matNom_Ar`, `formeevaluation`.`ID` AS `feID`, `formeevaluation`.`Code` AS `feCode`, `formeevaluation`.`Nom_Ar` AS `feNom_Ar`, `formeevaluation`.`Nom_Fr` AS `feNom_Fr`\r\n"
        		+ "FROM `examen`\r\n"
        		+ "    LEFT JOIN `professeur` \r\n"
        		+ "    ON `examen`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID`\r\n"
        		+ "    LEFT JOIN `utilisateur` \r\n"
        		+ "    ON `professeur`.`UtilisateurID` = `utilisateur`.`ID`\r\n"
        		+ "    LEFT JOIN `matiere` \r\n"
        		+ "    ON `examen`.`MatiereID` = `matiere`.`ID`\r\n"
        		+ "    LEFT JOIN `formeevaluation` \r\n"
        		+ "    ON `examen`.`FormeEvaluationID` = `formeevaluation`.`ID`;";

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Examen examen = createExamenFromResultSet(rs);
                examens.add(examen);
            }
        }

        return examens;
    }

    public Examen getExamenById(int id) throws SQLException {
        String query = "SELECT * FROM Examen WHERE ID = ?";
        Examen examen = null;

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    examen = createExamenFromResultSet(rs);
                }
            }
        }

        return examen;
    }

    // Other CRUD methods (create, update, delete) can be implemented here

    private Examen createExamenFromResultSet(ResultSet rs) throws SQLException {
        Examen examen = new Examen();
        // Set examen properties from the ResultSet
        examen.setId(rs.getInt("ID"));
        TypeExamen typeExamen = new TypeExamen();
        typeExamen.setId(rs.getInt("TypeExamenID"));
        examen.setType(typeExamen);
        examen.setSession(rs.getString("Session"));
        Matiere matiere = new Matiere();
        matiere.setId(rs.getInt("matID"));
        matiere.setCode(rs.getString("matCode"));
        matiere.setNom_Fr(rs.getString("matNom_Fr"));
        matiere.setNom_Ar(rs.getString("matMat_Ar"));
        examen.setMatiere(matiere);
        Classe classe = new Classe();
        classe.setId(rs.getInt("ClasseID"));
        examen.setClasse(classe);
        Salle salle = new Salle();
        salle.setId(rs.getInt("SalleID"));
        examen.setSalle(salle);
        Professeur professeur = new Professeur();
        professeur.setId(rs.getInt("ProfesseurUtilisateurID"));
        
        examen.setProfesseur(professeur);
        FormeEvaluation formeEvaluation = new FormeEvaluation();
        formeEvaluation.setId(rs.getInt("FormeEvaluationID"));
        examen.setFormeEvaluation(formeEvaluation);
        examen.setCode(rs.getString("Code"));
        examen.setDateDepotNotes(rs.getDate("DateDepotNotes"));
        examen.setDatePassage(rs.getDate("DatePassage"));
        examen.setDatePlanifiee(rs.getDate("DatePlanifiee"));
        examen.setDescription(rs.getString("Description"));
        examen.setDuree(rs.getShort("Duree"));
        examen.setEtat(rs.getString("Etat"));
        examen.setObservation(rs.getString("Observation"));

        return examen;
    }
}
