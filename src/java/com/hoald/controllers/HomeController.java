/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.controllers;

import com.hoald.cake.Cake;
import com.hoald.categry.Category;
import com.hoald.cake.CakeBLO;
import com.hoald.categry.CategoryBLO;
import com.hoald.utils.Util;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class HomeController extends HttpServlet {

    private static final String HOME_PAGE = "index.jsp";
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
            com.hoald.user.Users user = (com.hoald.user.Users) session.getAttribute("USER");
            int page = 1;
            try {
                String pageStr = request.getParameter("page");
                page = Integer.parseInt(pageStr);
            } catch (Exception e) {
                Logger.getLogger("Error at NewsFeedController: " + e);
            }
            String btnAction = request.getParameter("btnAction");
            String searchCake = request.getParameter("searchCake");
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
            }
            BigDecimal minPrice = new BigDecimal(0);
            BigDecimal maxPrice = new BigDecimal(100000);
            try {
                minPrice = new BigDecimal(request.getParameter("minPrice"));
                maxPrice = new BigDecimal(request.getParameter("maxPrice"));
            } catch (Exception e) {
            }

            Category category = null;
            try {
                int cateID = Integer.parseInt(request.getParameter("cateID"));
                CategoryBLO categoryBLO = new CategoryBLO();
                category = categoryBLO.getCategoryByid(cateID);
            } catch (Exception e) {
            }

            Util.searchCake(btnAction, searchCake, request, user, page, minPrice, maxPrice, category);
            // Util.searchCake(btnAction, searchCake, request, user, page);
            url = HOME_PAGE;
            CategoryBLO categoryBLO = new CategoryBLO();
            List<com.hoald.categry.Category> categoryList = categoryBLO.getListCategory();
            request.setAttribute("CATEGORY_LIST", categoryList);
        } catch (Exception e) {
            System.out.println(e);
            Logger.getLogger(e.toString());
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

    /**/
 /* Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
