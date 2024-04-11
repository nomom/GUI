/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.transaction.UserTransaction;

public class UserService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;
    @Resource
    UserTransaction utx;

    public UserService(EntityManager em) {
        this.em = em;
    }

    public UserService(EntityManager em, UserTransaction utx) {
        this.em = em;
        this.utx = utx;
    }

    public Boolean findUsername(String username) {
        Users user = em.find(Users.class, username);

        if (user == null) {
            return false;
        } else {
            return true;
        }
    }

    public Users findUser(Users user) {
        Users users = em.find(Users.class, user.getUserName());
        if (users != null) {
            return users;
        }
        return users;
    }

    public Boolean validatePassword(Users user) {
        Users users = em.find(Users.class, user.getUserName());

        if (users.getPswd().equals(user.getPswd())) {
            return true;
        } else {
            return false;
        }
    }

    public void addUser(Users user) {
        try {
            utx.begin();
            em.persist(user);
            utx.commit();
        } catch (Exception ex) {

        }
    }

    public List<Users> findAll() {
        List userList = em.createNamedQuery("Users.findAll").getResultList();
        return userList;
    }

}
