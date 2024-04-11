/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Acer
 */
public class Product {

    private String productID;
    private String productName;
    private String productDesc;
    private double productPrice;
    private int productQty;
    private String productUrl;
    private int amountSold;

    public Product() {
    }

    public Product(String productID, String productName,String productDesc, double productPrice, int productQty,String productUrl, int amountSold) {
        this.productID = productID;
        this.productName = productName;
        this.productDesc = productDesc;
        this.productPrice = productPrice;
        this.productQty = productQty;
        this.productUrl = productUrl;
        this.amountSold = amountSold;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQty() {
        return productQty;
    }

    public void setProductQty(int productQty) {
        this.productQty = productQty;
    }

    public int getAmountSold() {
        return amountSold;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    public void setAmountSold(int amountSold) {
        this.amountSold = amountSold;
    }

    public double priceSold(int wantToBuy) {
        double sex = wantToBuy * productPrice;
        return sex;
    }
}
