/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.role;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author dell
 */
public class RoleBLO {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");
    public com.hoald.role.Role getRoleById(int roleId) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            return entityManager.find(com.hoald.role.Role.class, 3);
        } catch (Exception e) {
            return  null;
        }
    }
}
