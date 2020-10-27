/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cart;

import com.hoald.cake.CakeBLO;

import java.util.HashMap;
import java.util.Map;

/**
 * @author dell
 */
public class Cart {

    private String userId;
    Map<Integer, com.hoald.cake.Cake> mapCart;

    public Cart(String userId, Map<Integer, com.hoald.cake.Cake> mapCart) {
        this.userId = userId;
        this.mapCart = mapCart;
    }

    public Cart() {
    }

    public Cart(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Map<Integer, com.hoald.cake.Cake> getMapCart() {
        return mapCart;
    }

    public void setMapCart(Map<Integer, com.hoald.cake.Cake> mapCart) {
        this.mapCart = mapCart;
    }

    public boolean addToCard(Integer cakeId, int numInCart) {
        if (this.mapCart == null) {
            this.mapCart = new HashMap<Integer, com.hoald.cake.Cake>();
        }
        com.hoald.cake.CakeBLO cakeBLO = new CakeBLO();
        com.hoald.cake.Cake cake = cakeBLO.getCakeById(cakeId);
        if (numInCart > cake.getQuantity()) {
            return false;
        }
        if (this.mapCart.containsKey(cakeId)) {
            int quantity = this.mapCart.get(cakeId).getQuantity();
            if (quantity + numInCart > cakeBLO.getCakeById(cakeId).getQuantity()) {
                return false;
            } else {
                numInCart += quantity;
            }
        }
        cake.setQuantity(numInCart);
        mapCart.put(cakeId, cake);
        return true;
    }

    public void delete(Integer cakeId) {
        if (this.mapCart != null) {
            this.mapCart.remove(cakeId);
        }
    }

    public boolean updateQuantity(Integer cakeId, Integer quantity) {
        com.hoald.cake.CakeBLO cakeBLO = new CakeBLO();
        if (quantity > cakeBLO.getCakeById(cakeId).getQuantity()) {
            return false;
        }
        com.hoald.cake.Cake cake = cakeBLO.getCakeById(cakeId);
        cake.setQuantity(quantity);
        if (this.mapCart != null) {
            if (this.mapCart.containsKey(cakeId)) {
                this.mapCart.put(cakeId, cake);
            }
        }
        return true;
    }
}
