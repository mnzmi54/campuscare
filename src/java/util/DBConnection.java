//CAMPUSCARE 2026
package util;
import java.sql.*;
public class DBConnection {
    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/campuscare";
        String username = "root";
        String password = "";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Database Connected");
        } catch(Exception e){
            e.printStackTrace();
        } return con;
    }
}
