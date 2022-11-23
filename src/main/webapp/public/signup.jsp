<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>WatchShop | Đăng ký tài khoản</title>
  <%@include file="../common/public/headerLibraryAuthForms.jsp"%>
</head>

<body>
<!-- Content -->

<div class="container-xxl">
  <div class="authentication-wrapper authentication-basic container-p-y">
    <div class="authentication-inner">
      <!-- Register Card -->
      <div class="card">
        <div class="card-body">
          <!-- Logo -->
          <img class="img-fluid w-5" src="${pageContext.request.contextPath}/public/img/favicon2.png" alt="...">
          <h4 class="mb-2">Cùng trở thành khách hàng thân thiết của WatchShop</h4>
          <p class="mb-4">Đăng ký tài khoản ngay tại đây</p>
          <p>${message}</p>
          <form id="formAuthentication" class="mb-3" action="signup" method="POST">
            <div class="mb-3">
              <label class="form-label">Tên đăng nhập</label>
              <input
                      type="text"
                      class="form-control"
                      id="username"
                      name="userName"
                      placeholder="Nhập tên đăng nhập của bạn"
                      minlength="6"
                      maxlength="20"
                      required
                      autofocus
              />
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn" required/>
            </div>
            <div class="mb-3 form-password-toggle">
              <label class="form-label" for="password">Mật khẩu</label>
              <div class="input-group input-group-merge">
                <input
                        type="password"
                        id="password"
                        class="form-control"
                        name="password"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        required
                        minlength="8"
                        maxlength="20"
                        aria-describedby="password"
                />
                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
              </div>
            </div>
            <div class="mb-3 form-password-toggle">
              <label class="form-label" for="password">Xác nhận mật khẩu</label>
              <div class="input-group input-group-merge">
                <input
                        type="password"
                        id="password2"
                        class="form-control"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        required
                        name = "password2"
                        minlength="8"
                        maxlength="20"
                        aria-describedby="password"
                />
                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
              </div>
            </div>
            <button type="submit" class="btn btn-primary d-grid w-100">Đăng ký</button>
          </form>

          <p class="text-center">
            <span>Đã có tài khoản</span>
            <a href="signin">
              <span>Đăng nhập ngay</span>
            </a>
          </p>
        </div>
      </div>
      <!-- Register Card -->
    </div>
  </div>
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="${pageContext.request.contextPath}/admin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="${pageContext.request.contextPath}/admin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/main.js"></script>
<script>
  function validateForm() {
    let userName = document.getElementById("username");
    if (userName === "hungkevin") {
      alert("Name must be different from hungkevin");
      return false;
    }
  }
  const form = document.querySelector('form');
  form.addEventListener('submit', validateForm);
</script>
<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
