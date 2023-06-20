package test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import Domaine.evaluation.NoteControle;
import dao.evaluation.NoteControleDAO;

class NoteControleDaoTest {

    private NoteControleDAO dao;
    
    @Before
    void setUp() throws Exception {
        dao = new NoteControleDAO();
    }

    @Test
    void testGetByEtudiantForEtudiant() {
        try {
            ArrayList<NoteControle> result = dao.getByEtudiantForEtudiant(1);
            assertNotNull(result);
            assertTrue(result.size() > 0);
            for(NoteControle noteControle: result) {
                assertEquals(noteControle.getControle().getModule(), "Développement WEB");
            }
        } catch (SQLException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }
}
