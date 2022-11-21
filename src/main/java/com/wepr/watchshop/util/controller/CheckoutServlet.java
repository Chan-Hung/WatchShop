package com.wepr.watchshop.util.controller;

import com.paypal.base.rest.PayPalRESTException;
import com.wepr.watchshop.dao.AddressDAO;
import com.wepr.watchshop.dao.ItemDAO;
import com.wepr.watchshop.dao.OrderDAO;
import com.wepr.watchshop.model.*;
import service.PaymentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "CheckoutServlet",urlPatterns={"/checkout"})
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/checkout.jsp";
        getServletContext()
             .getRequestDispatcher(url)
             .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Order order = createOrder(request);
        paypalCheckout(request, response, order);
    }

    private Order createOrder(HttpServletRequest request){
        OrderDAO orderDAO = new OrderDAO();
        ItemDAO itemDAO = new ItemDAO();
        HttpSession session = request.getSession();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        Long shippingFee = (Long) session.getAttribute("shippingFee");


        Cart cart = (Cart) session.getAttribute("cart");

        Order order = new Order();
        order.setFirstName(firstName);
        order.setLastName(lastName);
        order.setPhoneNumber(phoneNumber);
        order.setShippingFee(Long.valueOf(shippingFee));
        order.setItems(cart.getItems());



        //Calculate total of order
        Long total = 0L;
        for (Item item: order.getItems())
            total += item.getAmount();
        total += shippingFee;
        order.setTotal(Long.valueOf(total));
        order.setCreatedAt(LocalDateTime.now());
        AddressDAO addressDAO = new AddressDAO();
        String homeNumber = request.getParameter("homeNumber");
        String district = request.getParameter("district");
        String city = request.getParameter("city");

        User user = (User) session.getAttribute("user");

        Address address = new Address();
        address.setHomeNumber(homeNumber);
        address.setDistrict(district);
        address.setCity(city);
        if(user != null){
            address.setUser(user);
            order.setUser(user);
        }
        addressDAO.insertAddress(address);
        order.setAddress(address);
        orderDAO.insertOrder(order);

        //Insert Item into DB
        for (Item item: order.getItems()){
            Item newItem = new Item();
            newItem.setProduct(item.getProduct());
            newItem.setQuantity(item.getQuantity());
            newItem.setOrder(order);
            newItem.setAmount(item.getAmount());
            itemDAO.insertItem(newItem);
        }

        return order;
    }

    private void paypalCheckout(HttpServletRequest request, HttpServletResponse response, Order order) throws ServletException, IOException {
        try {
            PaymentService paymentServices = new PaymentService();
            String approvalLink = paymentServices.authorizePayment(order);

            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/public/errorpaypal.jsp").forward(request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
