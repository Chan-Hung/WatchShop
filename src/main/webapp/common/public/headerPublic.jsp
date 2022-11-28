<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- navbar-->
<header class="header bg-white">
  <div class="container px-lg-3">
    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="home"><span class="fw-bold text-uppercase text-dark">WatchShop</span></a>
      <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <!-- Link--><a class="nav-link active" href="home">Trang Chủ</a>
          </li>
          <li class="nav-item">
            <!-- Link--><a class="nav-link" href="shop?page=1">Cửa Hàng</a>
          </li>
          <li class="nav-item">
            <!-- Link--><a class="nav-link" href="shop?category=men&page=1">Nam</a>
          </li>
          <li class="nav-item">
            <!-- Link--><a class="nav-link" href="shop?category=women&page=1">Nữ</a>
          </li>
          <li class="nav-item">
            <!-- Link--><a class="nav-link" href="shop?category=couple&page=1">Cặp đôi</a>
          </li>
        </ul>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="cart"> <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Giỏ Hàng
          <c:if test="${cart != null}">
            <small class="text-gray fw-normal">(${cart.items.size()})</small>
          </c:if>
          </a></li>
          <c:if test="${user == null}">
          <li class="nav-item"><a class="nav-link" href="signup"> <i class="far fa-user me-1 text-gray fw-normal"></i>Đăng Ký</a></li>
          <li class="nav-item"><a class="nav-link" href="signin"> <i class="fas fa-user me-1 text-gray fw-normal"></i>Đăng Nhập</a></li>
          </c:if>
          <c:if test="${user != null}">
            <li class="nav-item"><a class="nav-link" href="account"> <i class="fas fa-user me-1 text-gray fw-normal"></i>${user.userName}</a></li>
          </c:if>
        </ul>
      </div>
    </nav>
  </div>
</header>