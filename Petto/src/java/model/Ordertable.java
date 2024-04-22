/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MAMBA
 */
@Entity
@Table(name = "ORDERTABLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordertable.findAll", query = "SELECT o FROM Ordertable o"),
    @NamedQuery(name = "Ordertable.findByOrderid", query = "SELECT o FROM Ordertable o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Ordertable.findByUnitsold", query = "SELECT o FROM Ordertable o WHERE o.unitsold = :unitsold"),
    @NamedQuery(name = "Ordertable.findByPrice", query = "SELECT o FROM Ordertable o WHERE o.price = :price"),
    @NamedQuery(name = "Ordertable.findByDatepurchase", query = "SELECT o FROM Ordertable o WHERE o.datepurchase = :datepurchase"),
    @NamedQuery(name = "Ordertable.findByPaymentmethod", query = "SELECT o FROM Ordertable o WHERE o.paymentmethod = :paymentmethod"),
    @NamedQuery(name = "Ordertable.findByShipping", query = "SELECT o FROM Ordertable o WHERE o.shipping = :shipping")})
public class Ordertable implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDERID")
    private Integer orderid;
    @Column(name = "UNITSOLD")
    private Integer unitsold;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRICE")
    private Double price;
    @Column(name = "DATEPURCHASE")
    @Temporal(TemporalType.DATE)
    private Date datepurchase;
    @Size(max = 100)
    @Column(name = "PAYMENTMETHOD")
    private String paymentmethod;
    @Size(max = 100)
    @Column(name = "SHIPPING")
    private String shipping;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID")
    @ManyToOne
    private Product productid;
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    @ManyToOne
    private Users username;

    public Ordertable() {
    }

    public Ordertable(Integer unitsold, Double price, Date datepurchase, String shipping, String paymentmethod, Product productid, Users username) {
        this.unitsold = unitsold;
        this.price = price;
        this.datepurchase = datepurchase;
        this.shipping = shipping;
        this.paymentmethod = paymentmethod;
        this.productid = productid;
        this.username = username;
    }

    
    public Ordertable(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUnitsold() {
        return unitsold;
    }

    public void setUnitsold(Integer unitsold) {
        this.unitsold = unitsold;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getDatepurchase() {
        return datepurchase;
    }

    public void setDatepurchase(Date datepurchase) {
        this.datepurchase = datepurchase;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public Product getProductid() {
        return productid;
    }

    public void setProductid(Product productid) {
        this.productid = productid;
    }

    public Users getUsername() {
        return username;
    }

    public void setUsername(Users username) {
        this.username = username;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ordertable)) {
            return false;
        }
        Ordertable other = (Ordertable) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Ordertable[ orderid=" + orderid + " ]";
    }
    
}
