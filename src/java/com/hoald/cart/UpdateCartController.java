/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class UpdateCartController extends HttpServlet {
    private static final String ERROR_PAGE = "error.jsp";
    private static final String UPDATE_CART = "CartDetailController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        try {
            try {
                int cakeId = Integer.parseInt(request.getParameter("cakeId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (cakeId > 0 && quantity > 0) {
                    HttpSession session = request.getSession();
                    if (session != null) {
                        com.hoald.cart.Cart cart = (com.hoald.cart.Cart) session.getAttribute("CART");
                        if (cart.updateQuantity(cakeId, quantity)) {
                            request.setAttribute("CART_MESSAGE", "Update successfully!!!");
                            session.setAttribute("CART", cart);
                        } else {
                            request.setAttribute("CART_MESSAGE", "Your new input is not valid!!!");
                        }
                    }
                } else {
                    request.setAttribute("CART_MESSAGE", "Please input an positive number");
                }
            } catch (Exception e) {
                request.setAttribute("CART_MESSAGE", "Invalid input");
            }
            url = UPDATE_CART;
        } catch (Exception e) {
            Logger.getLogger("Error at UpdateCartController: " + e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
