/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.updatedetail;

import com.hoald.updatedetail.UpdateDetailPK;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author dell
 */
public class UpdateDetailBLO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");

    public void makeUpdateCake(com.hoald.updatedetail.UpdateDetail updateDetail) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            com.hoald.updatedetail.UpdateDetail tmpUpdateDetail = (com.hoald.updatedetail.UpdateDetail) entityManager.createQuery("SELECT u FROM UpdateDetail u WHERE u.cake.id = :cakeId")
                    .setParameter("cakeId", updateDetail.getCake().getId())
                    .getSingleResult();
            if (tmpUpdateDetail != null) {
                tmpUpdateDetail.setUsers(updateDetail.getUsers());
                tmpUpdateDetail.setDate(updateDetail.getDate());
                tmpUpdateDetail.setUpdateDetailPK(new UpdateDetailPK(updateDetail.getUsers().getId(), updateDetail.getCake().getId()));
            }

            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("UpdateDetailBLO: " + e);
            Logger.getLogger("UpdateDetailBLO: " + e);
            entityManager.persist(updateDetail);
            entityManager.getTransaction().commit();
        }
    }
}
