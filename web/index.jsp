<%-- 
    Document   : index
    Created on : Oct 7, 2020, 12:13:21 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:if test="${param.page == null}">
            <c:set var="page" value="${1}"/>
        </c:if>
        <c:if test="${param.page != null}">
            <c:set var="page" value="${param.page}"/>
        </c:if>
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
                            <%--                            <a href="./index.html" class="site-logo">--%>
                            <%--                                <img src="img/logo.png" alt="">--%>
                            <%--                            </a>--%>
                            <a href="HomeController"><h4>Hello ${sessionScope.USER.fullName}</h4></a>
                        </div>
                        <div class="col-xl-6 col-lg-5">
                            <div class="header-search-form">
                                <input type="text" placeholder="Search on cake name ...." id="searchCake" value="${param.searchCake}">
                                <button type="submit" id="btnSearch"  value="SearchCake"><i class="flaticon-search"></i></button>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="user-panel">
                                <div class="up-item">
                                    <i class="flaticon-profile"></i>
                                    <a href="login.jsp">Sign</a> In or <a href="LogoutController?btnAction=Logout">Logout</a>
                                </div>
                                <div class="up-item">
                                    <a href="CartDetailController">|  Shopping Cart  | </a>
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
            <c:set var="user" value="${sessionScope.USER}"/>
            <c:if test="${user != null && user.roleId.id == 2}">
            <nav class="main-navbar">
                <div class="container">
                    <!-- menu -->
                    <ul class="main-menu" style="text-align: center">
                        <li><a href="CreateCakeController">Create Cake</a></li>
                    </ul>
                </div>
            </nav>
            </c:if>
        </header>
        <!-- Header section end -->






        <!-- Product filter section -->
        <section class="product-filter-section">
            <div class="container center-flex">
                <div class="section-title">
                    <h2>BROWSE TOP SELLING PRODUCTS</h2>
                </div>

                <section class="range-slider">
                    <span class="rangeValues"></span>
                    <input id='minValue' value="5" min="0" max="2000" step="50" type="range">
                    <input id='maxValue' value="10" min="0" max="2000" step="50" type="range">
                </section>
                <input id="getRangePrice" type="button" value="Filter"/></br></br>
                <input id="cateID" style="display:none"/>
                <input id="page" value="${page}" style="display:none"/>
                <c:set var="listCategory" value="${requestScope.CATEGORY_LIST}"/>
                <ul class="product-filter-menu">
                    <li><a  value="${0}" id="cateBtn" href="#" class="btnCategory">All</a></li>
                        <c:forEach var="category" items="${listCategory}">
                        <li><a  value="${category.id}" id="cateBtn" href="#" class="btnCategory">${category.name}</a></li>
                        </c:forEach>


                </ul>
                <div class="row">
                    <c:forEach var="cake" items="${requestScope.CAKE_LIST}">
                        <a href="ShowCakeDetail?btnAction=ShowCakeDetail&id=${cake.id}">
                            <div class="col-lg-3 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="images/${cake.imagePath}" alt="">
                                        <div class="pi-links">
                                            <a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
                                        </div>
                                    </div>
                                    <div class="pi-text">
                                        <h6>$${cake.price}</h6>
                                        <p>${cake.name}</p>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </c:forEach>
                    <%--                <div class="text-center pt-5">--%>
                    <%--                    <button class="site-btn sb-line sb-dark">LOAD MORE</button>--%>
                    <%--                </div>--%>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">

                         
                                  <input type="submit" value="Previous" id="btnPrevious" class="page-link"/>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">${page}</a></li>
                            <li class="page-item">
                            <li class="page-item">
                                <%--                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>--%>
                             
                                    <input  type="submit" value="Next" id="btnNext" class="page-link"/>
                            </li>
                        </ul>
                    </nav>
                </div>                                </div>

        </section>
        <!-- Product filter section end -->




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
                            <p>Donec vitae purus nunc. Morbi faucibus erat sit amet congue mattis. Nullam frin-gilla faucibus urna, id dapibus erat iaculis ut. Integer ac sem.</p>
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
                                <p>1481 Creekside Lane  Avila Beach, CA 93424, P.O. BOX 68 </p>
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
                    <p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
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
        <script>
           (function($) {
                   function getQueryParams(qs) {
                            qs = qs.split('+').join(' ');
                            var params = {},
                                    tokens,
                                    re = /[?&]?([^=]+)=([^&]*)/g;

                            while (tokens = re.exec(qs)) {
                                params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
                            }

                            return params;
                        }
                        let {minPrice, maxPrice, page, cateID, searchCake} = getQueryParams(document.location.search);
//                        console.log(getQueryParams(document.location.search));
                        $("#minValue")[0].value = minPrice ? minPrice : 0;
                        $("#maxValue")[0].value = maxPrice ? maxPrice : 15000;
                        $("#page").val(page?page:1);
                        $("#cateID").val(cateID);
                        $("#searchCake").val(searchCake);
                      
  
    var slide1 = parseFloat(  $("#minValue")[0].value );
    var slide2 = parseFloat( $("#maxValue")[0].value );
  // Neither slider will clip the other, so make sure we determine which is larger
  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
  
  var displayElement = document.getElementsByClassName("rangeValues")[0];
      displayElement.innerHTML = slide1 + " - " + slide2;

           })(jQuery);
        </script>
    </body>
</html>
