package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class UserService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public UserService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addUser(User user) {
        mgr.persist(user);
        return true;
    }

    public User findUserName(String username) {
        User user = mgr.find(User.class, username);
        return user;
    }

    public List<User> findAll() {
        List userList = mgr.createNamedQuery("Item.findAll").getResultList();
        return userList;
    }

}
