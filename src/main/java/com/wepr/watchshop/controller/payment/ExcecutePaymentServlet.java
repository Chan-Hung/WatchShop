package com.wepr.watchshop.controller.payment;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;
import com.wepr.watchshop.service.EmailService;
import com.wepr.watchshop.service.PaymentService;
import com.wepr.watchshop.util.CookieUtil;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExcecutePaymentServlet", value = "/execute_payment")
public class ExcecutePaymentServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = System.getenv("SMTP_PASSWORD");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();

        User newUser = (User) session.getAttribute("user");

        try {
            PaymentService paymentServices = new PaymentService();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);

            //Send Email
            EmailService.sendEmail(host, port, user, pass, newUser.getEmail(), "Xác nhận tài khoản của bạn trên Watchshop", EmailService.receiptEmail, newUser, System.getenv("SITE_URL"));
            request.getRequestDispatcher("/public/receipt.jsp").forward(request, response);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/public/errorpaypal.jsp").forward(request, response);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
