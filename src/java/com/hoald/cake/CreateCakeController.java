/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

import com.hoald.cake.Cake;
import com.hoald.cake.CakeError;
import com.hoald.categry.Category;
import com.hoald.cake.CakeBLO;
import com.hoald.categry.CategoryBLO;
import com.hoald.utils.Util;

import java.io.File;
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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sun.security.krb5.internal.crypto.KeyUsage;

/**
 * @author dell
 */
public class CreateCakeController extends HttpServlet {

    public static final String CREATE_CAKE_SUCCESS = "HomeController";
    public static final String CREATE_CAKE = "create_cake.jsp";
    public static final String ERROR_PAGE = "error.jsp";

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
            String action = request.getParameter("btnAction");
            com.hoald.cake.CakeError cakeError = new CakeError();
            if (action != null) {
                if (action.equals("createCake")) {
                    String imagePath = "";
                    String name = "";
                    BigDecimal price = BigDecimal.valueOf(0);
                    Date createDate = null;
                    Date exprirationDate = null;
                    int quantity = 0;
                    String description = "";
                    boolean status = true;
                    boolean isValid = true;
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Category category = new Category();
                    List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString("utf-8");
                            switch (fieldName) {
                                case "name":
                                    name = fieldValue;
                                    if (name.equals("")) {
                                        isValid = false;
                                        cakeError.setNameError("Name cannot be empty!!!");
                                    }
                                    break;
                                case "price":
                                    try {
                                        price = new BigDecimal(fieldValue);
                                    } catch (Exception e) {
                                        isValid = false;
                                        cakeError.setPriceError("Invalid input!!!");
                                    }
                                    break;
                                case "createDate":
                                    try {
                                        Date date = new Date();
                                        createDate = sdf.parse(fieldValue);
                                        if (date.compareTo(createDate) < 0) {
                                            isValid = false;
                                            cakeError.setCreateDateError("Create cake date must be before today!!!");
                                        }
                                    } catch (Exception e) {
                                        cakeError.setCreateDateError("Plaese choose an date!!!");
                                        isValid = false;
                                    }
                                    break;
                                case "exprirationDate":
                                    try {
                                        exprirationDate = sdf.parse(fieldValue);
                                        if (createDate.compareTo(exprirationDate) > 0) {
                                            cakeError.setExpirationError("The expiration date must after create date!!!");
                                            isValid = false;
                                        }
                                    } catch (Exception e) {
                                        cakeError.setExpirationError("Plaese choose an date!!!");
                                        isValid = false;
                                    }
                                    break;
                                case "quantity":
                                    try {
                                        quantity = Integer.parseInt(fieldValue);
                                        if (quantity < 0) {
                                            isValid = false;
                                            cakeError.setQuantityError("Quantity must >= 0!!!");
                                        }
                                    } catch (Exception e) {
                                        isValid = false;
                                        cakeError.setQuantityError("Invalid input!!!");
                                    }
                                    break;
                                case "description":
                                    description = fieldValue;
                                    break;
                                case "category":
                                    CategoryBLO categoryBLO = new CategoryBLO();
                                    category = categoryBLO.getCategoryByid(Integer.parseInt(fieldValue));
                                    break;
                            }
                        } else {
                            // Process form file field (input type="file").
                            String fieldName = item.getFieldName();
                            if (fieldName.equals("imagePath")) {
                                String fileName = item.getName();
                                if (!fileName.equals("")) {
                                    fileName = Util.getFileName(fileName);
                                }
                                if (!fileName.equals("") && (fileName.endsWith("png") || fileName.endsWith("bmp") || fileName.endsWith("jpg")
                                        || fileName.endsWith("PNG") || fileName.endsWith("BMP") || fileName.endsWith("JPG"))) {
                                    String realPath = getServletContext().getRealPath("/") + "images\\" + fileName;
                                    File saveFile = new File(realPath);
                                    item.write(saveFile);
                                    imagePath = realPath.substring(realPath.lastIndexOf("\\") + 1);
                                } else if (fileName.equals("")) {
                                    isValid = false;
                                    cakeError.setImagePathError("Please choose an picture!!!");
                                }
                            }
                        }
                    }
                    Cake cake = new Cake(name, imagePath, description, price, createDate, exprirationDate, quantity, status, category);

                    if (isValid) {
                        CakeBLO cakeBLO = new CakeBLO();
                        if (cakeBLO.createCake(cake)) {
                            url = CreateCakeController.CREATE_CAKE_SUCCESS;
                        }
                    } else {
                        com.hoald.categry.CategoryBLO categoryBLO = new CategoryBLO();
                        List<com.hoald.categry.Category> categoryList = categoryBLO.getListCategory();
                        request.setAttribute("CATEGORY_LIST", categoryList);
                        url = CreateCakeController.CREATE_CAKE;
                        request.setAttribute("CAKE_ERROR", cakeError);
                    }
                    request.setAttribute("CAKE", cake);
                }
            } else {
                com.hoald.categry.CategoryBLO categoryBLO = new CategoryBLO();
                List<com.hoald.categry.Category> categoryList = categoryBLO.getListCategory();
                request.setAttribute("CATEGORY_LIST", categoryList);
                url = CREATE_CAKE;
            }
        } catch (Exception e) {
            System.out.println("hihi" + e);
            Logger.getLogger("Error at CreateCakeController: " + e);
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
