/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.utils;

import com.hoald.cake.Cake;
import com.hoald.cake.CakeError;
import com.hoald.categry.Category;
import com.hoald.user.Users;
import com.hoald.cake.CakeBLO;
import com.hoald.cake.CreateCakeController;
import com.hoald.categry.CategoryBLO;
import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author dell
 */
public class Util {

    public static String getFileName(String fileName) {
        try {
            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
            String tmpFileName = fileName.substring(0, fileName.lastIndexOf(".") - 1);
            String imgType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            fileName = tmpFileName + new Date().getTime() + imgType;
            return fileName;
        } catch (Exception e) {
            return "";
        }
    }

    public static void searchCake(String btnAction, String searchCake, HttpServletRequest request, Users user, int page, BigDecimal minPrice, BigDecimal maxPrice, Category category) {
        if (searchCake == null) {
            CakeBLO cakeBLO = new CakeBLO();
            List<Cake> cakeList = new ArrayList<>();
            if (user == null || user.getRoleId().getId() == 1) {
                cakeList = cakeBLO.getCakeListUser(page, "", category, minPrice, maxPrice);
            } else {
                cakeList = cakeBLO.getCakeListAdmin(page, "", category, minPrice, maxPrice);
            }

            request.setAttribute("CAKE_LIST", cakeList);
            request.setAttribute("PAGE", 1);
        } else {
            switch (btnAction) {
                case "SearchCake":
                    CakeBLO cakeBLO = new CakeBLO();
                    List<Cake> cakeList = new ArrayList<>();
                    if (user == null || user.getRoleId().getId() == 1) {
                        cakeList = cakeBLO.getCakeListUser(page, searchCake, category, minPrice, maxPrice);

                    } else {
                        cakeList = cakeBLO.getCakeListAdmin(page, searchCake, category, minPrice, maxPrice);

                    }
                    request.setAttribute("CAKE_LIST", cakeList);
                    request.setAttribute("PAGE", 1);
                    break;
                case "Next":
                    cakeBLO = new CakeBLO();
                    if (user == null || user.getRoleId().getId() == 1) {
                        cakeList = cakeBLO.getCakeListUser(page + 1, searchCake, category, minPrice, maxPrice);
                    } else {
                        cakeList = cakeBLO.getCakeListAdmin(page + 1, searchCake, category, minPrice, maxPrice);

                    }
                    if (cakeList.isEmpty()) {
                        if (user == null || user.getRoleId().getId() == 1) {
                            cakeList = cakeBLO.getCakeListUser(page, searchCake, category, minPrice, maxPrice);
                        } else {
                            cakeList = cakeBLO.getCakeListAdmin(page, searchCake, category, minPrice, maxPrice);

                        }
                        request.setAttribute("CAKE_LIST", cakeList);
                        request.setAttribute("PAGE", page);

                    } else {
                        request.setAttribute("CAKE_LIST", cakeList);
                        request.setAttribute("PAGE", page + 1);
                    }
                    break;
                case "Previous":
                    cakeBLO = new CakeBLO();
                    if (page == 1) {
                        //listArticle = ArticleDAO.getListArticle(searchArticle, 1);
                        if (user == null || user.getRoleId().getId() == 1) {
                            cakeList = cakeBLO.getCakeListUser(1, searchCake, category, minPrice, maxPrice);
                        } else {
                            cakeList = cakeBLO.getCakeListAdmin(1, searchCake, category, minPrice, maxPrice);
                        }
                        request.setAttribute("CAKE_LIST", cakeList);
                        request.setAttribute("PAGE", 1);
                    } else {
                        if (user == null || user.getRoleId().getId() == 1) {
                            cakeList = cakeBLO.getCakeListUser(page - 1, searchCake, category, minPrice, maxPrice);
                        } else {
                            cakeList = cakeBLO.getCakeListAdmin(page - 1, searchCake, category, minPrice, maxPrice);

                        }
                        //listArticle = ArticleDAO.getListArticle(searchArticle, page - 1);
                        request.setAttribute("CAKE_LIST", cakeList);
                        request.setAttribute("PAGE", page - 1);
                    }
                    break;
            }

        }
    }

//    public static Cake createCake(FileItem item, String name, boolean isvalid, CakeError cakeError, BigDecimal) {
//        String fieldName = item.getFieldName();
//        String fieldValue = item.getString("utf-8");
//        switch (fieldName) {
//            case "name":
//                name = fieldValue;
//                if (name.equals("")) {
//                    isValid = false;
//                    cakeError.setNameError("Name cannot be empty!!!");
//                }
//                break;
//            case "price":
//                try {
//                    price = new BigDecimal(fieldValue);
//                } catch (Exception e) {
//                    isValid = false;
//                    cakeError.setPriceError("Invalid input!!!");
//                }
//                break;
//            case "createDate":
//                try {
//                    Date date = new Date();
//                    createDate = sdf.parse(fieldValue);
//                    if (date.compareTo(createDate) < 0) {
//                        isValid = false;
//                        cakeError.setCreateDateError("Create cake date must be before today!!!");
//                    }
//                } catch (Exception e) {
//                    cakeError.setCreateDateError("Plaese choose an date!!!");
//                    isValid = false;
//                }
//                break;
//            case "exprirationDate":
//                try {
//                    exprirationDate = sdf.parse(fieldValue);
//                    if (createDate.compareTo(exprirationDate) > 0) {
//                        cakeError.setExpirationError("The expiration date must after create date!!!");
//                        isValid = false;
//                    }
//                } catch (Exception e) {
//                    cakeError.setExpirationError("Plaese choose an date!!!");
//                    isValid = false;
//                }
//                break;
//            case "quantity":
//                try {
//                    quantity = Integer.parseInt(fieldValue);
//                    if (quantity < 0) {
//                        isValid = false;
//                        cakeError.setQuantityError("Quantity must >= 0!!!");
//                    }
//                } catch (Exception e) {
//                    isValid = false;
//                    cakeError.setQuantityError("Invalid input!!!");
//                }
//                break;
//            case "description":
//                description = fieldValue;
//                break;
//            case "category":
//                CategoryBLO categoryBLO = new CategoryBLO();
//                category = categoryBLO.getCategoryByid(Integer.parseInt(fieldValue));
//                break;
//        }
//     }
//    public static String createCake(HttpServletRequest request, com.hoald.cake.CakeError cakeError, CreateCakeController cakeController) {
//        String url = CreateCakeController.ERROR_PAGE;
//        try {
//           
//        } catch (Exception e) {
//        }
//        return url;
//    }
}
