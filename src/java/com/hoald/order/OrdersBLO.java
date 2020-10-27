/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.order;

import com.hoald.order.OrderDetail;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.criteria.Order;

/**
 *
 * @author dell
 */
public class OrdersBLO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");

    public boolean checkOutCart(com.hoald.order.Orders order, com.hoald.cart.Cart cart) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            com.hoald.user.UsersBLO usersBLO = new com.hoald.user.UsersBLO();
            com.hoald.user.Users tmpUsers = usersBLO.findUser(order.getUserId().getId());
            if (tmpUsers == null) {
                entityManager.persist(order.getUserId());
            }
            entityManager.persist(order);
            entityManager.flush();
            com.hoald.order.OrderDetailBLO orderDetailBLO = new com.hoald.order.OrderDetailBLO();
            if (!orderDetailBLO.insertOrderDetail(order, cart, entityManager)) {
                entityManager.getTransaction().rollback();
                return false;
            }
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            Logger.getLogger("Error at OrdersBLO: " + e);
            return false;
        }
    }
}
