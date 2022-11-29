<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>WatchShop | Đăng nhập</title>
  <%@include file="../common/public/headerLibraryAuthForms.jsp"%>
</head>

<body>
<!-- Content -->

<div class="container-xxl">
  <div class="authentication-wrapper authentication-basic container-p-y">
    <div class="authentication-inner">
      <!-- Register -->
      <div class="card">
        <div class="card-body">
          <img class="img-fluid w-5" src="${pageContext.request.contextPath}/public/img/favicon2.png" alt="...">
          <!-- /Logo -->
          <h4 class="mb-2">Chào mừng đến với WatchShop!</h4>
          <p class="mb-4">Hãy đăng nhập ngay tại đây</p>
          <p style="color: red">${message}</p>
          <form id="formAuthentication" class="mb-3" action="signin" method="POST">
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input
                      type="text"
                      class="form-control"
                      id="email"
                      name="email"
                      placeholder="Email của bạn"
                      autofocus
                      required
              />
            </div>
            <div class="mb-3 form-password-toggle">
              <div class="d-flex justify-content-between">
                <label class="form-label" for="password">Mật khẩu</label>
                <a href=>
                  <small>Quên mật khẩu</small>
                </a>
              </div>
              <div class="input-group input-group-merge">
                <input
                        type="password"
                        id="password"
                        class="form-control"
                        name="password"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        aria-describedby="password"
                        required
                />
                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
              </div>
            </div>
            <div class="mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="rememberMe" checked />
                <label class="form-check-label" >Nhớ tài khoản</label>
              </div>
            </div>
            <div class="mb-3">
              <button class="btn btn-primary d-grid w-100" type="submit">Đăng nhập</button>
            </div>
          </form>

          <p class="text-center">
            <span>Cùng trở thành khách hàng thân thiết tại cửa hàng chúng tôi</span>
            <a href="signup">
              <span>Tạo tài khoản</span>
            </a>
          </p>
        </div>
      </div>
      <!-- /Register -->
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

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script type="text/javascript">

  $(document).ready(function() {
    $("#formAuthentication").validate({
      rules: {
        email: {
          required: true,
          email: true
        },

        password: "required",
      },

      messages: {
        email: {
          required: "Please enter email",
          email: "Please enter a valid email address"
        },

        password: "Please enter password"
      }
    });

  });
</script>
</body>
</html>
