/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.transaction.UserTransaction;

public class CartService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;
    @Resource
    UserTransaction utx;

    public CartService(EntityManager em) {
        this.em = em;
    }

    public CartService(EntityManager em, UserTransaction utx) {
        this.em = em;
        this.utx = utx;
    }

    public Cart findUserWithCartID(int cartid) {
        Cart cart = em.find(Cart.class, cartid);
        if (cart != null) {
            return cart;
        }
        return cart;
    }

}
