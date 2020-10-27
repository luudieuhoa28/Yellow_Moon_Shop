/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hoald.filter;

import com.hoald.user.Users;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dell
 */
public class MainFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    private static final String GO_TO_HOME = "HomeController";
    private static final String ERROR_PAGE = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String SHOW_CAKE_DETAIL = "ShowCakeDetail";
    private static final String UPDATE_CAKE = "UpdateCakeController";
    private static final String UPLOAD_IMAGE = "UploadImageController";
    private static final String CREATE_CAKE = "CreateCakeController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String DELETE_CART = "DeleteCartController";
    private static final String CHECK_OUT_CART = "CheckOutCartController";
    private static final String TRACK_ORDER = "TrackOrderController";

    private static final String LOGIN_PAGE = "login.jsp";

    private static List<String> adminResource = new ArrayList<>();
    private static List<String> memberResource = new ArrayList<>();
    private static List<String> guestResource = new ArrayList<>();

    public MainFilter() {
        guestResource.add("AddToCartController");
        guestResource.add("CartDetailController");
        guestResource.add("DeleteCartController");
        guestResource.add("HomeController");
        guestResource.add("LoginController");
        guestResource.add("LogoutController");
        guestResource.add("ShowCakeDetail");
        guestResource.add("UpdateCartController");
        guestResource.add("cake_detail.jsp");
        guestResource.add("cart_detail.jsp");
        guestResource.add("confirm_information.jsp");
        guestResource.add("index.jsp");
        guestResource.add("login.jsp");
        guestResource.add("CheckOutCartController");

        memberResource.add("TrackOrderController");
        memberResource.add("track_order.jsp");
        memberResource.add("login.jsp");
        memberResource.add("LoginController");
        memberResource.add("LogoutController");
        memberResource.add("AddToCartController");
        memberResource.add("CartDetailController");
        memberResource.add("DeleteCartController");
        memberResource.add("ShowCakeDetail");
        memberResource.add("confirm_information.jsp");
        memberResource.add("UpdateCartController");
        memberResource.add("CheckOutCartController");
        memberResource.add("HomeController");

        adminResource.add("CreateCakeController");
        adminResource.add("UpdateCakeController");
        adminResource.add("UploadImageController");
        adminResource.add("create_cake.jsp");
        adminResource.add("login.jsp");
        adminResource.add("LoginController");
        adminResource.add("LogoutController");
        adminResource.add("ShowCakeDetail");
        adminResource.add("HomeController");

    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("MainFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("MainFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     * @throws IOException if an input/output error occurs
     * @throws ServletException if a servlet error occurs
     */
    private boolean isFreeResource(String resource) {
        return guestResource.contains(resource) || resource.toLowerCase().matches("(.*?)\\.(js|css|png|jpeg|jpg|otf|"
                + "eot|svg|ttf|woff|woff2|map|js|scss)");
    }

    private boolean havePermission(String url, Users user) {
        if (user != null) {
            if (user.getRoleId().getId() == 1 && memberResource.contains(url)) {
                return true;
            } else if (user.getRoleId().getId() == 2 && adminResource.contains(url)) {
                return true;
            } else {
                return false;
            }
        } else {
            return guestResource.contains(url);
        }

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession session = req.getSession();
            String uri = (req.getRequestURI());
            String action = req.getParameter("btnAction");
            uri = uri.substring(uri.lastIndexOf("/") + 1);
            if (uri.endsWith("index.jsp") || uri.equalsIgnoreCase("")) {
                req.getRequestDispatcher(GO_TO_HOME).forward(request, response);
                // res.sendRedirect(GO_TO_HOME);
            } else if (isFreeResource(uri) && action == null) {
                chain.doFilter(request, response);
                return;
            } else {
                String url = ERROR_PAGE;
                if (action != null) {
                    switch (action) {
                        case "SearchCake":

                            url = GO_TO_HOME;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;

                        case "Login":
                            url = LOGIN;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Next":
                            url = GO_TO_HOME;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Previous":
                            url = GO_TO_HOME;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Logout":
                            url = LOGOUT;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "ShowCakeDetail":
                            url = SHOW_CAKE_DETAIL;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "UPDATE":
                            url = UPDATE_CAKE;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Update image":
                            url = UPLOAD_IMAGE;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "createCake":
                            url = CREATE_CAKE;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "ADD TO CART":
                            url = ADD_TO_CART;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Update cart":
                            url = UPDATE_CART;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Delete":
                            url = DELETE_CART;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "Confirm":
                            url = CHECK_OUT_CART;
                            if (!havePermission(url, (Users) (session.getAttribute("USER"))) && session.getAttribute("USER") != null) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                        case "SearchOrder":
                            url = TRACK_ORDER;
                            if (!havePermission(url, (Users) (session.getAttribute("USER")))) {
                                res.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            break;
                    }
                    req.getRequestDispatcher(url).forward(request, response);
                } else {
                    Users user = (Users) session.getAttribute("USER");
                    if (user != null) {
                        if (user.getRoleId().getId() == 1 && memberResource.contains(uri)) {
                            chain.doFilter(request, response);
                            return;
                        } else if (user.getRoleId().getId() == 2 && adminResource.contains(uri)) {
                            chain.doFilter(request, response);
                            return;
                        }
                    }
                    res.sendRedirect(LOGIN_PAGE);

                }

            }
        } catch (Exception e) {
            Logger.getLogger("Error at MainFilter: " + e);
            System.out.println(e);
        }

    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("MainFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("MainFilter()");
        }
        StringBuffer sb = new StringBuffer("MainFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
