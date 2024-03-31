/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javade;

/**
 *
 * @author Acer
 */
public class User {
    private String userID;
    private String userName;
    private String pswd;
    private boolean isAdmin;
    private Cart cart;
    private static int userCount = 000;
    
    public User(String userName,String pswd,boolean isAdmin, String cartID){
        userCount ++;
        this.userName = userName;
        this.pswd = pswd;
        this.isAdmin = isAdmin;
        this.userID = String.format("U%03d", userCount);
        
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
    
}
