/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

import com.hoald.cake.Cake;
import com.hoald.cake.CakeError;
import com.hoald.user.Users;
import com.hoald.cake.CakeBLO;
import com.hoald.categry.CategoryBLO;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class UpdateCakeController extends HttpServlet {

    private static final String UPDATE_CAKE = "cake_detail.jsp";
    private static final String UPDATE_CAKE_ERROR = "error.jsp";

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
        String url = UPDATE_CAKE_ERROR;
        try {
            com.hoald.cake.CakeError cakeError = new CakeError();
            boolean isValid = true;
            int id = 0;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
                isValid = false;
            }
            String imagePath = request.getParameter("imagePath");
            String name = request.getParameter("name");
            if (name.equals("")) {
                cakeError.setNameError("Name cannot be empty!!!");
                isValid = false;
            }
            BigDecimal price = BigDecimal.valueOf(0);
            try {
                price = new BigDecimal(request.getParameter("price"));
            } catch (Exception e) {
                isValid = false;
                cakeError.setPriceError("Invalid input!!!");
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String startDateStr = request.getParameter("createDate");
            Date createDate = sdf.parse(startDateStr);
            Date date = new Date();
            Date exprirationDate = null;
            if (date.compareTo(createDate) < 0) {
                isValid = false;
                cakeError.setCreateDateError("Create cake date must be before today!!!");
            } else {
                String exprirationDateStr = request.getParameter("exprirationDate");
                exprirationDate = sdf.parse(exprirationDateStr);
                if (createDate.compareTo(exprirationDate) > 0) {
                    cakeError.setExpirationError("The expiration date must after create date!!!");
                    isValid = false;
                }
            }
            int quantity = 0;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (Exception e) {
                cakeError.setQuantityError("Invalid input!!!");
                isValid = false;

            }
            com.hoald.categry.CategoryBLO categoryBLO = new CategoryBLO();
            com.hoald.cake.CakeBLO cakeBLO = new CakeBLO();
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("category"));
            com.hoald.categry.Category category = categoryBLO.getCategoryByid(categoryId);
            boolean status = (request.getParameter("status").equalsIgnoreCase("true") ? true : false);
            com.hoald.cake.Cake cake = new Cake(id, name, imagePath, description, price, createDate, exprirationDate, quantity, status, category);
            if (isValid) {
                HttpSession session = request.getSession();
                if (cakeBLO.updateCake(cake, (Users) session.getAttribute("USER"))) {
                    url = UPDATE_CAKE;
                    request.setAttribute("UPDATE_MESSAGE", "Update successfully!!!");
                }
            } else {
                url = UPDATE_CAKE;
            }
            List<com.hoald.categry.Category> categoryList = categoryBLO.getListCategory();
            request.setAttribute("CAKE_ERROR", cakeError);
            request.setAttribute("CAKE", cake);
            request.setAttribute("CATEGORY_LIST", categoryList);
        } catch (Exception e) {
            System.out.println(e);
            Logger.getLogger("Error at UpdateCakeController: " + e);
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
