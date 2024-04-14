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
 * @author MAMBA
 */
@Entity
@Table(name = "PRODUCT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByProductid", query = "SELECT p FROM Product p WHERE p.productid = :productid"),
    @NamedQuery(name = "Product.findByProductname", query = "SELECT p FROM Product p WHERE p.productname = :productname"),
    @NamedQuery(name = "Product.findByProductdesc", query = "SELECT p FROM Product p WHERE p.productdesc = :productdesc"),
    @NamedQuery(name = "Product.findByProductprice", query = "SELECT p FROM Product p WHERE p.productprice = :productprice"),
    @NamedQuery(name = "Product.findByProductqty", query = "SELECT p FROM Product p WHERE p.productqty = :productqty"),
    @NamedQuery(name = "Product.findByProducturl", query = "SELECT p FROM Product p WHERE p.producturl = :producturl"),
    @NamedQuery(name = "Product.findByAmountsold", query = "SELECT p FROM Product p WHERE p.amountsold = :amountsold")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "PRODUCTID")
    private String productid;
    @Size(max = 100)
    @Column(name = "PRODUCTNAME")
    private String productname;
    @Size(max = 500)
    @Column(name = "PRODUCTDESC")
    private String productdesc;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRODUCTPRICE")
    private Double productprice;
    @Column(name = "PRODUCTQTY")
    private Integer productqty;
    @Size(max = 200)
    @Column(name = "PRODUCTURL")
    private String producturl;
    @Column(name = "AMOUNTSOLD")
    private Integer amountsold;

    public Product() {
    }

    public Product(String id, String name, String desc, double price, int qty, String url, int amountSold) {
        this.productid = id;
        this.productname = name;
        this.productdesc = desc;
        this.productprice = price;
        this.productqty = qty;
        this.producturl = url;
        this.amountsold = amountSold;
    }

    public Product(String productid) {
        this.productid = productid;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductdesc() {
        return productdesc;
    }

    public void setProductdesc(String productdesc) {
        this.productdesc = productdesc;
    }

    public Double getProductprice() {
        return productprice;
    }

    public void setProductprice(Double productprice) {
        this.productprice = productprice;
    }

    public Integer getProductqty() {
        return productqty;
    }

    public void setProductqty(Integer productqty) {
        this.productqty = productqty;
    }

    public String getProducturl() {
        return producturl;
    }

    public void setProducturl(String producturl) {
        this.producturl = producturl;
    }

    public Integer getAmountsold() {
        return amountsold;
    }

    public void setAmountsold(Integer amountsold) {
        this.amountsold = amountsold;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productid != null ? productid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productid == null && other.productid != null) || (this.productid != null && !this.productid.equals(other.productid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Product[ productid=" + productid + " ]";
    }

}
