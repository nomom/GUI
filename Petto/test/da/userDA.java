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
import javax.swing.*;
public class userDA {
    private String host = "jdbc:derby://localhost:1527/userdb";
    private String user = "nbuser";
    private String password = "123456";
    private static String tableName = "USERS";
    private Connection conn;
    private PreparedStatement stmt;
    private String selectQ = "Select * from "+tableName;
    private String insertQ = "INSERT INTO " + tableName + " VALUES (?,?,?,?)";
    private ResultSet rs;
    
    public userDA(){
        try{
            conn = DriverManager.getConnection(host,user,password);
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(),"Error connecting SQL", JOptionPane.ERROR_MESSAGE);
        }
    }
    public void getUser(User user){
        try{
            stmt = conn.prepareStatement(selectQ);
            stmt.setString(1, user.getUserID());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getPswd());
            stmt.setBoolean(4,user.getIsAdmin());
            
            stmt.executeQuery();
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(),"Error on adding user", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void signupUser(User user){
        try{
//            if(){
//                
//            }else{
//                
//            }
            stmt = conn.prepareStatement(insertQ);
            stmt.setString(1, user.getUserID());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getPswd());
            stmt.setBoolean(4,user.getIsAdmin());
            
            stmt.executeUpdate();
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(),"Error on adding user", JOptionPane.ERROR_MESSAGE);
        }
    }
    public void loginUser(){
        
    }
    public static void main(String[] args) {
        userDA usertry = new userDA();
        User user1 = new User("Clement","12345",false,"randomcartID");
        usertry.signupUser(user1);
        
    }
    
}
