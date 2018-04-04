;(function ($) {
    "use strict";

    function debounce(func, wait, immediate) {
        var timeout;
        return function() {
            var context = this, args = arguments;
            var later = function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    };

    /*=============================================
     Variable init
     ==============================================*/
    var $window, $document, $body, windowWidth;

    $window = $(window);
    $document = $(document);
    $body = $(document.body);
    windowWidth = $window.width();

    /*=============================================
     Preloader init
     ==============================================*/
    if (MassiveJS.hasPreloader) {
        $window.on("load", function () {
            $body.imagesLoaded(function () {
                $(".tb-preloader-wave").fadeOut();
                $("#tb-preloader").delay(200).fadeOut("slow").remove();
            });
        });
    }

    /*=============================================
     Social share
     ==============================================*/
    jsSocials.shares.digg = {
        label: "Digg",
        logo: "fa fa-digg",
        shareUrl: "http://digg.com/submit?url={url}&title={text}",
        countUrl: "",
        getCount: function(data) {
            return data.count;
        }
    };
    jsSocials.shares.tumblr = {
        label: "Tumblr",
        logo: "fa fa-tumblr",
        shareUrl: "http://www.tumblr.com/share/link?url={url}&name={text}&description={text}",
        countUrl: "",
        getCount: function(data) {
            return data.count;
        }
    };
    jsSocials.shares.reddit = {
        label: "Reddit",
        logo: "fa fa-reddit",
        shareUrl: "http://reddit.com/submit?url={url}&title={text}",
        countUrl: "",
        getCount: function(data) {
            return data.count;
        }
    };
    jsSocials.shares.stumbleupon = {
        label: "Stumble Upon",
        logo: "fa fa-stumbleupon",
        shareUrl: "http://www.stumbleupon.com/submit?url={url}&title={text}",
        countUrl: "",
        getCount: function(data) {
            return data.count;
        }
    };
    jsSocials.shares.wordpress = {
        label: "WordPress",
        logo: "fa fa-wordpress",
        shareUrl: "http://wordpress.com/press-this.php?u={url}&t={text}",
        countUrl: "",
        getCount: function(data) {
            return data.count;
        }
    };

    /*=============================================
     Wow animation
     ==============================================*/
    if (typeof WOW == "function")
        new WOW().init();

    /*=============================================
     Section parallax
     ==============================================*/
    function setParallaxImg() {
        $("[data-massive-parallax-image]").each(function() {
            var _parallaxRow = $(this);
            _parallaxRow.css({
                backgroundImage: 'url("'+_parallaxRow.data("massive-parallax-image")+'")',
            });
        });
    }

    $document.ready(function () {

        /*=============================================
         Section parallax init
         ==============================================*/
        setParallaxImg();

        /*=============================================
         Social share init
         ==============================================*/
        $("#share").jsSocials({
            shares: MassiveJS.activeSocialShares,
            showLabel: false,
            showCount: false
        });

        /*=============================================
         FitVids init
         ==============================================*/
        $(".post").fitVids({
            customSelector: 'iframe[src^="http://w.soundcloud.com"], iframe[src^="https://w.soundcloud.com"]'
        });

        /*=============================================
         Retina image init
         ==============================================*/
        if (window.devicePixelRatio > 1) {
            $("[data-retina]").imagesLoaded(function () {
                $("[data-retina]").each(function () {
                    var _img = $(this),
                        retinaSrc = _img.data("retina"),
                        height = _img.height();

                    if ( retinaSrc ) {
                        _img
                        .attr("src", retinaSrc)
                        .css({
                            height: height+"px",
                            width: "auto"
                        });
                    }
                });
            });
        }

        /*=============================================
         Smooth scroll init
         ==============================================*/
        if (typeof smoothScroll == "object") {
            smoothScroll.init();
        }

        /*=============================================
         MenuZord init
         ==============================================*/
        $("#massive-menu").menuzord({
            indicatorFirstLevel: '<i class="fa fa-angle-down"></i>',
            indicatorSecondLevel: '<i class="fa fa-angle-right"></i>'
        });

        /*=============================================
         OnePage navigation init
         ==============================================*/
        $(".tb-onepage li").on("click", function () {
            if ($(".showhide").is(":visible")) {
                $(".showhide").trigger("click");
            }
        });

        if ($.fn.onePageNav) {
            $(".tb-onepage").onePageNav({
                currentClass: "active",
                changeHash: true
            });
        }

        /*=============================================
         Sticky navbar init
         ==============================================*/
        function initSticky(windowWidth) {
            var $stickyWrapper, $sticky;

            $stickyWrapper = $("#sticky-wrapper");
            $sticky = $(".bucket-navbar-sticky");

            if (windowWidth > 768 && !$stickyWrapper.length) {
                $sticky.sticky({
                    topSpacing: 0,
                    className: "bucket-navbar-sticky-mode",
                    wrapperClassName: "bucket-navbar-sticky-wrapper",
                    responsiveWidth: true,
                    zIndex: 10000
                });
            }

            if ($stickyWrapper.length) {
                if (windowWidth <= 768) {
                    $stickyWrapper.height("auto");
                } else {
                    $stickyWrapper.height($sticky.height()+"px");
                }
            }
        }

        initSticky(windowWidth);

        $window.on("resize", debounce(function() {
            initSticky( $window.width());
        }, 100));

        /*=============================================
         Flex slider init
         ==============================================*/
        $window.load(function () {
            $(".post-slider-thumb").flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });

            $(".post-slider").flexslider({
                animation: "slide"
            });

            $(".portfolio-slider").flexslider({
                animation: "slide",
                direction: "vertical",
                slideshowSpeed: 3000,
                start: function () {
                    imagesLoaded($(".portfolio"), function () {
                        setTimeout(function () {
                            $(".portfolio-filter li:eq(0) a").trigger("click");
                        }, 1500);
                    });
                }
            });

            $(".portfolio-slider-alt").flexslider({
                animation: "slide",
                direction: "horizontal",
                slideshowSpeed: 4000,
                start: function () {
                    imagesLoaded($(".portfolio"), function () {
                        setTimeout(function () {
                            $(".portfolio-filter li:eq(0) a").trigger("click");
                        }, 1500);
                    });
                }
            });
        });


        $(".massive-slider").each(function() {
            var slider = $(this);
            slider.flexslider({
                animation: slider.data("animation"),
                animationSpeed: slider.data("speed"),
                controlNav: slider.data("pagination"),
                direction: slider.data("direction"),
                slideshowSpeed: slider.data("slide-speed"),
                smoothHeight: true,
            });
        });

        $(".news-slider").flexslider({
            animation: "slide",
            slideshowSpeed: 3000
        });

        $(".blog-post-slider").flexslider({
            animation: "slide"
        });


        /*=============================================
         Full screen banner
         ==============================================*/
        $window.bind("resizeEnd", function () {
            $("#fullscreen-banner").height($window.height());
        });

        $window.resize(function () {
            if (this.resizeTO) clearTimeout(this.resizeTO);
            this.resizeTO = setTimeout(function () {
                $(this).trigger("resizeEnd");
            }, 300);
        }).trigger("resize");


        /*=============================================
         Portfolio grid init
         ==============================================*/
        var $portfolioGeneral = $(".portfolio:not(.portfolio-masonry)").isotope({
            itemSelector: ".portfolio-item",
            layoutMode: "fitRows",
            filter: "*"
        });

        var $portfolioMasonry = $(".portfolio-masonry").isotope({
            itemSelector: ".portfolio-item",
            resizesContainer: false,
            layoutMode: "masonry",
            filter: "*"
        });

        if (typeof imagesLoaded == "function") {
            $portfolioMasonry.imagesLoaded().progress(function() {
                $portfolioMasonry.isotope("layout");
            });

            $portfolioGeneral.imagesLoaded().progress(function() {
                $portfolioGeneral.isotope("layout");
            });
        }

        /*=============================================
         Portfolio filtering
         ==============================================*/
        $(".portfolio-filter").on("click", "a", function (event) {
            event.preventDefault();
            var $this = $(this);
            $this.parent().addClass("active").siblings().removeClass("active");
            $(this).parents(".text-center").next().isotope({filter: $this.data("filter")});
        });


        /*=============================================
         Portfolio gallery
         ==============================================*/
        $(".portfolio-slider, .portfolio-slider-alt").each(function () { // the containers for all your galleries
            var _items = $(this).find("li > a");
            var items = [];
            for (var i = 0; i < _items.length; i++) {
                items.push({src: $(_items[i]).attr("href"), title: $(_items[i]).attr("title")});
            }
            $(this).parent().find(".action-btn").magnificPopup({
                items: items,
                type: "image",
                gallery: {
                    enabled: true
                }
            });
            $(this).parent().find(".portfolio-description").magnificPopup({
                items: items,
                type: "image",
                gallery: {
                    enabled: true
                }
            });
        });

        $(".portfolio-gallery").each(function () { // the containers for all your galleries
            $(this).find(".popup-gallery").magnificPopup({
                type: "image",
                gallery: {
                    enabled: true
                }
            });
            $(this).find(".popup-gallery2").magnificPopup({
                type: "image",
                gallery: {
                    enabled: true
                }
            });
        });


        /*=============================================
         Progressbar init
         ==============================================*/
        var progressBar = $(".progress-bar");
        progressBar.each(function (indx) {
            $(this).data("animated", 0);
            if ($.fn.visible) {
                animateProgressbar(this);
            }
        });

        $window.on("scroll", function () {
            if ($.fn.visible) {
                progressBar.each(function () {
                    animateProgressbar(this);
                })
            }
        });

        function animateProgressbar(pb) {
            if ($(pb).data("animated") == 0) {
                if ($(pb).visible()) {
                    $(pb).css("width", $(pb).attr("aria-valuenow") + "%");
                    $(pb).data("animated", 1);
                }
            }
        }

        /*=============================================
         Popup init
         ==============================================*/
        $(".popup-link, .Massive-gallery-img").magnificPopup({
            type: "image"
        });

        $(".popup-youtube, .popup-vimeo, .popup-gmaps").magnificPopup({
            disableOn: 700,
            type: "iframe",
            mainClass: "mfp-fade",
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        });

        /*=============================================
         Accordion init
         ==============================================*/
        var allPanels = $(".accordion > dd").hide();
        allPanels.first().slideDown("easeOutExpo");
        $(".accordion").each(function () {
            $(this).find("dt > a").first().addClass("active").parent().next().css({display: "block"});
        });

        $(".accordion > dt > a").click(function () {

            var current = $(this).parent().next("dd");
            $(this).parents(".accordion").find("dt > a").removeClass("active");
            $(this).addClass("active");
            $(this).parents(".accordion").find("dd").slideUp("easeInExpo");
            $(this).parent().next().slideDown("easeOutExpo");

            return false;

        });

        /*=============================================
         Toggle accordion init
         ==============================================*/
        var allToggles = $(".toggle > dd").hide();

        $(".toggle > dt > a").click(function () {

            if ($(this).hasClass("active")) {

                $(this).parent().next().slideUp("easeOutExpo");
                $(this).removeClass("active");

            }
            else {
                var current = $(this).parent().next("dd");
                $(this).addClass("active");
                $(this).parent().next().slideDown("easeOutExpo");
            }

            return false;
        });


        /*=============================================
         Career box button setup
         ==============================================*/
        $(".career-box").on("click", ".show-detail", function(e) {
            e.preventDefault();
            $(this).next()
            .slideToggle()
            .end()
            .delay(400)
            .css("visibility", "hidden");
        });

        $(".career-box").on("click", ".cancel-btn", function(e) {
            e.preventDefault();
            var parent = $(this).parents(".career-details-info");
            parent.slideToggle()
            .prev()
            .delay(400)
            .css("visibility", "visible");
        });

        /*=============================================
         Countdown init
         ==============================================*/
        var clocks = $(".clock");
        clocks.each(function() {
            var clock, endtime;
            clock   = $(this);
            endtime = clock.data("endtime");
            clock.countdown(endtime, function(event) {
                clock.html(event.strftime(""
                + '<span class="c-grid c-weeks"> <span class="c-value">%w</span> <span class="c-title">weeks</span> </span>'
                + '<span class="c-grid"> <span class="c-value">%D</span> <span class="c-title">days</span> </span>'
                + '<span class="c-grid"> <span class="c-value">%H</span> <span class="c-title">hours</span> </span>'
                + '<span class="c-grid"> <span class="c-value">%M</span> <span class="c-title">minutes</span> </span>'
                + '<span class="c-grid"> <span class="c-value">%S</span> <span class="c-title">seconds</span> </span>'));
             });

        });

        /*=============================================
         Count to init
         ==============================================*/
        var timers = $(".timer");
        if ($.fn.countTo) {
            timers.each(function () {
                $(this).data("animated", 0);
                animateTimer(this);
            });
        }

        $window.on("scroll", function () {
            timers.each(function () {
                animateTimer(this);
            });
        });

        function animateTimer(timer) {
            if ($(timer).data("animated") == 0) {
                if ($.fn.visible && $(timer).visible()) {
                    $(timer).data("animated", 1);
                    $(timer).countTo();
                }
            }
        }

        /*=============================================
         Carousel init
         ==============================================*/
        if ($.fn.owlCarousel) {

            var clients = $(".carousel-client");

            clients.each(function() {
                var client, pagination, items, autoPlay;
                client     = $(this);
                autoPlay   = client.data("autoplay");
                pagination = client.data("pagination");
                items      = client.data("item");
                client.owlCarousel({
                    autoPlay: autoPlay,
                    items: items,
                    pagination: pagination
                });
            });

            $("#clients-1").owlCarousel({
                autoPlay: false, //Set AutoPlay to 3 seconds
                items: 6,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3]

            });

            var testimonials = $(".testimonials");

            testimonials.each(function() {
                var testimonial;
                testimonial= $(this);
                testimonial.owlCarousel({
                    autoPlay: 3000,
                    items: 1
                });
            });

            $("#carousel-object").owlCarousel({
                autoPlay: 4000, //Set AutoPlay to 3 seconds
                items: 1
                //pagination : false
            });

            $("#portfolio-carousel").owlCarousel({
                autoPlay: 3000, //Set AutoPlay to 3 seconds
                items: 4,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3],
                navigation: true,
                pagination: false,
                navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']

            });

            $("#portfolio-carousel-alt").owlCarousel({
                autoPlay: false, //Set AutoPlay to 3 seconds
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3],
                navigation: true,
                pagination: false,
                navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
            });

            $(".massive-carousel").each(function() {
                var carousel = $(this);

                carousel.owlCarousel({
                    autoPlay: carousel.data("autoplay"),
                    slideSpeed: carousel.data("slide-speed"),
                    items: carousel.data("lg-items"),
                    itemsDesktop: [1199, carousel.data("md-items")],
                    itemsTablet: [768, carousel.data("sm-items")],
                    itemsMobile: [479, carousel.data("xs-items")],
                    navigationText: ['<i class ="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
                });
            });
        }

        $(".portfolio-with-title").addClass("portfolio");


        /*=============================================
         Typist init
         ==============================================*/
        if (typeof Typist == "function") {
            $(".typist-element").each(function() {
                var id = $(this).attr("id");
                if(id) {
                    new Typist( document.querySelector("#"+id), {
                        letterInterval: 60,
                        textInterval: 3000
                    });
                }
            });
        }


        /*=============================================
         Back to top init
         ==============================================*/
        if (MassiveJS.hasBackToTop) {
            $body.append('<a id="bucket-lift-off" class="bucket-lift-off-hide" href="#"><i class="fa fa-angle-up"></i></a>');
            var $tbScrollBack = $("#bucket-lift-off");
            $window.on("scroll.liftOff", debounce(function(){
                if ($window.scrollTop() > 150) {
                    $tbScrollBack
                        .addClass("bucket-lift-off-show")
                        .removeClass("bucket-lift-off-hide");
                } else {
                    $tbScrollBack
                        .addClass("bucket-lift-off-hide")
                        .removeClass("bucket-lift-off-show");
                }
            }, 100));

            $body.on("click.liftOff", "#bucket-lift-off", function(e){
                e.preventDefault();
                $("body,html").animate({
                    scrollTop: 0
                }, 300 );
            });
        }


        /*=============================================
         Mail chimp init
         ==============================================*/
        if ($.fn.ajaxChimp) {
            $(".mc-subscriber-form").ajaxChimp();
        }

        /*=============================================
         Tabs init
         ==============================================*/
        var MassiveTabs = $(".nav-tabs li:first-child a, .nav-pills li:first-child a");

        MassiveTabs.each(function(e) {
            $(this).tab("show");
        });

        /*=============================================
         Massive banners
         ==============================================*/
        // Elastic banner
        $(".massive-elastic-banner").eislideshow({
            easing      : "easeOutExpo",
            titleeasing : "easeOutExpo",
            titlespeed  : 1200
        });

        // Owl banner
        $(".massive-owl-banner").owlCarousel({
            autoPlay: 4000,
            items: 1,
            navigation: true,
            navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
        });

        // Flex banner
        $(".massive-flex-banner").each(function() {
            var $banner = $(this);
            $banner.flexslider({
                animation: "slide",
                controlNav: $banner.data("pagination")
            });
        });

        /*=============================================
         TB grid init
         ==============================================*/
        $(".tb-grid").masonry({
            itemSelector: ".item",
            percentPosition: true,
            columnWidth: ".box",
        });

        var $imgBoxes = $(".tb-grid").find(".box-img");
        $imgBoxes.each(function(index, item) {
            var $item = $(item), src = $item.data("src");
            if ( src ) {
                $item.css({
                    backgroundImage: 'url("' + src + '")'
                })
            }
        });

        $(".box-img").magnificPopup({
            type:"image",
            gallery: {
                enabled: true
            }
        });

        /*=============================================
         Megamenu alignment fix
         ==============================================*/
        function fixMegamenuDropdown() {
            var dropdownCon;
            dropdownCon = $(".menuzord-right").children(".menu-item-has-children").filter(function() {
                return $(this).children(".dropdown").length;
            });
            dropdownCon.on("mouseenter click", function() {
                var that = this;
                setTimeout(function() {
                    var dropdown, rightOffset;
                    dropdown = $(that).children(".dropdown");
                    rightOffset = windowWidth - (dropdown.offset().left + dropdown.width());
                    if (rightOffset < 450) {
                        dropdown.find(".dropdown").addClass("dropdown-left");
                    }
                }, 10);
            });
        }
        fixMegamenuDropdown();

        /*=============================================
         Portfolio full width fix
         ==============================================*/
        function fixFullWidthPortfolio() {
            var portfolio = $(".Massive-portfolio");
            if (portfolio.parents(".container").length < 1) {
                portfolio.parents(".vc_column_container").addClass("zero-padding");
            }
        }

        fixFullWidthPortfolio();

        // fix blog grid view equal height
        $(".blog-grid-view, .products li, .product-list").matchHeight();

    }); // jquery ready end

})(jQuery);
