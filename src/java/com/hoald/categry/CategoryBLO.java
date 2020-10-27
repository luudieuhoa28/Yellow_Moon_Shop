/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.categry;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

/**
 *
 * @author dell
 */
public class CategoryBLO {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");
    public List<com.hoald.categry.Category> getListCategory() {
        EntityManager entityManager = emf.createEntityManager();
        try {
            Query query = entityManager.createQuery("SELECT c FROM Category c");
            return (List<com.hoald.categry.Category>) query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    public com.hoald.categry.Category getCategoryByid(int id) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            return entityManager.find(com.hoald.categry.Category.class, id);
        } catch (Exception e) {
            return null;
        }
    }
}
