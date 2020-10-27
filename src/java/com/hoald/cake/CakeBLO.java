/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

import com.hoald.cake.Cake;
import com.hoald.categry.Category;
import com.hoald.updatedetail.UpdateDetail;
import com.hoald.updatedetail.UpdateDetailPK;
import java.math.BigDecimal;

import java.util.*;

import javax.persistence.*;
import java.util.logging.Logger;

/**
 * @author dell
 */
public class CakeBLO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");


    public Cake getCakeById(int cakeId) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            Query query = entityManager.createQuery("SELECT c FROM Cake c WHERE c.id = :cakeId")
                    .setParameter("cakeId", cakeId);
            return (Cake) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public boolean updateCake(Cake cake, com.hoald.user.Users users) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            Cake tmpCake = entityManager.find(Cake.class, cake.getId());
            tmpCake.setName(cake.getName());
            tmpCake.setPrice(cake.getPrice());
            tmpCake.setImagePath(cake.getImagePath());
            tmpCake.setDescription(cake.getDescription());
            tmpCake.setQuantity(cake.getQuantity());
            tmpCake.setCreateDate(cake.getCreateDate());
            tmpCake.setExprirationDate(cake.getExprirationDate());
            tmpCake.setStatus(cake.getStatus());
            tmpCake.setCategoryId(cake.getCategoryId());
            entityManager.getTransaction().begin();
            entityManager.merge(tmpCake);
            com.hoald.updatedetail.UpdateDetailBLO updateDetailBLO = new com.hoald.updatedetail.UpdateDetailBLO();
            com.hoald.updatedetail.UpdateDetail updateDetail = new UpdateDetail(new UpdateDetailPK(users.getId(), cake.getId()), new Date(), tmpCake, users);
            updateDetailBLO.makeUpdateCake(updateDetail);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println("CakeBLO: " + e);
            Logger.getLogger("CakeBLO: " + e);
            return false;
        }
    }

    public Cake updateImageCake(int cakeId, String imagePath, com.hoald.user.Users users) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            Cake cake = entityManager.find(Cake.class, cakeId);
            if (cake != null) {
                cake.setImagePath(imagePath);
                entityManager.getTransaction().begin();
                entityManager.merge(cake);
                com.hoald.updatedetail.UpdateDetailBLO updateDetailBLO = new com.hoald.updatedetail.UpdateDetailBLO();
                com.hoald.updatedetail.UpdateDetail updateDetail = new UpdateDetail(new UpdateDetailPK(users.getId(), cakeId), new Date(), cake, users);
                updateDetailBLO.makeUpdateCake(updateDetail);
                entityManager.getTransaction().commit();
                return cake;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean createCake(Cake cake) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(cake);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Cake> getListCakeInCart(Map<Integer, Integer> mapCart) {
        EntityManager entityManager = emf.createEntityManager();
        List<Cake> cakeList = new ArrayList<>();
        try {
            Set<Integer> cakeIdSet = mapCart.keySet();
            Iterator it = cakeIdSet.iterator();
            while (it.hasNext()) {
                int cakeId = (int) it.next();
                Cake cake = getCakeById(cakeId);
                if (cake != null) {
                    cakeList.add(cake);
                }
            }
        } catch (Exception e) {
        }
        return cakeList;
    }

    public boolean upDateCakeQuantity(int cakeId, int quantity, EntityManager entityManager) {
        //   EntityManager entityManager = emf.createEntityManager();
        try {
            Cake cake = entityManager.find(Cake.class, cakeId);
            if (cake != null) {
                if (quantity > cake.getQuantity()) {
                    return false;
                } else {
                    cake.setQuantity(cake.getQuantity() - quantity);
                    entityManager.merge(cake);
                }
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Cake> getListCakeFromOrderDetailList(List<com.hoald.order.OrderDetail> orderDetailList) {
        EntityManager entityManager = emf.createEntityManager();
        List<Cake> cakeList;
        try {
            cakeList = new ArrayList<>();
            for (com.hoald.order.OrderDetail orderDetail : orderDetailList) {
                Cake cake = (Cake) entityManager.createQuery("SELECT c FROM Cake c WHERE c.id = :cakeId")
                        .setParameter("cakeId", orderDetail.getCake().getId())
                        .getSingleResult();
                if (cake != null) {
                    cake.setQuantity(orderDetail.getQuantity());
                }
                cakeList.add(cake);
            }
            return cakeList;
        } catch (Exception e) {
            return null;
        }
    }

    public List<Cake> getCakeListUser(int page, String keyword, Category category, BigDecimal minPrice, BigDecimal maxPrice) {
        List<Cake> cakeList = new ArrayList<>();
        EntityManager entityManager = emf.createEntityManager();
        try {
            String categorySqlPatch = " ";
            if (category != null) {
                categorySqlPatch = "AND cake.categoryId = :category ";
            }

            String sql = "SELECT cake "
                    + "FROM Cake cake "
                    + "WHERE cake.status = true "
                    + "AND cake.quantity > 0 "
                    + "AND cake.name LIKE :keyword "
                    + "AND cake.price >= :minPrice AND cake.price <= :maxPrice "
                    + categorySqlPatch
                    + "ORDER BY cake.createDate DESC";
            Query query = entityManager.createQuery(sql, Cake.class);
            query.setParameter("keyword", "%" + keyword + "%");
            query.setParameter("minPrice", minPrice);
            query.setParameter("maxPrice", maxPrice);
            if (category != null) {
                query.setParameter("category", category);
            }
            query.setFirstResult((page - 1) * 20);
            query.setMaxResults(20);
            cakeList = query.getResultList();
        } catch (Exception e) {
            return null;
        }
        return cakeList;
    }
    
     public List<Cake> getCakeListAdmin(int page, String keyword, Category category, BigDecimal minPrice, BigDecimal maxPrice) {
        List<Cake> cakeList = new ArrayList<>();
        EntityManager entityManager = emf.createEntityManager();
        try {
            String categorySqlPatch = " ";
            if (category != null) {
                categorySqlPatch = "AND cake.categoryId = :categoryId ";
            }

            String sql = "SELECT cake "
                    + "FROM Cake cake "
                    + "WHERE "
                    + "cake.name LIKE :keyword "
                    + "AND cake.price >= :minPrice AND cake.price <= :maxPrice "
                    + categorySqlPatch
                    + "ORDER BY cake.createDate DESC";
            Query query = entityManager.createQuery(sql, Cake.class);
            query.setParameter("keyword", "%" + keyword + "%");
            query.setParameter("minPrice", minPrice);
            query.setParameter("maxPrice", maxPrice);
            if (category != null) {
                query.setParameter("categoryId", category);
            }
            query.setFirstResult((page - 1) * 20);
            query.setMaxResults(20);
            cakeList = query.getResultList();
        } catch (Exception e) {
            return null;
        }
        return cakeList;
    }

}
