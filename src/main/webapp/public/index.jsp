<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>WatchShop | Ecommerce shop from Group15</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- gLightbox gallery-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/vendor/glightbox/css/glightbox.min.css">
    <!-- Range slider-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/vendor/nouislider/nouislider.min.css">
    <!-- Choices CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/vendor/choices.js/public/assets/styles/choices.min.css">
    <!-- Swiper slider-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/vendor/swiper/swiper-bundle.min.css">
    <!-- Google fonts-->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/img/favicon.png">
</head>
<body>
<div class="page-holder">
    <%--    Header--%>
    <%@ include file="../common/public/headerPublic.jsp" %>
    <!--  Modal -->
    <div class="modal fade" id="productView" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content overflow-hidden border-0">
                <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                        data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="modal-body p-0">
                    <div class="row align-items-stretch">
                        <div class="col-lg-6 p-lg-0">
                            <a class="glightbox product-view d-block h-100 bg-cover bg-center"
                               style="background: url(img/product-5.jpg)" href="img/product-5.jpg"
                               data-gallery="gallery1" data-glightbox="Red digital smartwatch"></a>
                            <a class="glightbox d-none" href="img/product-5-alt-1.jpg" data-gallery="gallery1"
                               data-glightbox="Red digital smartwatch"></a><a class="glightbox d-none"
                                                                              href="img/product-5-alt-2.jpg"
                                                                              data-gallery="gallery1"
                                                                              data-glightbox="Red digital smartwatch"></a>
                        </div>
                        <div class="col-lg-6">
                            <div class="p-4 my-md-4">
                                <ul class="list-inline mb-2">
                                    <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                                    <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i>
                                    </li>
                                    <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i>
                                    </li>
                                    <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i>
                                    </li>
                                    <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i>
                                    </li>
                                </ul>
                                <h2 class="h4">Red digital smartwatch</h2>
                                <p class="text-muted">$250</p>
                                <p class="text-sm mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut
                                    ullamcorper leo, eget euismod orci. Cum sociis natoque penatibus et magnis dis
                                    parturient montes nascetur ridiculus mus. Vestibulum ultricies aliquam
                                    convallis.</p>
                                <div class="row align-items-stretch mb-4 gx-0">
                                    <div class="col-sm-7">
                                        <div class="border d-flex align-items-center justify-content-between py-1 px-3">
                                            <span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                                            <div class="quantity">
                                                <button class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                                                <input class="form-control border-0 shadow-0 p-0" type="text" value="1">
                                                <button class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-5"><a
                                            class="btn btn-dark btn-sm w-100 h-100 d-flex align-items-center justify-content-center px-0"
                                            href="cart.html">Add to cart</a></div>
                                </div>
                                <a class="btn btn-link text-dark text-decoration-none p-0" href="#!"><i
                                        class="far fa-heart me-2"></i>Add to wish list</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- HERO SECTION-->
    <div class="container">
        <section class="hero pb-3 bg-cover bg-center d-flex align-items-center"
                 style="background: url('https://www.goldsmiths.co.uk/medias/watches-hero-desktop-luxury-iwc-aug22.jpg?context=bWFzdGVyfHJvb3R8MzM5MzIzfGltYWdlL2pwZWd8aDkzL2hkOC85MTgxOTcwNjI4NjM4LmpwZ3wxZWQ5MDUzNjc5ZjQ3NjM5OTU0MWEzN2JjZjQyMDNhNjNhZTRjNjhiNWU1Y2IxNjI1NThiODc4NTliMGQ3ZjU3&imwidth=1920')">
            <div class="container py-5">
                <div class="row px-4 px-lg-5">

                </div>
            </div>
        </section>
        <!-- CATEGORIES SECTION-->
        <section class="pt-5">
            <header class="text-center">
                <p class="small text-muted small text-uppercase mb-1">Bộ Sưu Tập</p>
                <h2 class="h5 text-uppercase mb-4">Đồng Hồ Casino</h2>
            </header>
            <!-- <div class="row">
              <div class="col-md-4"><a class="category-item" href="shop.html"><img class="img-fluid" src="img/cat-img-1.jpg" alt=""/><strong class="category-item-title">Clothes</strong></a>
              </div>
              <div class="col-md-4"><a class="category-item mb-4" href="shop.html"><img class="img-fluid" src="img/cat-img-2.jpg" alt=""/><strong class="category-item-title">Shoes</strong></a><a class="category-item" href="shop.html"><img class="img-fluid" src="img/cat-img-3.jpg" alt=""/><strong class="category-item-title">Watches</strong></a>
              </div>
              <div class="col-md-4"><a class="category-item" href="shop.html"><img class="img-fluid" src="img/cat-img-4.jpg" alt=""/><strong class="category-item-title">Electronics</strong></a>
              </div>
            </div> -->
        </section>
        <!-- TRENDING PRODUCTS-->
        <section class="py-5">
            <header>
                <!-- <p class="small text-muted small text-uppercase mb-1">Made the hard way</p> -->
                <h2 class="h5 text-uppercase mb-4">Đồng Hồ Citizen</h2>
            </header>
            <div class="row">
                <c:forEach items="${productsList}" var="o" begin="1" end="8">
                    <!-- PRODUCT-->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="product text-center">
                            <div class="position-relative mb-3">
                                <div class="badge text-white bg-"></div>
                                <a class="d-block" href="detail.html"><img class="img-fluid w-100" src="${o.image}"
                                                                           alt="..."></a>
                                <div class="product-overlay">
                                    <ul class="mb-0 list-inline">
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark"
                                                                                href="#!"><i
                                                class="far fa-heart"></i></a></li>
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark"
                                                                                href="cart.html">Add to cart</a></li>
                                        <li class="list-inline-item me-0"><a class="btn btn-sm btn-outline-dark"
                                                                             href="#productView" data-bs-toggle="modal"><i
                                                class="fas fa-expand"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h6><a class="reset-anchor" href="detail.html">${o.name}</a></h6>
                            <p class="small text-muted">${o.price}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- SERVICES-->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row text-center gy-3">
                    <div class="col-lg-4">
                        <div class="d-inline-block">
                            <div class="d-flex align-items-end">
                                <svg class="svg-icon svg-icon-big svg-icon-light">
                                    <use xlink:href="#delivery-time-1"></use>
                                </svg>
                                <div class="text-start ms-3">
                                    <h6 class="text-uppercase mb-1">Miễn Phí Vận Chuyển</h6>
                                    <p class="text-sm mb-0 text-muted">Miễn Phí Vận Chuyển Toàn Cầu</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-inline-block">
                            <div class="d-flex align-items-end">
                                <svg class="svg-icon svg-icon-big svg-icon-light">
                                    <use xlink:href="#helpline-24h-1"></use>
                                </svg>
                                <div class="text-start ms-3">
                                    <h6 class="text-uppercase mb-1">Phục Vụ 24/7</h6>
                                    <p class="text-sm mb-0 text-muted">Miễn Phí Vận Chuyển Toàn Cầu</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-inline-block">
                            <div class="d-flex align-items-end">
                                <svg class="svg-icon svg-icon-big svg-icon-light">
                                    <use xlink:href="#label-tag-1"></use>
                                </svg>
                                <div class="text-start ms-3">
                                    <h6 class="text-uppercase mb-1">Sale</h6>
                                    <p class="text-sm mb-0 text-muted">Miễn Phí Vận Chuyển Toàn Cầu</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- NEWSLETTER-->
        <section class="py-5">
            <div class="container p-0">
                <div class="row gy-3">
                    <div class="col-lg-6">
                        <h5 class="text-uppercase">Trở Thành Khách Hàng Thân Thiết</h5>
                        <p class="text-sm text-muted mb-0">Cập Nhật những chương trình sản phẩm mới và giảm giá về Email
                            của bạn</p>
                    </div>
                    <div class="col-lg-6">
                        <form action="#">
                            <div class="input-group">
                                <input class="form-control form-control-lg" type="email"
                                       placeholder="Enter your email address" aria-describedby="button-addon2">
                                <button class="btn btn-dark" id="button-addon2" type="submit">Xác Nhận</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

<%--        Footer--%>
        <%@ include file="/common/public/footerPublic.jsp"%>

    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/public/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/vendor/nouislider/nouislider.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/front.js"></script>
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite -
        //   see more here
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function (e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }

        // this is set to BootstrapTemple website as you cannot
        // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
        // while using file:// protocol
        // pls don't forget to change to your domain :)
        injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

    </script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</div>
</body>
</html>