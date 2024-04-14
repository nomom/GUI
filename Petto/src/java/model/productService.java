/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.transaction.UserTransaction;

public class ProductService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;
    @Resource
    UserTransaction utx;

    public ProductService(EntityManager em) {
        this.em = em;
    }

    public ProductService(EntityManager em, UserTransaction utx) {
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
        Product products = em.find(Product.class, product.getProductid());
        if (products != null) {
            return products;
        }
        return products;
    }

    public Product findProductWithID(String id) {
        Product products = em.find(Product.class, id);
        if (products != null) {
            return products;
        }
        return products;
    }

    public Boolean validatePassword(Product product) {
        Product products = em.find(Product.class, product.getProductname());

        if (products.getProductname().equals(product.getProductname())) {
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

    public void deleteProduct(String id) {
        try {
            Product product = findProductWithID(id);
            em.remove(product);
        } catch (Exception ex) {

        }
    }

    public List<Product> findAll() {
        List userList = em.createNamedQuery("Product.findAll").getResultList();
        return userList;
    }

}
