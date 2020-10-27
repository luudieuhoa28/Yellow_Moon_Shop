<%-- 
    Document   : track_order
    Created on : Oct 13, 2020, 3:20:08 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Divisima | eCommerce Template</title>
        <meta charset="UTF-8">
        <meta name="description" content=" Divisima | eCommerce Template">
        <meta name="keywords" content="divisima, eCommerce, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="shortcut icon"/>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


        <!-- Stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>


        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body>

        <!-- Header section -->
        <header class="header-section">
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 text-center text-lg-left">
                            <a href="HomeController"><h4>Hello ${sessionScope.USER.fullName}</h4></a>
                        </div>
                        <div class="col-xl-6 col-lg-5">
                            <form class="header-search-form">
                                <input type="text" placeholder="Search on cake name ...." name="searchCake"
                                       value="${param.searchCake}">
                                <button type="submit" name="btnAction" value="SearchCake"><i class="flaticon-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="user-panel">
                                <div class="up-item">
                                    <i class="flaticon-profile"></i>
                                    <a href="login.jsp">Sign</a> In or <a href="LogoutController?btnAction=Logout">Logout</a>
                                </div>
                                <div class="up-item">
                                    <a href="CartDetailController">| Shopping Cart | </a>
                                </div>
                                <div class="up-item">
                                    <a href="track_order.jsp">Track Order</a>
                                </div>
                            </div>
                        </div>
                        <div>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header section end -->
        <div style="display: flex;align-items: center;flex-direction: column;">
            <h3>TRACK ORDER</h3>
            <div class="col-xl-6 col-lg-5" style="width: 80%">
                <form class="header-search-form">
                    <input type="text" placeholder="Enter orderId ...." name="searchOrder" value="${param.searchOrder}">
                    <button type="submit" name="btnAction" value="SearchOrder"><i class="flaticon-search"></i></button>
                </form>
            </div>
        </div>
        <c:set var="listCake" value="${requestScope.CAKE_ORDER_LIST}"/>

        <c:if test="${listCake != null}">
            <c:if test="${listCake.size() > 0}">
                <section class="cart-section spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="cart-table">
                                    <h3>Your Order</h3>
                                    <div class="cart-table-warp">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product-th">Product</th>
                                                    <th class="quy-th">Quantity</th>
                                                    <th class="total-th">Payment</th>
                                                    <th class="total-th">Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="cake" items="${listCake}">
                                                <form>
                                                    <input type="hidden" name="cakeId" value="${cake.id}"/>
                                                    <tr>
                                                        <td class="product-col">
                                                            <img src="images/${cake.imagePath}" alt="">
                                                            <div class="pc-title">
                                                                <h4>${cake.name}</h4>
                                                                <p>$ ${cake.price}</p>
                                                            </div>
                                                        </td>
                                                        <td class="quy-col">
                                                            <div class="quantity">
                                                                <div class="pro-qty">
                                                                    <p>${cake.quantity}</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="size-col"><h4>Cash</h4></td>
                                                        <td class="total-col"><h4>$ ${cake.price * cake.quantity}</h4></td>
                                                        <c:set var="total" value="${total + cake.price * cake.quantity}"/>

                                                    </tr>

                                                </form>
                                            </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="total-cost">
                                        <h6>Total <span>$ ${total}</span></h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
                <p>Status: Paid</p>
            </c:if>
            <c:if test="${listCake.size() <= 0}">
                </br></br>
                <h5 style="color: red; text-align: center">Cannot find this Order</h5>
            </c:if>
        </c:if>


        <p style="color: red">${requestScope.ORDER_TRACKING_MESSAGE}</p>
        <!--====== Javascripts & Jquery ======-->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
