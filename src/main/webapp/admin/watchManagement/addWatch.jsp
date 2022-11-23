<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>WatchShop | Thêm đồng hồ</title>
  <%@ include file="../../common/admin/headerLibraryAdmin.jsp"%>
</head>

<body>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <%--SideBar--%>
    <%@ include file="../../common/admin/sideBarAdmin.jsp" %>
    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->

      <nav
              class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
              id="layout-navbar"
      >
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
          <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
          </a>
        </div>

        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
          <!-- Search -->
          <div class="navbar-nav align-items-center">
            <div class="nav-item d-flex align-items-center">
              <i class="bx bx-search fs-4 lh-0"></i>
              <input
                      type="text"
                      class="form-control border-0 shadow-none"
                      placeholder="Search..."
                      aria-label="Search..."
              />
            </div>
          </div>
          <!-- /Search -->

          <ul class="navbar-nav flex-row align-items-center ms-auto">
            <!-- Place this tag where you want the button to render. -->
            <li class="nav-item lh-1 me-3">
              <a
                      class="github-button"
                      href="https://github.com/themeselection/sneat-html-admin-template-free"
                      data-icon="octicon-star"
                      data-size="large"
                      data-show-count="true"
                      aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
              >Star</a
              >
            </li>

            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
              <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                <div class="avatar avatar-online">
                  <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                </div>
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li>
                  <a class="dropdown-item" href="#">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar avatar-online">
                          <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <span class="fw-semibold d-block">John Doe</span>
                        <small class="text-muted">Admin</small>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <div class="dropdown-divider"></div>
                </li>
                <li>
                  <a class="dropdown-item" href="#">
                    <i class="bx bx-user me-2"></i>
                    <span class="align-middle">My Profile</span>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item" href="#">
                    <i class="bx bx-cog me-2"></i>
                    <span class="align-middle">Settings</span>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                  </a>
                </li>
                <li>
                  <div class="dropdown-divider"></div>
                </li>
                <li>
                  <a class="dropdown-item" href="auth-login-basic.html">
                    <i class="bx bx-power-off me-2"></i>
                    <span class="align-middle">Log Out</span>
                  </a>
                </li>
              </ul>
            </li>
            <!--/ User -->
          </ul>
        </div>
      </nav>

      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Quản lý Hàng hóa/</span> Thêm đồng hồ</h4>

          <!-- Basic Layout -->
          <div class="row">
            <div class="col-xl">
              <div class="card mb-4">
                <div class="card-body">
                  <form action="watch" method="post">
                    <input type="hidden" name="action" value="addWatch">
                    <div class="mb-3">
                      <label class="form-label" for="basic-default-fullname">Tên đồng hồ</label>
                      <input type="text" class="form-control" id="basic-default-fullname" name="name" value="${product.name}" />
                    </div>
                    <div class="mb-3">
                      <label for="exampleFormControlSelect1" class="form-label">Danh mục</label>
                      <select class="form-select" name="category" id="exampleFormControlSelect1" aria-label="Default select example">
                        <option selected>Chọn danh mục đồng hồ</option>
                        <option value="1">Nam</option>
                        <option value="2">Nữ</option>
                        <option value="3">Cặp đôi</option>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Thương hiệu</label>
                      <input type="text" class="form-control" name="brand" value="${product.brand}" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Xuất xứ</label>
                      <input type="text" class="form-control"  name="origin" value="${product.origin}" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Kính</label>
                      <input type="text" class="form-control"  name="glass" value="${product.glass}" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Máy</label>
                      <input type="text" class="form-control"  name="machine" value="${product.machine}" />
                    </div>
                    <div class="mb-3">
                    <label class="form-label" >Đường kính mặt số</label>
                    <input type="text" class="form-control"  name="diameter" value="${product.diameter}" />
                  </div>
                    <div class="mb-3">
                      <label class="form-label">Khả năng chống nước</label>
                      <input type="text" class="form-control"  name="waterResistant" value="${product.waterResistant}" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Mô tả sản phẩm</label>
                      <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" value="${product.description}"></textarea>
<%--                      <input type="text" class="form-control"  name="description" value="${product.description}" />--%>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Hình ảnh sản phầm</label>
                      <textarea class="form-control" rows="3" name="image" value="${product.image}"></textarea>
<%--                      <input type="text" class="form-control"  name="image" value="${product.image}" />--%>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Giá</label>
                      <input type="text" class="form-control"  name="price" value="${product.price}" />
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->



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
</body>
</html>
