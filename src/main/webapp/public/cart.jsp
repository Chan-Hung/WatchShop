<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>WatchShop | Giỏ hàng</title>
  <%@ include file="../common/public/headerLibraryPublic.jsp"%>

</head>
<body>
<div class="page-holder">
  <!-- navbar-->
  <%@ include file="../common/public/headerPublic.jsp" %>
  <div class="container">
    <!-- HERO SECTION-->
    <section class="py-5 bg-light">
      <div class="container">
        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
          <div class="col-lg-6">
            <h1 class="h2 text-uppercase mb-0">Giỏ hàng</h1>
          </div>
          <div class="col-lg-6 text-lg-end">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                <li class="breadcrumb-item"><a class="text-dark" href="home">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="py-5">
      <h2 class="h5 text-uppercase mb-4">Giỏ hàng của bạn</h2>
      <div class="row">
        <div class="col-lg-8 mb-4 mb-lg-0">
          <!-- CART TABLE-->
          <div class="table-responsive mb-4">
            <table class="table text-nowrap">
              <thead class="bg-light">
              <tr>
                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Sản phẩm</strong></th>
                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Giá</strong></th>
                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Số lượng</strong></th>
                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Tổng cộng</strong></th>
                <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase"></strong></th>
              </tr>
              </thead>
              <tbody class="border-0">
              <c:forEach items="${cart.items}" var="item">
              <tr>
                <th class="ps-0 py-3 border-0" scope="row">
                    <c:forEach items="${item.product.productImageList}" var="image">
                      <c:if test="${image.isThumbnail == true}">
                          <div class="d-flex align-items-center">
                              <a class="reset-anchor d-block animsition-link" href="product?id=${item.product.id}">
                                <img src="${image.path}" alt="..." width="70"/></a>
                      </c:if>
                    </c:forEach>
                    <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" href="product?id=${item.product.id}">${item.product.name}</a></strong></div>
                  </div>
                </th>
                <td class="p-3 align-middle border-0">
                  <p class="mb-0 small">
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${item.product.price}" type = "currency"/>
                  </p>
                </td>
                <td class="p-3 align-middle border-0">
<%--                  <div class="border d-flex align-items-center justify-content-between px-3"><span class="small text-uppercase text-gray headings-font-family"></span>--%>
<%--                    <div class="quantity">--%>
                      <form action="cart" method="post">
                        <input type="hidden" name="productId" value="${item.product.id}" >
                        <input type=text name="quantity" value="${item.quantity}" size="1">
                        <input type="submit" value="Update">
                      </form>
<%--                    </div>--%>
<%--                  </div>--%>
                </td>
                <td class="p-3 align-middle border-0">
                  <p class="mb-0 small">
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${item.amount}" type = "currency"/>
                  </p>
                </td>
                <td class="p-3 align-middle border-0"><a class="reset-anchor" href="cart?productId=${item.product.id}&quantity=0"><i class="fas fa-trash-alt small text-muted"></i></a></td>
<%--                <td class="p-3 align-middle border-0"><a class="reset-anchor" href="cart?productId=${item.product.id}&quantity=${item.quantity}"><i class="fas fa-home-alt"></i></a></td>--%>

              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- CART NAV-->
          <div class="bg-light px-4 py-3">
            <div class="row align-items-center text-center">
              <div class="col-md-6 mb-3 mb-md-0 text-md-start"><a class="btn btn-link p-0 text-dark btn-sm" href="shop"><i class="fas fa-long-arrow-alt-left me-2"> </i>Tiếp tục mua sắm</a></div>
              <div class="col-md-6 text-md-end"><a class="btn btn-outline-dark btn-sm" href="checkout">Đến trang thanh toán<i class="fas fa-long-arrow-alt-right ms-2"></i></a></div>
            </div>
          </div>
        </div>
        <!-- ORDER TOTAL-->
        <div class="col-lg-4">
          <div class="card border-0 rounded-0 p-lg-4 bg-light">
            <div class="card-body">
              <h5 class="text-uppercase mb-4">Sản phẩm đã mua</h5>
              <ul class="list-unstyled mb-0">
                <c:forEach items="${cart.items}" var="item">
                <li class="d-flex align-items-center justify-content-between">
                  <strong class="text-uppercase small font-weight-bold">${item.product.name}</strong><span class="text-muted small">
                  <fmt:setLocale value = "vi_VN"/>
                  <fmt:formatNumber value = "${item.amount}" type = "currency"/>
                </span></li>
                <li class="border-bottom my-2"></li>
                </c:forEach>
                <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Thành tiền</strong>
                  <span>
                   <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${subTotal}" type = "currency"/>
                </span>
                </li>
                <li>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</div>
</body>
</html>