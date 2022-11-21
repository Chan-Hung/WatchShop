<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>WatchShop | Thanh toán</title>
  <%@ include file="../common/public/headerLibraryPublic.jsp"%>
</head>
<body>
<div class="page-holder">
  <%-- Header--%>
  <%@ include file="../common/public/headerPublic.jsp" %>

  <div class="container">
    <!-- HERO SECTION-->
    <section class="py-5 bg-light">
      <div class="container">
        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
          <div class="col-lg-6">
            <h1 class="h2 text-uppercase mb-0">Thanh toán</h1>
          </div>
          <div class="col-lg-6 text-lg-end">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                <li class="breadcrumb-item"><a class="text-dark" href="home">Trang chủ</a></li>
                <li class="breadcrumb-item"><a class="text-dark" href="cart">Giỏ hàng</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="py-5">
      <!-- BILLING ADDRESS-->
      <h2 class="h5 text-uppercase mb-4">Chi tiết hóa đơn</h2>
      <div class="row">
        <div class="col-lg-8">
          <form action="checkout" method="post">
            <div class="row gy-3">
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" >Họ</label>
                <input class="form-control form-control-lg" type="text" name="lastName" value="${order.firstName}" placeholder="Ví dụ : Nguyễn">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" >Tên</label>
                <input class="form-control form-control-lg" type="text" name="firstName" value="${order.lastName}" placeholder="Ví dụ: Nam Anh">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" >Địa chỉ email</label>
                <input class="form-control form-control-lg" type="email" name="email" value="${order.email}" placeholder="e.g. namanh@gmail.com">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase">Số điện thoại</label>
                <input class="form-control form-control-lg" type="tel" name="phoneNumber" value ="${order.email}" placeholder="e.g. 0998765392">
              </div>
              <div class="col-lg-12">
                <label class="form-label text-sm text-uppercase">Địa chỉ nhận hàng</label>
                <input class="form-control form-control-lg" type="text" name="homeNumber" value ="${order.address.homeNumber}" placeholder="Địa chỉ nhà">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase">Quận/Huyện</label>
                <input class="form-control form-control-lg" name="district" type="text" value ="${order.address.district}" id="city">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="state">Tỉnh/Thành</label>
                <input class="form-control form-control-lg" type="text" name="city" value ="${order.address.city}"  id="state">
              </div>
              </div>
            <br>
              <div class="col-lg-12 form-group">
                <button class="btn btn-dark" type="submit">Đặt hàng</button>
              </div>
          </form>
        </div>
        <!-- ORDER SUMMARY-->
        <div class="col-lg-4">
          <div class="card border-0 rounded-0 p-lg-4 bg-light">
            <div class="card-body">
              <h5 class="text-uppercase mb-4">Đơn hàng của bạn</h5>
              <h6 class="mb-4">Lưu ý: Đơn vị tiền tệ sẽ được chuyển đổi sang USD tại trang thanh toán Paypal</h6>
              <ul class="list-unstyled mb-0">
                <c:forEach items="${cart.items}" var="item">
                <li class="d-flex align-items-center justify-content-between">
                  <strong class="small fw-bold">${item.product.name}</strong>
                  <span class="text-muted small">
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${item.amount}" type = "currency"/>
                  </span>
                </li>
                <li class="border-bottom my-2"></li>
                </c:forEach>
                <li class="d-flex align-items-center justify-content-between">
                  <strong class="small fw-bold">Phí vận chuyển</strong>
                  <c:set var = "shippingFee" scope = "session" value = "${50000}"/>
                  <span class="text-muted small">
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${shippingFee}" type = "currency"/>
                  </span>
                </li>
                <li class="border-bottom my-2"></li>
                <li class="d-flex align-items-center justify-content-between">
                  <strong class="text-uppercase small fw-bold">Tổng cộng</strong>
                  <span><c:set var = "total" scope = "session" value = "${subTotal + shippingFee}"/>
                  <span class="text-muted small">
                    <fmt:setLocale value = "vi_VN"/>
                    <fmt:formatNumber value = "${total}" type = "currency"/>
                  </span>
                  </span>
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
</div>
</body>
</html>