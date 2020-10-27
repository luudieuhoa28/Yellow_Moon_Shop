/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

import com.hoald.categry.Category;
import com.hoald.order.OrderDetail;
import com.hoald.updatedetail.UpdateDetail;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author dell
 */
@Entity
@Table(name = "Cake")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cake.findAll", query = "SELECT c FROM Cake c")
    , @NamedQuery(name = "Cake.findById", query = "SELECT c FROM Cake c WHERE c.id = :id")
    , @NamedQuery(name = "Cake.findByName", query = "SELECT c FROM Cake c WHERE c.name = :name")
    , @NamedQuery(name = "Cake.findByImagePath", query = "SELECT c FROM Cake c WHERE c.imagePath = :imagePath")
    , @NamedQuery(name = "Cake.findByDescription", query = "SELECT c FROM Cake c WHERE c.description = :description")
    , @NamedQuery(name = "Cake.findByPrice", query = "SELECT c FROM Cake c WHERE c.price = :price")
    , @NamedQuery(name = "Cake.findByCreateDate", query = "SELECT c FROM Cake c WHERE c.createDate = :createDate")
    , @NamedQuery(name = "Cake.findByExprirationDate", query = "SELECT c FROM Cake c WHERE c.exprirationDate = :exprirationDate")
    , @NamedQuery(name = "Cake.findByQuantity", query = "SELECT c FROM Cake c WHERE c.quantity = :quantity")
    , @NamedQuery(name = "Cake.findByStatus", query = "SELECT c FROM Cake c WHERE c.status = :status")})
public class Cake implements Serializable {

    private static final long serialVersionUID = 1L;
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "imagePath")
    private String imagePath;
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private BigDecimal price;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "exprirationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date exprirationDate;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "status")
    private Boolean status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cake")
    private Collection<com.hoald.order.OrderDetail> orderDetailCollection;
    @JoinColumn(name = "categoryId", referencedColumnName = "id")
    @ManyToOne
    private com.hoald.categry.Category categoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cake")
    private Collection<com.hoald.updatedetail.UpdateDetail> updateDetailCollection;

    public String getDateFormat(Date date) {
        String result = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            result = formatter.format(date);
        } catch (Exception e) {
        }
        return result;
    }

    public Cake() {
    }

    public Cake(Integer id) {
        this.id = id;
    }

    public Cake(Integer id, String name, String imagePath, String description, BigDecimal price, Date createDate, Date exprirationDate, int quantity, boolean status) {
        this.id = id;
        this.name = name;
        this.imagePath = imagePath;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.exprirationDate = exprirationDate;
        this.quantity = quantity;
        this.status = status;
    }

    public Cake(int id, String name, String imagePath, String description, BigDecimal price, Date createDate, Date exprirationDate, int quantity, boolean status, com.hoald.categry.Category categoryId) {
        this.name = name;
        this.imagePath = imagePath;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.exprirationDate = exprirationDate;
        this.quantity = quantity;
        this.status = status;
        this.categoryId = categoryId;
        this.id = id;
    }

    public Cake(String name, String imagePath, String description, BigDecimal price, Date createDate, Date exprirationDate, int quantity, boolean status, com.hoald.categry.Category category) {
        this.name = name;
        this.imagePath = imagePath;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.exprirationDate = exprirationDate;
        this.quantity = quantity;
        this.status = status;
        this.categoryId = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExprirationDate() {
        return exprirationDate;
    }

    public void setExprirationDate(Date exprirationDate) {
        this.exprirationDate = exprirationDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    @XmlTransient
    public Collection<UpdateDetail> getUpdateDetailCollection() {
        return updateDetailCollection;
    }

    public void setUpdateDetailCollection(Collection<UpdateDetail> updateDetailCollection) {
        this.updateDetailCollection = updateDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cake)) {
            return false;
        }
        Cake other = (Cake) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hoald.entites.Cake[ id=" + id + " ]";
    }

}
