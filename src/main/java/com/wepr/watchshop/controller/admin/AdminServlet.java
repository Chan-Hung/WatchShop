package com.wepr.watchshop.controller.admin;

import com.wepr.watchshop.dao.OrderDAO;
import com.wepr.watchshop.model.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/admin.jsp";
        OrderDAO orderDAO = new OrderDAO();
        Integer allOrders = orderDAO.getAllOrders();
        Double averageOrderTotal = orderDAO.getAverageOrderTotal();
        List<Order> fiveOrdersRecently = orderDAO.getAllOrderPaging(1,5);

        request.setAttribute("allOrders", allOrders);
        request.setAttribute("averageOrderTotal", averageOrderTotal);
        request.setAttribute("fiveOrdersRecently", fiveOrdersRecently);

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
