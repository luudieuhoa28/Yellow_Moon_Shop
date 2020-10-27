/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cart;

import com.hoald.cake.Cake;
import com.hoald.cart.Cart;
import com.hoald.user.Users;
import com.hoald.cake.CakeBLO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class CartDetailController extends HttpServlet {

    private static final String GET_CART_SUCCESS = "cart_detail.jsp";
    private static final String ERROR_PAGE = "error.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                List<com.hoald.cake.Cake> cakeList = new ArrayList<>();
                Map<Integer, Cake> mapCart = cart.getMapCart();
                if (mapCart != null) {
                    Set<Integer> cakeIdSet = mapCart.keySet();
                    Iterator<Integer> it = cakeIdSet.iterator();
                    while (it.hasNext()) {
                        Integer cakeId = it.next();
                        if (cakeId != null) {
                            com.hoald.cake.Cake cake = mapCart.get(cakeId);
                            cakeList.add(cake);
                        }
                    }
                    request.setAttribute("LIST_CAKE_IN_CART", cakeList);
                }
            } else {
                cart = new Cart();
                session.setAttribute("CART", cart);
            }
            url = GET_CART_SUCCESS;
        } catch (Exception e) {
            System.out.println(e);
            Logger.getLogger("Error at CartDetailController: " + e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
