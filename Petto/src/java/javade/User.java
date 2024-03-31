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
    private String cartID;
    private boolean isAdmin;
   
    private static int userCount = 0;
    
    public User(String userName,String pswd,boolean isAdmin){
        userCount ++;
        this.userName = userName;
        this.pswd = pswd;
        this.isAdmin = isAdmin;
        this.userID = String.format("U%03d", userCount);
        this.cartID = String.format("C%30d", userCount);
        
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
