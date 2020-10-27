/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.user;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

/**
 * @author dell
 */
public class UsersBLO {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");

    public com.hoald.user.Users checkLogin(String userId, String password) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            Query query = entityManager.createQuery("SELECT u FROM Users u WHERE u.id = :userId and u.password = :password and u.status = true")
                    .setParameter("userId", userId)
                    .setParameter("password", password);
            return (com.hoald.user.Users) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public com.hoald.user.Users findUser(String userId) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            return entityManager.find(com.hoald.user.Users.class, userId);
        } catch (Exception e) {
            return null;
        }
    }
}
