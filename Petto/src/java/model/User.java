/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;


/**
 *
 * @author Acer
 */
@Entity
@Table(name = "USERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "USERS.findAll", query = "SELECT i FROM USERS i"),
    @NamedQuery(name = "USERS.findByUsername", query = "SELECT i FROM USERS i WHERE i.username = :username")})

public class User {
    @Id
    @NotNull
    @Column(name = "USERNAME")
    private String userName;
    @Column(name = "PASSWORD")
    private String pswd;
//    private String cartID;
    @Column(name = "ISADMIN")
    private boolean isAdmin;
   
    
    public User(String userName,String pswd,boolean isAdmin){
        this.userName = userName;
        this.pswd = pswd;
        this.isAdmin = isAdmin;
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
