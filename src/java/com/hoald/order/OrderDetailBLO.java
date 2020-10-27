/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.order;

import com.hoald.order.OrderDetail;
import com.hoald.order.OrderDetailPK;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author dell
 */
public class OrderDetailBLO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");

    public boolean insertOrderDetail(com.hoald.order.Orders order, com.hoald.cart.Cart cart, EntityManager entityManager) {
        //   EntityManager entityManager = emf.createEntityManager();
        try {
            Map<Integer, com.hoald.cake.Cake> cakeMap = cart.getMapCart();
            Set<Integer> cakeIdSet = cakeMap.keySet();
            Iterator<Integer> it = cakeIdSet.iterator();
            while (it.hasNext()) {
                Integer cakeId = it.next();
                com.hoald.cake.Cake cake = cakeMap.get(cakeId);
                com.hoald.cake.CakeBLO cakeBLO = new com.hoald.cake.CakeBLO();
                if (cake.getQuantity() > cakeBLO.getCakeById(cakeId).getQuantity()) {
                    return false;
                }

                com.hoald.order.OrderDetail orderDetail = new OrderDetail(new OrderDetailPK(order.getId(), cakeId), cake.getQuantity(), cake, order);
                //        entityManager.getTransaction().begin();
                entityManager.persist(orderDetail);
                entityManager.flush();
                if (!cakeBLO.upDateCakeQuantity(cakeId, cake.getQuantity(), entityManager)) {
                    return false;
                }
                // entityManager.getTransaction().commit();
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public List<OrderDetail> getListOrderDetailByOrderId(int orderId) {
        EntityManager entityManager = emf.createEntityManager();
        List<OrderDetail> orderDetailList;
        try {
            orderDetailList = entityManager.createQuery("SELECT od FROM OrderDetail od where od.orders.id = :orderId")
                    .setParameter("orderId", orderId).getResultList();
            return orderDetailList;
        } catch (Exception e) {
            return null;
        }
    }
}
