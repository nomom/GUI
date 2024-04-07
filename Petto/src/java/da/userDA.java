/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package da;

/**
 *
 * @author Acer
 */
import javade.User;
import java.sql.*;

public class userDA {

    private String host = "jdbc:derby://localhost:1527/userdb";
    private String user = "nbuser";
    private String password = "123456";
    private static String tableName = "USERS";
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public userDA() {
        try {
            conn = DriverManager.getConnection(host, user, password);
        } catch (SQLException ex) {
            ex.printStackTrace(); // Better error handling         }
        }
    }

    //Get the username to check wheter it's valid or not.
    public boolean getUserName(User user) {
        String selectQuery = "SELECT * FROM " + tableName + " WHERE USERNAME = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(selectQuery);
            stmt.setString(1, user.getUserName());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace(); // Better error handling
        }
        return false;
    }

    //Get the user password to check wheter it's valid or not.
    public boolean validatePassword(User user) {
        String selectQuery = "SELECT * FROM " + tableName + " WHERE USERNAME = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(selectQuery);
            stmt.setString(1, user.getUserName());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                //Compare the object's details with database'.
                if (user.getUserName().equals(rs.getString("USERNAME")) && user.getPswd().equals(rs.getString("PASSWORD"))) {
                    return true;
                } else {
                    return false;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace(); // Better error handling
        }
        return false;
    }
    
    //Insert the user details to the database
    public void signupUser(User user) {

        try {
            String insertQuery = "INSERT INTO " + tableName + " VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getPswd());
            stmt.setBoolean(3, user.getIsAdmin());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(); // Better error handling
        }
    }


//    public static void main(String[] args) {
//        userDA usertry = new userDA();
//        User user1 = new User("Clement", "12345", false);
//        usertry.signupUser(user1);
//
//    }
}
