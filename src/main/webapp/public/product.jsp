<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>${product.name} | WatchShop</title>
    <%@ include file="../common/public/headerLibraryPublic.jsp"%>
</head>
<body>
<div class="page-holder bg-light">
    <!-- navbar-->
    <%@ include file="../common/public/headerPublic.jsp" %>
    <section class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-6">
                    <!-- PRODUCT SLIDER-->
                    <div class="row m-sm-0">
                        <div class="col-sm-2 p-sm-0 order-2 order-sm-1 mt-2 mt-sm-0 px-xl-2">
                            <div class="swiper product-slider-thumbs">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${product.productImageList}" var="image">
                                        <c:if test="${image.isThumbnail == true}">
                                            <div class="swiper-slide h-auto swiper-thumb-item mb-3">
                                                <img class="w-100" src="${image.path}" alt="...">
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach items="${product.productImageList}" var="image">
                                        <c:if test="${image.isThumbnail != true}">
                                            <div class="swiper-slide h-auto swiper-thumb-item mb-3">
                                                <img class="w-100" src="${image.path}"   alt="...">
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-10 order-1 order-sm-2">
                            <div class="swiper product-slider">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${product.productImageList}" var="image">
                                        <c:if test="${image.isThumbnail == true}">
                                            <div class="swiper-slide h-auto">
                                                <a class="glightbox product-view" href="${image.path}"
                                                    data-gallery="gallery2" data-glightbox="Product item 1">
                                                    <img class="img-fluid" src="${image.path}" alt="...">
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach items="${product.productImageList}" var="image" varStatus="loop">
                                        <c:if test="${image.isThumbnail != true}">
                                            <div class="swiper-slide h-auto">
                                                <a class="glightbox product-view" href="${image.path}"
                                                   data-gallery="gallery2" data-glightbox="Product item ${loop.index + 2}">
                                                    <img class="img-fluid" src="${image.path}" alt="...">
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PRODUCT DETAILS-->
                <div class="col-lg-6">
                    <ul class="list-inline mb-2 text-sm">
                        <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                        <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i></li>
                        <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i></li>
                        <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i></li>
                        <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i></li>
                    </ul>
                    <h1>${product.name}</h1>
                    <p class="text-muted lead">
                        <%--Format VietNamDong Currency--%>
                        <fmt:setLocale value = "vi_VN"/>
                        <fmt:formatNumber value = "${product.price}" type = "currency"/>
                    </p>
                    <p class="text-sm mb-4">${product.description}</p>
                    <div class="row align-items-stretch mb-4">
                        <div class="col-sm-3 pl-sm-0"><a
                                class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0"
                                href="cart?productId=${product.id}&quantity=1">Thêm vào giỏ hàng</a></div>
                    </div>
                    <a class="text-dark p-0 mb-4 d-inline-block" href="#!"><i class="far fa-heart me-2">

                    </i>Thêm vào mục yêu thích</a><br>
                    <ul class="list-unstyled small d-inline-block">
                        <li class="px-3 py-2 mb-1 bg-white">
                            <strong class="text-uppercase">Thương hiệu</strong>
                            <span class="ms-2 text-muted">${product.brand}</span></li>
                        <li class="px-3 py-2 mb-1 bg-white text-muted">
                            <strong class="text-uppercase text-dark">Máy</strong>
                            <a class="reset-anchor ms-2">${product.machine}</a>
                        </li>
                        <li class="px-3 py-2 mb-1 bg-white text-muted">
                            <strong class="text-uppercase text-dark">Đường kính mặt </strong>
                            <a class="reset-anchor ms-2">${product.diameter} mm</a>
                        </li>
                    </ul>

                    <ul class="list-unstyled small d-inline-block">
                        <li class="px-3 py-2 mb-1 bg-white text-muted">
                            <strong class="text-uppercase text-dark">Xuất xứ</strong>
                            <a class="reset-anchor ms-2" >${product.origin}</a>
                        </li>
                        <li class="px-3 py-2 mb-1 bg-white text-muted">
                            <strong class="text-uppercase text-dark">Kính</strong>
                            <a class="reset-anchor ms-2">${product.glass}</a>
                        </li>

                        <li class="px-3 py-2 mb-1 bg-white text-muted">
                            <strong class="text-uppercase text-dark">Khả năng chống nước</strong>
                            <a class="reset-anchor ms-2">${product.waterResistant} ATM</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- DETAILS TABS-->
            <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                <li class="nav-item"><a class="nav-link text-uppercase active" id="description-tab" data-bs-toggle="tab"
                                        href="#description" role="tab" aria-controls="description" aria-selected="true">Mô tả</a>
                </li>
                <li class="nav-item"><a class="nav-link text-uppercase" id="reviews-tab" data-bs-toggle="tab"
                                        href="#reviews" role="tab" aria-controls="reviews"
                                        aria-selected="false">Bình luận</a></li>
            </ul>
            <div class="tab-content mb-5" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel"
                     aria-labelledby="description-tab">
                    <div class="p-4 p-lg-5 bg-white">
                        <h6 class="text-uppercase">Mô tả sản phẩm </h6>
                        <p class="text-muted text-sm mb-0">${product.description}</p>
                    </div>
                </div>
                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                    <div class="p-4 p-lg-5 bg-white">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="d-flex mb-3">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="img/customer-1.png"
                                                                    alt="" width="50"/></div>
                                    <div class="ms-3 flex-shrink-1">
                                        <h6 class="mb-0 text-uppercase">Jason Doe</h6>
                                        <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                        <ul class="list-inline mb-1 text-xs">
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i
                                                    class="fas fa-star-half-alt text-warning"></i></li>
                                        </ul>
                                        <p class="text-sm mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur
                                            adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                                            aliqua.</p>
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="img/customer-2.png"
                                                                    alt="" width="50"/></div>
                                    <div class="ms-3 flex-shrink-1">
                                        <h6 class="mb-0 text-uppercase">Jane Doe</h6>
                                        <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                        <ul class="list-inline mb-1 text-xs">
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i>
                                            </li>
                                            <li class="list-inline-item m-0"><i
                                                    class="fas fa-star-half-alt text-warning"></i></li>
                                        </ul>
                                        <p class="text-sm mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur
                                            adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                                            aliqua.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- RELATED PRODUCTS-->
            <h2 class="h5 text-uppercase mb-4">Sản phẩm liên quan</h2>
            <div class="row">
                <!-- PRODUCT-->
                <c:forEach items="${relatedProducts}" var="relatedProduct">
                <div class="col-lg-3 col-sm-6">
                    <div class="product text-center skel-loader">
                        <div class="d-block mb-3 position-relative">
                                <c:forEach items="${relatedProduct.productImageList}" var="image">
                                <c:if test="${image.isThumbnail == true}">
                                    <a class="d-block" href="product?id=${relatedProduct.id}">
                                    <img class="img-fluid w-100" src="${image.path}" alt="...">
                                    </a>
                                </c:if>
                                </c:forEach>

                            <div class="product-overlay">
                                <ul class="mb-0 list-inline">
                                    <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark"
                                                                            href="#!"><i class="far fa-heart"></i></a>
                                    </li>
                                    <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="cart?productId=${product.id}&quantity=1">Thêm vào giỏ hàng</a></li>
                                    <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark"
                                                                         href="#productView" data-bs-toggle="modal"><i
                                            class="fas fa-expand"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <h6><a class="reset-anchor" href="detail.html">${relatedProduct.name}</a></h6>
                        <p class="small text-muted">
                            <fmt:setLocale value = "vi_VN"/>
                            <fmt:formatNumber value = "${relatedProduct.price}" type = "currency"/>
                        </p>
                    </div>
                </div>
                </c:forEach>

            </div>
        </div>
    </section>
    <%--  Footer--%>
    <%@include file="../common/public/footerPublic.jsp"%>
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

</div>
</body>
</html>