/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.order;

import com.hoald.cake.CakeBLO;
import com.hoald.order.OrderDetailBLO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class TrackOrderController extends HttpServlet {
    private static final String ERROR_PAGE = "error.jsp";
    private static final String TRACK_ORDER = "track_order.jsp";

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
                int orderId = Integer.parseInt(request.getParameter("searchOrder"));
                com.hoald.order.OrderDetailBLO orderDetailBLO = new OrderDetailBLO();
                List<com.hoald.order.OrderDetail> orderDetailList = orderDetailBLO.getListOrderDetailByOrderId(orderId);
                com.hoald.cake.CakeBLO cakeBLO = new CakeBLO();
                List<com.hoald.cake.Cake> cakeList = cakeBLO.getListCakeFromOrderDetailList(orderDetailList);
                request.setAttribute("CAKE_ORDER_LIST", cakeList);
            } catch (Exception e) {
                request.setAttribute("ORDER_TRACKING_MESSAGE", "Please enter number!!!");
            }
            url = TRACK_ORDER;
        } catch (Exception e) {
            Logger.getLogger("Error at TrackOrderController: " + e);
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
