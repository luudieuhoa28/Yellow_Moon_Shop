/* =================================
 ------------------------------------
 Divisima | eCommerce Template
 Version: 1.0
 ------------------------------------
 ====================================*/


'use strict';


$(window).on('load', function () {
    /*------------------
     Preloder
     --------------------*/
    $(".loader").fadeOut();
    $("#preloder").delay(400).fadeOut("slow");

});

(function ($) {
    function onSearch(event) {
        alert();
//    event.preventDefault();
    }
    function setCate(id) {
        alert(id);
        $("#cateID").value = id;
        console.log($("#cateID").value);
    }
    function onFilter() {
        let minPrice = $("#minValue")[0].value;
        let maxPrice = $("#maxValue")[0].value;
        let page = $("#page").val();
        let cateID = $("#cateID").val();
        let nameCake = $("#searchCake").val();
        window.location.href = "MainFilter?btnAction=SearchCake" +
                "&cateID=" + cateID +
                "&minPrice=" + minPrice +
                "&maxPrice=" + maxPrice +
                "&page=" + page +
                "&searchCake=" + nameCake;
    }
    $("#btnSearch").click(function (event) {
         $("#page").val(1);
        onFilter();
    });
    $("#getRangePrice").click(function (event) {
         $("#page").val(1);
        onFilter();
    });
    $("#btnNext").click(function () {
        
        let nextPage = parseInt($("#page").val()) + 1;
        $("#page").val(nextPage);
        onFilter();
    });
    $("#btnPrevious").click(function () {
        let nextPage = parseInt($("#page").val()) - 1;
        if (nextPage < 1)
            $("#page").val(1);
        else $("#page").val(nextPage);
        onFilter();
    });
    $(".btnCategory").click(function (event) {
        event.preventDefault();
         $("#page").val(1);
        let cateID = event.target.attributes.value.value;
        $("#cateID").val(cateID);
        onFilter();
//            console.log(event.target);
    });
    /*------------------
     Navigation
     --------------------*/
    $('.main-menu').slicknav({
        prependTo: '.main-navbar .container',
        closedSymbol: '<i class="flaticon-right-arrow"></i>',
        openedSymbol: '<i class="flaticon-down-arrow"></i>'
    });


    /*------------------
     ScrollBar
     --------------------*/
    $(".cart-table-warp, .product-thumbs").niceScroll({
        cursorborder: "",
        cursorcolor: "#afafaf",
        boxzoom: false
    });


    /*------------------
     Category menu
     --------------------*/
    $('.category-menu > li').hover(function (e) {
        $(this).addClass('active');
        e.preventDefault();
    });
    $('.category-menu').mouseleave(function (e) {
        $('.category-menu li').removeClass('active');
        e.preventDefault();
    });


    /*------------------
     Background Set
     --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });



    /*------------------
     Hero Slider
     --------------------*/
    var hero_s = $(".hero-slider");
    hero_s.owlCarousel({
        loop: true,
        margin: 0,
        nav: true,
        items: 1,
        dots: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        navText: ['<i class="flaticon-left-arrow-1"></i>', '<i class="flaticon-right-arrow-1"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        onInitialized: function () {
            var a = this.items().length;
            $("#snh-1").html("<span>1</span><span>" + a + "</span>");
        }
    }).on("changed.owl.carousel", function (a) {
        var b = --a.item.index, a = a.item.count;
        $("#snh-1").html("<span> " + (1 > b ? b + a : b > a ? b - a : b) + "</span><span>" + a + "</span>");

    });

    hero_s.append('<div class="slider-nav-warp"><div class="slider-nav"></div></div>');
    $(".hero-slider .owl-nav, .hero-slider .owl-dots").appendTo('.slider-nav');



    /*------------------
     Brands Slider
     --------------------*/
    $('.product-slider').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        margin: 30,
        autoplay: true,
        navText: ['<i class="flaticon-left-arrow-1"></i>', '<i class="flaticon-right-arrow-1"></i>'],
        responsive: {
            0: {
                items: 1,
            },
            480: {
                items: 2,
            },
            768: {
                items: 3,
            },
            1200: {
                items: 4,
            }
        }
    });


    /*------------------
     Popular Services
     --------------------*/
    $('.popular-services-slider').owlCarousel({
        loop: true,
        dots: false,
        margin: 40,
        autoplay: true,
        nav: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        responsive: {
            0: {
                items: 1,
            },
            768: {
                items: 2,
            },
            991: {
                items: 3
            }
        }
    });


    /*------------------
     Accordions
     --------------------*/
    $('.panel-link').on('click', function (e) {
        $('.panel-link').removeClass('active');
        var $this = $(this);
        if (!$this.hasClass('active')) {
            $this.addClass('active');
        }
        e.preventDefault();
    });


    /*-------------------
     Range Slider
     --------------------- */
    var rangeSlider = $(".price-range"),
            minamount = $("#minamount"),
            maxamount = $("#maxamount"),
            minPrice = rangeSlider.data('min'),
            maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));


    /*-------------------
     Quantity change
     --------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });



    /*------------------
     Single Product
     --------------------*/
    $('.product-thumbs-track > .pt').on('click', function () {
        $('.product-thumbs-track .pt').removeClass('active');
        $(this).addClass('active');
        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product-big-img').attr('src');
        if (imgurl != bigImg) {
            $('.product-big-img').attr({src: imgurl});
            $('.zoomImg').attr({src: imgurl});
        }
    });


    $('.product-pic-zoom').zoom();
    // Initialize Sliders
    var sliderSections = document.getElementsByClassName("range-slider");
    for (var x = 0; x < sliderSections.length; x++) {
        var sliders = sliderSections[x].getElementsByTagName("input");
        for (var y = 0; y < sliders.length; y++) {
            if (sliders[y].type === "range") {
                sliders[y].oninput = getVals;
                // Manually trigger event first time to display values
                sliders[y].oninput();
            }
        }
    }
    function getVals() {
        // Get slider values
        var parent = this.parentNode;
        var slides = parent.getElementsByTagName("input");

        var slide1 = parseFloat(slides[0].value);
        var slide2 = parseFloat(slides[1].value);
        // Neither slider will clip the other, so make sure we determine which is larger
        if (slide1 > slide2) {
            var tmp = slide2;
            slide2 = slide1;
            slide1 = tmp;
        }

        var displayElement = parent.getElementsByClassName("rangeValues")[0];
        displayElement.innerHTML = slide1 + " - " + slide2;
    }


})(jQuery);
