<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Watchshop | Chi tiết hóa đơn</title>
  <style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
  </style>
  <%@ include file="../common/public/headerLibraryPublic.jsp"%>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/img/favicon2.png">
</head>
<body>
<div align="center">
  <h1 style="margin-top:20px">Thanh toán hoàn tất</h1>
  <h2 style="margin-top:10px">Cảm ơn bạn đã mua sắm tại Watchshop</h2>
  <h3 style="margin-top:10px">Hóa đơn đã được gửi về Email bạn</h3>
  <br/>
  <h2>Chi tiết hóa đơn</h2>
  <table>
    <tr>
      <td><b>Người mua:</b></td>
      <td>${payer.firstName} ${payer.lastName}</td>
    </tr>
    <tr>
      <td><b>Mô tả:</b></td>
      <td>${transaction.description}</td>
    </tr>
    <tr>
      <td><b>Thành tiền:</b></td>
      <td>
        <fmt:setLocale value = "en_US"/>
        <fmt:formatNumber value = "${transaction.amount.details.subtotal}" type = "currency"/>
      </td>
    </tr>
    <tr>
      <td><b>Phí vận chuyển:</b></td>
      <td>
        <fmt:setLocale value = "en_US"/>
        <fmt:formatNumber value = "${transaction.amount.details.shipping}" type = "currency"/>
      </td>
    </tr>
    <tr>
      <td><b>Thuế:</b></td>
      <td>
        <fmt:setLocale value = "en_US"/>
        <fmt:formatNumber value = "${transaction.amount.details.tax}" type = "currency"/>
      </td>
    </tr>
    <tr>
      <td><b>Tổng cộng:</b></td>
      <td>
        <fmt:setLocale value = "en_US"/>
        <fmt:formatNumber value = "${transaction.amount.total}" type = "currency"/>
      </td>
    </tr>
  </table>
  <a style="width:130px" class="btn btn-primary" href="home">Về trang chủ</a>

</div>
</body>
</html>