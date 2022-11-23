<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>WatchShop | Xem thông tin sản phẩm</title>
    <%@ include file="../../common/admin/headerLibraryAdmin.jsp"%>
</head>

<body>
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">
            <a class="fw-bold" href="watch">Quản lý Hàng hóa/</a></span> Chi tiết sản phẩm</h4>
          <!-- Basic Layout -->
          <div class="row">
            <div class="col-xl">
              <div class="card mb-4">
                <div class="card-body">
                    <div class="mb-3">
                      <label class="form-label" >Tên đồng hồ</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.name}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Danh mục</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.category.name}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Thương hiệu</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.brand}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Xuất xứ</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.origin}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Kính</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.glass}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Máy</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.machine}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                    <label class="form-label" >Đường kính mặt số</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.diameter}"/>
                        </span>
                  </div>
                    <div class="mb-3">
                      <label class="form-label">Khả năng chống nước</label>
                        <span type="text" class="form-control" readonly>
                            <c:out value = "${product.waterResistant}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Mô tả sản phẩm</label>
                      <span type="text" rows="7" class="form-control" readonly>
                            <c:out value = "${product.description}"/>
                        </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Hình ảnh sản phầm</label>
                      <span class="form-control" >
                            <c:forEach var="image" items="${product.productImageList}">
                              <img src="${image.path}" width="150" height="150" alt="${image.id}"/>
                            </c:forEach>
                      </span>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Giá</label>
                      <span type="text" rows="7" class="form-control" readonly>
                        <fmt:setLocale value = "vi_VN"/>
                        <fmt:formatNumber value = "${product.price}" type = "currency"/>
                      </span>
                    </div>
                  <a style="width:100px;margin-top:0" class="btn btn-primary" href="watch">Quay về</a>

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
