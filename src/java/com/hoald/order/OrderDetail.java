/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.order;

import com.hoald.cake.Cake;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dell
 */
@Entity
@Table(name = "OrderDetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o")
    , @NamedQuery(name = "OrderDetail.findByOrderId", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.orderId = :orderId")
    , @NamedQuery(name = "OrderDetail.findByCakeId", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailPK.cakeId = :cakeId")
    , @NamedQuery(name = "OrderDetail.findByQuantity", query = "SELECT o FROM OrderDetail o WHERE o.quantity = :quantity")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected com.hoald.order.OrderDetailPK orderDetailPK;
    @Basic(optional = false)
    @Column(name = "quantity")
    private int quantity;
    @JoinColumn(name = "cakeId", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private com.hoald.cake.Cake cake;
    @JoinColumn(name = "orderId", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private com.hoald.order.Orders orders;

    public OrderDetail() {
    }

    public OrderDetail(com.hoald.order.OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public OrderDetail(com.hoald.order.OrderDetailPK orderDetailPK, int quantity) {
        this.orderDetailPK = orderDetailPK;
        this.quantity = quantity;
    }

    public OrderDetail(int quantity, com.hoald.cake.Cake cake, com.hoald.order.Orders orders) {
        this.quantity = quantity;
        this.cake = cake;
        this.orders = orders;
    }

    public OrderDetail(com.hoald.order.OrderDetailPK orderDetailPK, int quantity, com.hoald.cake.Cake cake, com.hoald.order.Orders orders) {
        this.orderDetailPK = orderDetailPK;
        this.quantity = quantity;
        this.cake = cake;
        this.orders = orders;
    }

    public OrderDetail(int orderId, int cakeId) {
        this.orderDetailPK = new OrderDetailPK(orderId, cakeId);
    }

    public OrderDetailPK getOrderDetailPK() {
        return orderDetailPK;
    }

    public void setOrderDetailPK(OrderDetailPK orderDetailPK) {
        this.orderDetailPK = orderDetailPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cake getCake() {
        return cake;
    }

    public void setCake(Cake cake) {
        this.cake = cake;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailPK != null ? orderDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.orderDetailPK == null && other.orderDetailPK != null) || (this.orderDetailPK != null && !this.orderDetailPK.equals(other.orderDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hoald.entites.OrderDetail[ orderDetailPK=" + orderDetailPK + " ]";
    }
    
}
