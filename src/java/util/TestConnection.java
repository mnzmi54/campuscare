//CAMPUSCARE 2026
package util;
import java.sql.*;

public class TestConnection {
    public static void main(String[] args) {
        Connection con = DBConnection.createConnection();
        
        if (con != null) {
            System.out.println("Connection Successful!");
        } else {
            System.out.println("Connection Failed!");
        }
    }
}
