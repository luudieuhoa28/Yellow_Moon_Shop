/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.order;

import com.hoald.order.Orders;
import com.hoald.role.Role;
import com.hoald.user.Users;
import com.hoald.order.OrdersBLO;
import com.hoald.role.RoleBLO;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class CheckOutCartController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp";
    private static final String CHECK_OUT_CART = "CartDetailController";

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
            String customerName = request.getParameter("customerName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Date date = new Date();
            HttpSession session = request.getSession();
            com.hoald.user.Users user = (Users) session.getAttribute("USER");
            com.hoald.order.Orders order;
            if (user != null) {
                order = new Orders(date, "cash", phone, address, customerName, user);
            } else {
                com.hoald.role.RoleBLO roleBLO = new RoleBLO();
                Users guestUser = new Users("", phone + new Date().getTime(), customerName, true, phone, address, roleBLO.getRoleById(3));
                order = new Orders(date, "cash", phone, address, customerName, guestUser);
            }
            com.hoald.cart.Cart cart = (com.hoald.cart.Cart) session.getAttribute("CART");
            com.hoald.order.OrdersBLO ordersBLO = new OrdersBLO();
            if (ordersBLO.checkOutCart(order, cart)) {
                session.setAttribute("CART", null);
                request.setAttribute("CHECK_OUT_MESSAGE", "Check out successfully, your order code is: " + order.getId());
            } else {
                request.setAttribute("CHECK_OUT_MESSAGE", "Check out fail :((((");
            }
            url = CHECK_OUT_CART;
        } catch (Exception e) {
            Logger.getLogger("Error at CheckOutCartController: " + e);
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
