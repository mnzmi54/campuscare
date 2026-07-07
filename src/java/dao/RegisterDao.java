//CAMPUSCARE 2026
package dao;

import bean.UserBean;
import java.sql.*;
import util.DBConnection;

public class RegisterDao {
    public static String registerUser(UserBean user) {
        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.createConnection();
            
            String checkSql = "SELECT * FROM users WHERE username=? OR email=?";
            psCheck = con.prepareStatement(checkSql);
            psCheck.setString(1, user.getUsername());
            psCheck.setString(2, user.getEmail());
            
            rs = psCheck.executeQuery();
            
            if(rs.next()) {
                return "Username or Email already exists";
            }
            
            String insertSql = "INSERT INTO users (username, password, email, fullName, role) VALUES (?, ?, ?, ?, ?)";
            psInsert  = con.prepareStatement(insertSql);
            
            psInsert.setString(1, user.getUsername());
            psInsert.setString(2, user.getPassword());
            psInsert.setString(3, user.getEmail());
            psInsert.setString(4, user.getFullName());
            psInsert.setString(5, user.getRole());
            
            int i = psInsert.executeUpdate();
            if(i > 0) {
                return "SUCCESS";
            } 
        } catch(Exception e) {
            e.printStackTrace();
        } return "Something went wrong during registration";
    }
}
