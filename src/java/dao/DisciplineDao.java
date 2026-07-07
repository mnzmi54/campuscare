//CAMPUSCARE 2026
package dao;

import java.sql.*;
import util.DBConnection;

public class DisciplineDao {
    public String addDiscipline(int studentID, int hepID, String offenseType, String description, String offenseDate) {
        try {
            Connection con = DBConnection.createConnection();
            String sql = "INSERT INTO discipline(studentID, hepID, offenseType, description, offenseDate, status) VALUES (?, ?, ?, ?, ?, 'Pending')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentID);
            ps.setInt(2, hepID);
            ps.setString(3, offenseType);
            ps.setString(4, description);
            ps.setString(5, offenseDate);
            
            int i = ps.executeUpdate();
            if(i > 0) {
                return "SUCCESS";
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return "FAILED";
    }
    
    public ResultSet getAllStudents() {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT userID, fullName FROM users WHERE role = 'Student'";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public ResultSet getAllDiscipline() {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT d.disciplineID, u.fullName, d.offenseType, d.description, d.offenseDate, d.status "
                    + "FROM discipline d JOIN users u ON d.studentID = u.userID";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public ResultSet getDisciplineById(int id) {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT d.disciplineID, d.studentID, u.fullName, d.offenseType, d.description, d.offenseDate, d.status "
                    + "FROM discipline d JOIN users u ON d.studentID = u.userID WHERE d.disciplineID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public void updateStatus(int id, String status) {
        try {
            Connection con = DBConnection.createConnection();
            String sql = "UPDATE discipline SET status = ? WHERE disciplineID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteDiscipline(int id) {
        try {
            Connection con = DBConnection.createConnection();
            String sql = "DELETE FROM discipline WHERE disciplineID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public ResultSet getDisciplineByStudent(int studentID) {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT d.disciplineID, u.fullName, d.offenseType, d.description, d.offenseDate, d.status "
                    + "FROM discipline d JOIN users u ON d.studentID = u.userID WHERE d.studentID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentID);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public int getTotalDiscipline() {
        int total = 0;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT COUNT(*) AS total FROM discipline";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return total;
    }
    
    public int getPendingDiscipline() {
        int total = 0;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT COUNT(*) AS total FROM discipline WHERE status = 'Pending'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return total;
    }
    
    public ResultSet getTopOffense() {
        ResultSet rs = null;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT offenseType, COUNT(*) AS total FROM discipline GROUP BY offenseType ORDER BY total DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
}
