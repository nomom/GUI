/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.transaction.UserTransaction;

public class productService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;
    @Resource
    UserTransaction utx;

    public productService(EntityManager em) {
        this.em = em;
    }

    public productService(EntityManager em, UserTransaction utx) {
        this.em = em;
        this.utx = utx;
    }

    public Boolean findpID(String productID) {
        Product product = em.find(Product.class, productID);

        if (product == null) {
            return false;
        } else {
            return true;
        }
    }
    
        public Product findpID(Product product) {
        Product products = em.find(Product.class, product.getProductID());
        if (products!= null) {
            return products;
        }
        return products;
    }


    public Boolean validatePassword(Product product) {
        Product products = em.find(Product.class, product.getProductName());

        if (products.getProductName().equals(product.getProductName())) {
            return true;
        } else {
            return false;
        }
    }

    public void addProduct(Product product) {
        try {
            utx.begin();
            em.persist(product);
            utx.commit();
        } catch (Exception ex) {

        }
    }

}
