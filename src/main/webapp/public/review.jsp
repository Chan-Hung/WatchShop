<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Watchshop | Xem lại chi tiết giao dịch</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 5px; }
    </style>
    <%@ include file="../common/public/headerLibraryPublic.jsp"%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/img/favicon2.png">
</head>
<body>
<div align="center">
    <h1 style="margin-top:20px">Chi tiết giao dịch</h1>
    <form action="execute_payment" method="post">
        <table>
            <tr>
                <td style="margin-top:20px" colspan="2"><b>Chi tiết giao dịch:</b></td>
                <td>
                    <input type="hidden" name="paymentId" value="${param.paymentId}" />
                    <input type="hidden" name="PayerID" value="${param.PayerID}" />
                </td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td>${transaction.description}</td>
            </tr>
            <tr>
                <td>Thành tiền:</td>
                <td>
                    <fmt:setLocale value = "en_US"/>
                    <fmt:formatNumber value = "${transaction.amount.details.subtotal}" type = "currency"/>
                </td>
            </tr>
            <tr>
                <td>Phí vận chuyển:</td>
                <td>
                    <fmt:setLocale value = "en_US"/>
                    <fmt:formatNumber value = "${transaction.amount.details.shipping}" type = "currency"/>
                </td>
            </tr>
            <tr>
                <td>Thuế:</td>
                <td>
                    <fmt:setLocale value = "en_US"/>
                    <fmt:formatNumber value = "${transaction.amount.details.tax}" type = "currency"/>
                </td>
            </tr>
            <tr>
                <td>Tổng cộng:</td>
                <td>
                    <fmt:setLocale value = "en_US"/>
                    <fmt:formatNumber value = "${transaction.amount.total}" type = "currency"/>
                </td>
            </tr>
            <tr><td><br/></td></tr>
            <tr>
                <td colspan="2"><b>Thông tin người mua:</b></td>
            </tr>
            <tr>
                <td>Họ:</td>
                <td>${payer.firstName}</td>
            </tr>
            <tr>
                <td>Tên:</td>
                <td>${payer.lastName}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${user.email}</td>
            </tr>
            <tr><td><br/></td></tr>
            <tr>
                <td colspan="2"><b>Địa chỉ nhận hàng:</b></td>
            </tr>
            <tr>
                <td>Địa chỉ người nhận:</td>
                <td>${shippingAddress.recipientName}</td>
            </tr>
            <tr>
                <td>Địa chỉ nhà:</td>
                <td>${shippingAddress.line1}</td>
            </tr>
            <tr>
                <td>Quận/Huyện:</td>
                <td>${shippingAddress.city}</td>
            </tr>
            <tr>
                <td>Tỉnh/Thành:</td>
                <td>${shippingAddress.state}</td>
            </tr>
            <tr>
                <td>Mã bưu điện:</td>
                <td>${shippingAddress.postalCode}</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-sm btn-dark" type="submit" value="Thanh toán" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>