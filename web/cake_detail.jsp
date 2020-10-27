<%-- 
    Document   : cake_detail
    Created on : Oct 8, 2020, 1:57:53 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/flaticon.css"/>
    <link rel="stylesheet" href="css/slicknav.min.css"/>
    <link rel="stylesheet" href="css/jquery-ui.min.css"/>
    <link rel="stylesheet" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/animate.css"/>
    <link rel="stylesheet" href="css/style.css"/>


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header section -->
<header class="header-section">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 text-center text-lg-left">
                    <!-- logo -->
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
            </div>
        </div>
    </div>
</header>
<!-- Header section end -->


<c:set var="cake" value="${requestScope.CAKE}"/>
<!-- product section -->
<p>${requestScope.UPDATE_MESSAGE}</p>
<section class="product-section">
    <div class="container">

        <div class="row">

            <div class="col-lg-6">
                <c:if test="${sessionScope.USER.roleId.id == 2}">
                    <form action="UploadImageController?id=${cake.id}" method="POST" enctype="multipart/form-data">
                        <input type="file" name="imagePath" value="${cake.imagePath}"/>
                        <input type="submit" name="btnAction" value="Update image"/>
                    </form>
                </c:if>
                <div class="product-pic-zoom">
                    <img class="product-big-img" src="images/${cake.imagePath}" alt="">
                </div>

            </div>
            <jsp:useBean id="now" class="java.util.Date"/>
            <form>
                <input type="hidden" value="${cake.imagePath}" name="imagePath"/>
                <input type="hidden" value="${cake.id}" name="id"/>
                <div class="col-lg-6 product-details">


                    <c:if test="${sessionScope.USER == null || sessionScope.USER.roleId.id == 1}">
                        Name: <p class="p-title">${cake.name}</p>
                        <p>${requestScope.CAKE_ERROR.nameError}</p>
                        Price: <p class="p-price">$ ${cake.price}</p>
                        <p>${requestScope.CAKE_ERROR.priceError}</p>
                        <div class="quantity">

                            <p>Quantity</p>
                            <div class="pro-qty"><input type="text" value="1" name="quantity"></div>

                        </div>
                        <p>${requestScope.CAKE_ERROR.quantityError}</p>
                        <p class="p-title"> Category: ${cake.categoryId.name}</p>
                        MGF: <input type="date" name="trip-start"
                                    value="${cake.getDateFormat(cake.createDate)}"
                                    max="${cake.getDateFormat(now)}" disabled>

                        EXP: <input type="date" name="trip-start"
                                    value="${cake.getDateFormat(cake.exprirationDate)}"
                                    min="${cake.getDateFormat(cake.createDate)}" disabled>
                        </br></br>
                        <input type="submit" name="btnAction" value="ADD TO CART" class="site-btn"/>
                        <p>${requestScope.CART_MESSAGE}</p>
                    </c:if>


                    <c:if test="${sessionScope.USER.roleId.id == 2}">
                        <input value="${cake.name}" type="text" name="name" class="p-title"/>
                        <p>${requestScope.CAKE_ERROR.nameError}</p>
                        <input class="p-price" value="${cake.price}" name="price" type="text"/>
                        <p>${requestScope.CAKE_ERROR.priceError}</p>
                        <div class="quantity">

                            <p>Available</p>
                            <div class="pro-qty"><input name="quantity" type="text" value="${cake.quantity}"/></div>
                        </div>
                        <p>${requestScope.CAKE_ERROR.quantityError}</p>
                        <select name="category" id="cars">
                            <c:forEach var="category" items="${requestScope.CATEGORY_LIST}">
                                <c:if test="${category.id == cake.categoryId.id}">
                                    <option value="${category.id}" selected>${category.name}</option>
                                </c:if>
                                <c:if test="${category.id != cake.categoryId.id}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <select name="status" id="cars">
                            <option value="true">available</option>
                            <option value="false">unavailable</option>
                        </select>
                        <br/>
                        MGF: <input type="date" name="createDate"
                                    value="${cake.getDateFormat(cake.createDate)}"
                                    max="${cake.getDateFormat(now)}">
                        <p>${requestScope.CAKE_ERROR.createDateError}</p>
                        <br/> <br/>
                        EXP: <input type="date" name="exprirationDate"
                                    value="${cake.getDateFormat(cake.exprirationDate)}"
                                    min="${cake.getDateFormat(cake.createDate)}">
                        <p>${requestScope.CAKE_ERROR.expirationError}</p>
                        </br></br>
                        <input type="submit" name="btnAction" value="UPDATE" class="site-btn"/>
                    </c:if>


                    <div id="accordion" class="accordion-area">
                        <div class="panel">
                            <div class="panel-header" id="headingOne">
                                <button class="panel-link active" data-toggle="collapse" data-target="#collapse1"
                                        aria-expanded="true" aria-controls="collapse1">information
                                </button>
                            </div>
                            <div id="collapse1" class="collapse show" aria-labelledby="headingOne"
                                 data-parent="#accordion">
                                <div class="panel-body">
                                    <c:if test="${sessionScope.USER == null || sessionScope.USER.roleId.id == 1}">
                                        <p>${cake.description}</p>
                                    </c:if>
                                    <c:if test="${sessionScope.USER.roleId.id == 2}">
                                        <input name="description" value="${cake.description}" type="text">
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-header" id="headingTwo">
                                <button class="panel-link" data-toggle="collapse" data-target="#collapse2"
                                        aria-expanded="false" aria-controls="collapse2">care details
                                </button>
                            </div>
                            <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="panel-body">
                                    <img src="./img/cards.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so
                                        dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te
                                        mpus.
                                        Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-header" id="headingThree">
                                <button class="panel-link" data-toggle="collapse" data-target="#collapse3"
                                        aria-expanded="false" aria-controls="collapse3">shipping & Returns
                                </button>
                            </div>
                            <div id="collapse3" class="collapse" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="panel-body">
                                    <h4>7 Days Returns</h4>
                                    <p>Cash on Delivery Available<br>Home Delivery <span>3 - 4 days</span></p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so
                                        dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te
                                        mpus.
                                        Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</section>
<!-- product section end -->


<!-- Footer section -->
<section class="footer-section">
    <div class="container">
        <div class="footer-logo text-center">
            <a href="index.html"><img src="./img/logo-light.png" alt=""></a>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>About</h2>
                    <p>Donec vitae purus nunc. Morbi faucibus erat sit amet congue mattis. Nullam frin-gilla faucibus
                        urna, id dapibus erat iaculis ut. Integer ac sem.</p>
                    <img src="img/cards.png" alt="">
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <ul>
                        <li><a href="">About Us</a></li>
                        <li><a href="">Track Orders</a></li>
                        <li><a href="">Returns</a></li>
                        <li><a href="">Jobs</a></li>
                        <li><a href="">Shipping</a></li>
                        <li><a href="">Blog</a></li>
                    </ul>
                    <ul>
                        <li><a href="">Partners</a></li>
                        <li><a href="">Bloggers</a></li>
                        <li><a href="">Support</a></li>
                        <li><a href="">Terms of Use</a></li>
                        <li><a href="">Press</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <div class="fw-latest-post-widget">
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/1.jpg"></div>
                            <div class="lp-content">
                                <h6>what shoes to wear</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/2.jpg"></div>
                            <div class="lp-content">
                                <h6>trends this year</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget contact-widget">
                    <h2>Questions</h2>
                    <div class="con-info">
                        <span>C.</span>
                        <p>Your Company Ltd </p>
                    </div>
                    <div class="con-info">
                        <span>B.</span>
                        <p>1481 Creekside Lane Avila Beach, CA 93424, P.O. BOX 68 </p>
                    </div>
                    <div class="con-info">
                        <span>T.</span>
                        <p>+53 345 7953 32453</p>
                    </div>
                    <div class="con-info">
                        <span>E.</span>
                        <p>office@youremail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="social-links-warp">
        <div class="container">
            <div class="social-links">
                <a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
                <a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
                <a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
                <a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
                <a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
                <a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
                <a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
            </div>

            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a></p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

        </div>
    </div>
</section>
<!-- Footer section end -->


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
