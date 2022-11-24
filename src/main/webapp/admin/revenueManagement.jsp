<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://example.com/functions"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>WatchShop | Quản lý doanh thu</title>
  <%@ include file="../common/admin/headerLibraryAdmin.jsp"%>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">

    <%--SideBar--%>
    <%@ include file="../common/admin/sideBarAdmin.jsp" %>

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
              <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                 data-bs-toggle="dropdown">
                <div class="avatar avatar-online">
                  <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle"/>
                </div>
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li>
                  <a class="dropdown-item" href="#">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar avatar-online">
                          <img src="../assets/img/avatars/1.png" alt
                               class="w-px-40 h-auto rounded-circle"/>
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Quản lý /</span> Quản lý Doanh thu</h4>
          <!-- Hoverable Table rows -->
          <c:set var = "now" value = "<% = new java.util.Date()%>" />
          <div class="card">
            <h5 style="padding-bottom:12px;" class="card-header">Danh sách hóa đơn</h5>
              <form action="revenue" method="post">
              <div class="row" style="width: 200px">
              <label class="col-md-4 col-form-label" style="margin-left: 20px;">Từ</label>
                <input class="col-md-4  form-control" name="fromDate" type="date" style="margin-left: 70px;margin-top: -35px" value="${now}" />

              <label class="col-md-4 col-form-label" style="margin-left: 320px;margin-top: -35px">Đến</label>
                <input class=" col-md-4  form-control" name="toDate" type="date" style="margin-left: 370px;margin-top: -40px" value="${now}" />
            </div>
              <button type="submit" style="width:80px;margin-top:10px;margin-left: 30px" class="btn btn-primary" class="btn btn-primary">Lọc</button>
            </form>
            <div class="table-responsive text-nowrap">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>STT</th>
                  <th>Họ tên</th>
                  <th>SĐT</th>
                  <th>Tổng giá trị</th>
                  <th>Ngày thanh toán</th>
<%--                  <th>Chi tiết đơn hàng</th>--%>
                </tr>
                </thead>

                <tbody class="table-border-bottom-0">
                <c:forEach items="${ordersList}" var="order" varStatus="loop">
                  <tr>
                    <td>${loop.index+1}</td>
                    <td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>${order.lastName} ${order.firstName}</strong>
                    </td>
                    <td>${order.phoneNumber}</td>
                    <td>
                      <fmt:setLocale value = "vi_VN"/>
                      <fmt:formatNumber value = "${order.total}" type = "currency"/>
                    </td>
                    <td>
                        ${f:formatLocalDateTime(order.createdAt, 'dd/MM/yyyy')}
                    </td>
<%--                    <td>--%>
<%--                      <div class="dropdown">--%>
<%--                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"--%>
<%--                                data-bs-toggle="dropdown">--%>
<%--                          <i class="bx bx-dots-vertical-rounded"></i>--%>
<%--                        </button>--%>
<%--                        <div class="dropdown-menu">--%>
<%--                          <a class="dropdown-item" href="watch?id=${product.id}&action=viewWatch"--%>
<%--                          ><i class="bx bx-edit-alt me-1"></i>Chi tiết sản phẩm</a--%>
<%--                          >--%>
<%--                          <a class="dropdown-item" href="watch?id=${product.id}&action=editWatch"--%>
<%--                          ><i class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a--%>
<%--                          >--%>
<%--                          <a class="dropdown-item" href="javascript:void(0);"--%>
<%--                          ><i class="bx bx-trash me-1"></i> Xóa</a--%>
<%--                          >--%>
<%--                        </div>--%>
<%--                      </div>--%>
<%--                    </td>--%>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <br>
          <%--                    //Pagination with JSTL core tag - Using c:choose+c:when:c:otherwise--%>
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-end">
              <c:if test="${page != 1}">
                <li><a class="page-link"  href="revenue?page=${page - 1}">
                  <i class="tf-icon bx bx-chevrons-left"></i></a>
                </li>
              </c:if>
              <c:forEach begin="1" end="3" var="i">
                <c:choose>
                  <c:when test="${page == i}">
                    <li class="page-item active">
                      <a class="page-link" href="revenue?page=${i}">${i}</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="revenue?page=${i}">${i}</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${page != 3}">
                <li class="page-item next">
                  <a class="page-link" href="watch?page=${i+1}"
                  ><i class="tf-icon bx bx-chevrons-right"></i
                  ></a>
                </li>
              </c:if>
            </ul>
          </nav>
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

  <script async defer src="https://buttons.github.io/buttons.js"></script>
</div>
</body>
</html>
