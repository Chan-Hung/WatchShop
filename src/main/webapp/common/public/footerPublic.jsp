<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="bg-dark text-white">
    <div class="container py-4">
        <div class="row py-5">
            <div class="col-md-4 mb-3 mb-md-0">
                <h6 class="text-uppercase mb-3">Dịch Vụ</h6>
                <ul class="list-unstyled mb-0">
                    <li><a class="footer-link" href="#!">Trợ Giúp &amp; Liên Hệ</a></li>
                    <li><a class="footer-link" href="#!">Trở Về Trang Chủ</a></li>
                    <li><a class="footer-link" href="#!">Cửa Hàng Trực Tuyến</a></li>
                    <li><a class="footer-link" href="#!">Điều Khoản &amp; Điều Kiện </a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <h6 class="text-uppercase mb-3">Công Ty</h6>
                <ul class="list-unstyled mb-0">
                    <li><a class="footer-link" href="home">Về Công Ty</a></li>
                    <li><a class="footer-link" href="#!">Dịch Vụ</a></li>
                    <li><a class="footer-link" href="#!">Bài đăng gần nhất</a></li>
                    <li><a class="footer-link" href="#!">FAQs</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h6 class="text-uppercase mb-3">Truyền Thông</h6>
                <ul class="list-unstyled mb-0">
                    <!-- <li><a class="footer-link" href="#!"></a></li> -->
                    <li><a class="footer-link" href="#!">Twitter</a></li>
                    <li><a class="footer-link" href="#!">Instagram</a></li>
                    <li><a class="footer-link" href="#!">Facebook</a></li>
                </ul>
            </div>
        </div>
        <div class="border-top pt-4" style="border-color: #1d1d1d !important">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="small text-muted mb-0">&copy; 2022 All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- JavaScript files-->
<script src="${pageContext.request.contextPath}/public/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/public/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/public/vendor/nouislider/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath}/public/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/public/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/front.js"></script>
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
        ajax.onload = function (e) {
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">