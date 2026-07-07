//CAMPUSCARE 2026
package dao;

import bean.UserBean;
import java.sql.*;
import util.DBConnection;

public class LoginDao {
    public UserBean authenticateUser(String email, String password) {
        UserBean user = null;
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                user = new UserBean();
                user.setUserID(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullName"));
                user.setRole(rs.getString("role"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } return user;
    }
}
