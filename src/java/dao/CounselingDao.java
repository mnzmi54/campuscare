//CAMPUSCARE 2026
package dao;

import java.sql.*;
import util.DBConnection;

public class CounselingDao {
    public String scheduleSession(int disciplineID, int counselorID, String sessionDate, String sessionTime, String notes) {
        try {
            Connection con = DBConnection.createConnection();
            String sql = "INSERT INTO counseling(disciplineID, counselorID, sessionDate, sessionTime, sessionStatus, notes) VALUES (?, ?, ?, ?, 'Scheduled', ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, disciplineID);
            ps.setInt(2, counselorID);
            ps.setString(3, sessionDate);
            ps.setString(4, sessionTime);
            ps.setString(5, notes);
            
            int i = ps.executeUpdate();
            if(i > 0) {
                return "SUCCESS";
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return "FAILED";
    }
    
    public ResultSet getPendingDiscipline() {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT d.disciplineID, u.fullName, d.offenseType FROM discipline d JOIN users u ON d.studentID = u.userID WHERE d.status = 'Pending'";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public ResultSet getAllSessions() {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT c.sessionID, u.fullName, d.offenseType, c.sessionDate, c.sessionTime, c.sessionStatus "
                    + "FROM counseling c JOIN discipline d ON c.disciplineID = d.disciplineID JOIN users u ON d.studentID = u.userID "
                    + "ORDER BY c.sessionDate DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public ResultSet getSessionById(int id) {
        ResultSet rs = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT * FROM counseling WHERE sessionID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public void updateSession(int sessionID, String status, String notes) {
        try {
            Connection con = DBConnection.createConnection();
            String sql = "UPDATE counseling SET sessionStatus = ?, notes = ? WHERE sessionID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, notes);
            ps.setInt(3, sessionID);
            ps.executeUpdate();
            
            if(status.equals("Completed")) {
                String sql2 = "UPDATE discipline d JOIN counseling c ON d.disciplineID = c.disciplineID SET d.status = 'Completed' "
                        + "WHERE c.sessionID = ?";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, sessionID);
                ps2.executeUpdate();
            } else if(status.equals("Missed")||status.equals("Cancelled")) {
                String sql2 = "UPDATE discipline d JOIN counseling c ON d.disciplineID = c.disciplineID SET d.status = 'Pending' "
                        + "WHERE c.sessionID = ?";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, sessionID);
                ps2.executeUpdate();
            } else {
                String sql2 = "UPDATE discipline d JOIN counseling c ON d.disciplineID = c.disciplineID SET d.status = 'Counseling Scheduled' "
                        + "WHERE c.sessionID = ?";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, sessionID);
                ps2.executeUpdate();
            }
        } catch(Exception e) {
            e.printStackTrace();
        } 
    }
    
    public ResultSet getStudentSessions(int studentID) {
        ResultSet rs = null;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT c.sessionID, d.offenseType, c.sessionDate, c.sessionTime, c.sessionStatus, c.notes "
                    + "FROM counseling c JOIN discipline d ON c.disciplineID = d.disciplineID WHERE d.studentID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentID);
            rs = ps.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        } return rs;
    }
    
    public int getTotalSession() {
        int total = 0;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT COUNT(*) AS total FROM counseling";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return total;
    }
    
    public int getScheduledSessions() {
        int total = 0;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT COUNT(*) AS total FROM counseling WHERE sessionStatus = 'Scheduled'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return total;
    }
    
    public int getCompletedSessions() {
        int total = 0;
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT COUNT(*) AS total FROM counseling WHERE sessionStatus = 'Completed'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return total;
    }
}
