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
  <!-- navbar-->
  <%@ include file="../common/public/headerPublic.jsp"%>
  <div class="container">
    <!-- HERO SECTION-->
    <section class="py-5 bg-light">
      <div class="container">
        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
          <div class="col-lg-6">
            <h1 class="h2 text-uppercase mb-0">Shop</h1>
          </div>
          <div class="col-lg-6 text-lg-end">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                <li class="breadcrumb-item"><a class="text-dark" href="">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Shop</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="py-5">
      <div class="container p-0">
        <div class="row">
          <!-- SHOP SIDEBAR-->
          <div class="col-lg-3 order-2 order-lg-1">
            <h5 class="text-uppercase mb-4">Danh mục hàng</h5>
            <div class="py-2 px-4 bg-dark text-white mb-3"><strong class="small text-uppercase fw-bold">Fashion &amp; Acc</strong></div>
            <ul class="list-unstyled small text-muted ps-lg-4 font-weight-normal">
              <li class="mb-2"><a class="reset-anchor" href="shop?category=men&page=1">Đồng hồ Nam</a></li>
              <li class="mb-2"><a class="reset-anchor" href="shop?category=women&page=1">Đồng hồ Nữ</a></li>
              <li class="mb-2"><a class="reset-anchor" href="shop?category=couple&page=1">Đồng hồ cho Cặp đôi</a></li>
            </ul>
            <h6 class="text-uppercase mb-4">Price range</h6>
            <div class="price-range pt-4 mb-5">
              <div id="range"></div>
              <div class="row pt-2">
                <div class="col-6"><strong class="small fw-bold text-uppercase">From</strong></div>
                <div class="col-6 text-end"><strong class="small fw-bold text-uppercase">To</strong></div>
              </div>
            </div>
            <h6 class="text-uppercase mb-3">Show only</h6>
            <div class="form-check mb-1">
              <input class="form-check-input" type="checkbox" id="checkbox_1">
              <label class="form-check-label" for="checkbox_1">Returns Accepted</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="checkbox" id="checkbox_2">
              <label class="form-check-label" for="checkbox_2">Returns Accepted</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="checkbox" id="checkbox_3">
              <label class="form-check-label" for="checkbox_3">Completed Items</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="checkbox" id="checkbox_4">
              <label class="form-check-label" for="checkbox_4">Sold Items</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="checkbox" id="checkbox_5">
              <label class="form-check-label" for="checkbox_5">Deals &amp; Savings</label>
            </div>
            <div class="form-check mb-4">
              <input class="form-check-input" type="checkbox" id="checkbox_6">
              <label class="form-check-label" for="checkbox_6">Authorized Seller</label>
            </div>
            <h6 class="text-uppercase mb-3">Buying format</h6>
            <div class="form-check mb-1">
              <input class="form-check-input" type="radio" name="customRadio" id="radio_1">
              <label class="form-check-label" for="radio_1">All Listings</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="radio" name="customRadio" id="radio_2">
              <label class="form-check-label" for="radio_2">Best Offer</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="radio" name="customRadio" id="radio_3">
              <label class="form-check-label" for="radio_3">Auction</label>
            </div>
            <div class="form-check mb-1">
              <input class="form-check-input" type="radio" name="customRadio" id="radio_4">
              <label class="form-check-label" for="radio_4">Buy It Now</label>
            </div>
          </div>
          <!-- SHOP LISTING-->
          <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
            <div class="row mb-3 align-items-center">
              <div class="col-lg-6 mb-2 mb-lg-0">
                <p class="text-sm text-muted mb-0">Showing 1–12 of 53 results</p>
              </div>
              <div class="col-lg-6">
                <ul class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
                  <li class="list-inline-item text-muted me-3"><a class="reset-anchor p-0" href="#!"><i class="fas fa-th-large"></i></a></li>
                  <li class="list-inline-item text-muted me-3"><a class="reset-anchor p-0" href="#!"><i class="fas fa-th"></i></a></li>
                  <li class="list-inline-item">
                    <select class="selectpicker" data-customclass="form-control form-control-sm">
                      <option value>Sort By </option>
                      <option value="default">Default sorting </option>
                      <option value="popularity">Popularity </option>
                      <option value="low-high">Price: Low to High </option>
                      <option value="high-low">Price: High to Low </option>
                    </select>
                  </li>
                </ul>
              </div>
            </div>
            <div class="row">
              <!-- PRODUCT-->
              <c:forEach items="${productsList}" var="product">
              <div class="col-lg-4 col-sm-6">
                <div class="product text-center">
                  <div class="mb-3 position-relative">

                    <div class="badge text-white bg-"></div>

                    <c:forEach items="${product.productImageList}" var="image">
                      <c:if test="${image.isThumbnail == true}">
                        <a class="d-block" href="product?id=${product.id}"><img class="img-fluid w-100" src="${image.path}" alt="..."></a>
                      </c:if>
                    </c:forEach>

                    <div class="product-overlay">
                      <ul class="mb-0 list-inline">
                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#!"><i class="far fa-heart"></i></a></li>
                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="cart?productId=${product.id}&quantity=1">Thêm vào giỏ hàng</a></li>
                        <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="product?id=${product.id}" data-bs-toggle="modal"><i class="fas fa-expand"></i></a></li>
                      </ul>
                    </div>
                  </div>
                  <h6> <a class="reset-anchor" href="product?id=${product.id}">${product.name}</a></h6>
                  <p class="small text-muted">
                      <%--Format VietNamDong Currency--%>
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${product.price}" type = "currency"/>
                  </p>
                </div>
              </div>
              </c:forEach>
            </div>

            <!-- PAGINATION-->
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center justify-content-lg-end">
                <li class="page-item mx-1"><a class="page-link" href="shop?page=1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <c:if test="${page == 1}">
                <li class="page-item mx-1 active"><a class="page-link" href="shop?page=1">1</a></li>
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=2">2</a></li>
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=3">3</a></li>
                </c:if>
                <c:if test="${page == 2}">
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=1">1</a></li>
                  <li class="page-item mx-1 active"><a class="page-link" href="shop?page=2">2</a></li>
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=3">3</a></li>
                </c:if>
                <c:if test="${page == 3}">
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=1">1</a></li>
                  <li class="page-item mx-1"><a class="page-link" href="shop?page=2">2</a></li>
                  <li class="page-item mx-1 active"><a class="page-link" href="shop?page=3">3</a></li>
                </c:if>

                <li class="page-item ms-1"><a class="page-link" href="shop?page=3" aria-label="Next"><span aria-hidden="true">»</span></a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </section>
  </div>
 
<%--  Footer--%>
  <%@include file="../common/public/footerPublic.jsp"%>

  <!-- Nouislider Config-->
  <script>
    var range = document.getElementById('range');
    noUiSlider.create(range, {
      range: {
        'min': 0,
        'max': 2000
      },
      step: 5,
      start: [100, 1000],
      margin: 300,
      connect: true,
      direction: 'ltr',
      orientation: 'horizontal',
      behaviour: 'tap-drag',
      tooltips: true,
      format: {
        to: function ( value ) {
          return '$' + value;
        },
        from: function ( value ) {
          return value.replace('', '');
        }
      }
    });

  </script>
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
      ajax.onload = function(e) {
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
</div>
</body>
</html>