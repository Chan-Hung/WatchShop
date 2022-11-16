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
                <li class="breadcrumb-item"><a class="text-dark" href="cart.html">Giỏ hàng</a></li>
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
          <form action="#">
            <div class="row gy-3">
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="firstName">Họ</label>
                <input class="form-control form-control-lg" type="text" id="firstName" placeholder="Ví dụ : Nguyễn">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="lastName">Tên</label>
                <input class="form-control form-control-lg" type="text" id="lastName" placeholder="Ví dụ: Nam Anh">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="email">Địa chỉ email</label>
                <input class="form-control form-control-lg" type="email" id="email" placeholder="e.g. Jason@example.com">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="phone">Số điện thoại</label>
                <input class="form-control form-control-lg" type="tel" id="phone" placeholder="e.g. +02 245354745">
              </div>
              <div class="col-lg-12">
                <label class="form-label text-sm text-uppercase" for="address">Địa chỉ nhận hàng</label>
                <input class="form-control form-control-lg" type="text" id="address" placeholder="Tên nhà và tên đường">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="city">Quận/Huyện</label>
                <input class="form-control form-control-lg" type="text" id="city">
              </div>
              <div class="col-lg-6">
                <label class="form-label text-sm text-uppercase" for="state">Tỉnh/Thành</label>
                <input class="form-control form-control-lg" type="text" id="state">
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
              <ul class="list-unstyled mb-0">
                <li class="d-flex align-items-center justify-content-between"><strong class="small fw-bold">Red digital smartwatch</strong><span class="text-muted small">$250</span></li>
                <li class="border-bottom my-2"></li>
                <li class="d-flex align-items-center justify-content-between"><strong class="small fw-bold">Gray Nike running shoes</strong><span class="text-muted small">$351</span></li>
                <li class="border-bottom my-2"></li>
                <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small fw-bold">Tổng cộng</strong>
                  <span>$601</span>
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