<%@ page contentType="text/html; charset=UTF-8" %>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="home" class="app-brand-link">
            <img class="img-fluid w-5" src="${pageContext.request.contextPath}/public/img/icon3.png" alt="...">
            <span class="app-brand-text demo menu-text fw-bolder ms-2">WatchShop</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item">
            <a href="admin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-terminal"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="category" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Quản lý Danh mục</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="watch" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div data-i18n="Analytics">Quản lý Hàng hóa</div>
            </a>
        </li>
        <li class="menu-item">
        <a href="customer" class="menu-link">
            <i class="menu-icon tf-icons bx bx-id-card"></i>
            <div data-i18n="Analytics">Quản lý Khách hàng</div>
        </a>
        </li>
        <li class="menu-item">
            <a href="revenue" class="menu-link">
                <i class="menu-icon tf-icons bx bx-line-chart"></i>
                <div data-i18n="Analytics">Quản lý Doanh thu</div>
            </a>
        </li>
    </ul>
</aside>