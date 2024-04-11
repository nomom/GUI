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
@Table(name = "PRODUCT")
@XmlRootElement
public class Product implements Serializable{
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTID")
    private String productID;
    @Column(name="PRODUCTNAME")
    private String productName;
    @Column(name="PRODUCTDESC")
    private String productDesc;
    @Column(name="PRODUCTPRICE")
    private double productPrice;
    @Column(name="PRODUCTQTY")
    private int productQty;
    @Column(name="PRODUCTURL")
    private String productUrl;
    @Column(name="AMOUNTSOLD")
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
