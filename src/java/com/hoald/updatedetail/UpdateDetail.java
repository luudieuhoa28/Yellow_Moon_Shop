/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.updatedetail;

import com.hoald.user.Users;
import com.hoald.cake.Cake;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dell
 */
@Entity
@Table(name = "UpdateDetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UpdateDetail.findAll", query = "SELECT u FROM UpdateDetail u")
    , @NamedQuery(name = "UpdateDetail.findByUserId", query = "SELECT u FROM UpdateDetail u WHERE u.updateDetailPK.userId = :userId")
    , @NamedQuery(name = "UpdateDetail.findByCakeId", query = "SELECT u FROM UpdateDetail u WHERE u.updateDetailPK.cakeId = :cakeId")
    , @NamedQuery(name = "UpdateDetail.findByDate", query = "SELECT u FROM UpdateDetail u WHERE u.date = :date")})
public class UpdateDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UpdateDetailPK updateDetailPK;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "cakeId", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Cake cake;
    @JoinColumn(name = "userId", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Users users;

    public UpdateDetail() {
    }

    public UpdateDetail(com.hoald.updatedetail.UpdateDetailPK updateDetailPK) {
        this.updateDetailPK = updateDetailPK;
    }

    public UpdateDetail(String userId, int cakeId) {
        this.updateDetailPK = new com.hoald.updatedetail.UpdateDetailPK(userId, cakeId);
    }

    public UpdateDetail(Date date, com.hoald.cake.Cake cake, com.hoald.user.Users users) {
        this.date = date;
        this.cake = cake;
        this.users = users;
    }

    public UpdateDetail(UpdateDetailPK updateDetailPK, Date date, Cake cake, Users users) {
        this.updateDetailPK = updateDetailPK;
        this.date = date;
        this.cake = cake;
        this.users = users;
    }
    

    public void setUpdateDetailPK(UpdateDetailPK updateDetailPK) {
        this.updateDetailPK = updateDetailPK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Cake getCake() {
        return cake;
    }

    public void setCake(Cake cake) {
        this.cake = cake;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (updateDetailPK != null ? updateDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UpdateDetail)) {
            return false;
        }
        UpdateDetail other = (UpdateDetail) object;
        if ((this.updateDetailPK == null && other.updateDetailPK != null) || (this.updateDetailPK != null && !this.updateDetailPK.equals(other.updateDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hoald.entites.UpdateDetail[ updateDetailPK=" + updateDetailPK + " ]";
    }

}
