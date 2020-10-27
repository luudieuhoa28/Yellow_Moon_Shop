/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cart;

import com.hoald.cart.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class AddToCartController extends HttpServlet {

    private static final String ADD_TO_CART = "ShowCakeDetail";
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
            try {
                int cakeId = Integer.parseInt(request.getParameter("id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                HttpSession session = request.getSession();
                com.hoald.cart.Cart cart = (com.hoald.cart.Cart) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.addToCard(cakeId, quantity)) {
                        request.setAttribute("CART_MESSAGE", "Add to cart successfully!!!");
                    } else {
                        request.setAttribute("CART_MESSAGE", "The number this cake is not enough!!!");

                    }
                } else {
                    String userId = "";
                    try {
                        userId = ((com.hoald.user.Users) session.getAttribute("USER")).getId();
                    } catch (Exception e) {

                    }
                    cart = new Cart(userId);
                    if (cart.addToCard(cakeId, quantity)) {
                        request.setAttribute("CART_MESSAGE", "Add to cart successfully!!!");
                    } else {
                        request.setAttribute("CART_MESSAGE", "The number this cake is not enough!!!");

                    }
                    session.setAttribute("CART", cart);
                }
                url = ADD_TO_CART;
                com.hoald.categry.CategoryBLO categoryBLO = new com.hoald.categry.CategoryBLO();
                List<com.hoald.categry.Category> categoryList = categoryBLO.getListCategory();
                request.setAttribute("CATEGORY_LIST", categoryList);
            } catch (Exception e) {
            }
        } catch (Exception e) {

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
