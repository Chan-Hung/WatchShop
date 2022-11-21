<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>WatchShop | Ecommerce shop from Group15</title>
    <%@ include file="../common/public/headerLibraryPublic.jsp"%>
</head>
<body>
<div class="page-holder">
    <%-- Header--%>
    <%@ include file="../common/public/headerPublic.jsp" %>

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
                <h2 class="h5 text-uppercase mb-4">Đồng Hồ Nam</h2>
            </header>
        </section>
        <!-- TRENDING PRODUCTS-->
        <section class="py-5">
            <header>
                <h2 class="h5 text-uppercase mb-4">Đồng Hồ Citizen</h2>
            </header>
            <div class="row">
                <c:forEach items="${citizenProducts}" var="product">
                    <!-- PRODUCT-->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="product text-center">
                            <div class="position-relative mb-3">
                                <div class="badge text-white bg-"></div>
                                <c:forEach items="${product.productImageList}" var="image">
                                    <c:if test="${image.isThumbnail == true}">
                                        <a class="d-block" href="product?id=${product.id}">
                                            <img class="img-fluid w-100" src="${image.path}" alt="..."></a>
                                    </c:if>
                                </c:forEach>
                                <div class="product-overlay">
                                    <ul class="mb-0 list-inline">
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark"
                                                                                href="#!"><i
                                                class="far fa-heart"></i></a></li>
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark"
                                                                                href="cart?productId=${product.id}&quantity=1">Thêm vào giỏ hàng</a></li>
                                        <li class="list-inline-item me-0"><a class="btn btn-sm btn-outline-dark"
                                                                             href="product?id=${product.id}" data-bs-toggle="modal"><i
                                                class="fas fa-expand"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h6><a class="reset-anchor" href="product?id=${product.id}">${product.name}</a></h6>
                            <p class="small text-muted">
                            <%-- Format VietNamDong Currency--%>
                                <fmt:setLocale value = "vi_VN"/>
                                <fmt:formatNumber value = "${product.price}" type = "currency"/>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <header>
                <!-- <p class="small text-muted small text-uppercase mb-1">Made the hard way</p> -->
                <h2 class="h5 text-uppercase mb-4">Đồng Hồ Casio</h2>
            </header>
            <div class="row">
                <c:forEach items="${casioProducts}" var="product">
                    <!-- PRODUCT-->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="product text-center">
                            <div class="position-relative mb-3">
                                <div class="badge text-white bg-"></div>
                                <c:forEach items="${product.productImageList}" var="image">
                                    <c:if test="${image.isThumbnail == true}">
                                        <a class="d-block" href="product?id=${product.id}">
                                            <img class="img-fluid w-100" src="${image.path}" alt="..."></a>
                                    </c:if>
                                </c:forEach>
                                <div class="product-overlay">
                                    <ul class="mb-0 list-inline">
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark"
                                                                                href="#!"><i
                                                class="far fa-heart"></i></a></li>
                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark"
                                                                                href="cart?productId=${product.id}&quantity=1">Thêm vào giỏ hàng</a></li>
                                        <li class="list-inline-item me-0"><a class="btn btn-sm btn-outline-dark"
                                                                             href="product?id=${product.id}" data-bs-toggle="modal"><i
                                                class="fas fa-expand"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h6><a class="reset-anchor" href="product?id=${product.id}">${product.name}</a></h6>
                            <p class="small text-muted">
                                    <%-- Format VietNamDong Currency--%>
                                <fmt:setLocale value = "vi_VN"/>
                                <fmt:formatNumber value = "${product.price}" type = "currency"/>
                            </p>
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

    <%-- Footer--%>
    <%@ include file="/common/public/footerPublic.jsp" %>
</div>
</body>
</html>