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
    void testGetByControle() {
        try {
            ArrayList<NoteControle> result = dao.getByControle(25);
            assertNotNull(result);
            assertTrue(result.size() > 0);
            for(NoteControle noteControle: result) {
                assertNotNull(noteControle.getId());
                assertNotNull(noteControle.getEtudiant());
                assertNotNull(noteControle.getNote());
                assertNotNull(noteControle.isValide());
                assertNotNull(noteControle.getObservation());
            }
        } catch (SQLException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }
}
