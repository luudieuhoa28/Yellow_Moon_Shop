/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.updatedetail;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author dell
 */
@Embeddable
public class UpdateDetailPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "userId")
    private String userId;
    @Basic(optional = false)
    @Column(name = "cakeId")
    private int cakeId;

    public UpdateDetailPK() {
    }

    public UpdateDetailPK(String userId, int cakeId) {
        this.userId = userId;
        this.cakeId = cakeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getCakeId() {
        return cakeId;
    }

    public void setCakeId(int cakeId) {
        this.cakeId = cakeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        hash += (int) cakeId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UpdateDetailPK)) {
            return false;
        }
        UpdateDetailPK other = (UpdateDetailPK) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        if (this.cakeId != other.cakeId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hoald.entites.UpdateDetailPK[ userId=" + userId + ", cakeId=" + cakeId + " ]";
    }
    
}
