/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.cake;

import com.hoald.cake.Cake;
import com.hoald.user.Users;
import com.hoald.cake.CakeBLO;
import com.hoald.categry.CategoryBLO;
import com.hoald.utils.Util;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author dell
 */
public class UploadImageController extends HttpServlet {

    private static final String UPLOAD_IMAGE_SUCCESS = "ShowCakeDetail";
    private static final String UPLOAD_IMAGE_FAIL = "error.jsp";

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
        String url = UPLOAD_IMAGE_FAIL;
        try {
            int cakeId = Integer.parseInt(request.getParameter("id"));
            String imagePath = "";
            boolean isValid = true;
            try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("utf-8");
                        if (fieldName.equalsIgnoreCase("id")) {
                            cakeId = Integer.parseInt(fieldValue);
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
                            } else if (!fileName.equals("")) {
                                isValid = false;
                            }
                        }

                    }
                }
                CakeBLO cakeBLO = new CakeBLO();
                if (isValid) {
                    HttpSession session = request.getSession();
                    Cake cake = cakeBLO.updateImageCake(cakeId, imagePath, (Users) session.getAttribute("USER"));
                    if (cake != null) {

                    }

                } else {
                    request.setAttribute("CAKE", cakeBLO.getCakeById(cakeId));
                }

            } catch (FileUploadException e) {
                Logger.getLogger("Cannot parse multipart request." + e);
            }
            url = UPLOAD_IMAGE_SUCCESS;
        } catch (Exception e) {
            Logger.getLogger("Error at PostArticleController: " + e);
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
