package com.wepr.watchshop.controller.admin;

import com.wepr.watchshop.dao.OrderDAO;
import com.wepr.watchshop.dao.ProductDAO;
import com.wepr.watchshop.model.Order;
import com.wepr.watchshop.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "RevenueManagementServlet", value = "/revenue")
public class RevenueManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/revenueManagement.jsp";
        String action = request.getParameter("action");
        OrderDAO orderDAO = new OrderDAO();
        String page = request.getParameter("page");

        if(page == null)
            page = "1";

        int paging = Integer.parseInt(page);
        request.setAttribute("page", paging);

        //8 lines per page
        List<Order> orders = orderDAO.getAllOrderPaging(paging,8);
        request.setAttribute("ordersList", orders);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/revenueManagement.jsp";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        OrderDAO orderDAO = new OrderDAO();
        String page = request.getParameter("page");

        if(page == null)
            page = "1";

        int paging = Integer.parseInt(page);
        request.setAttribute("page", paging);


        //8 lines per page
        List<Order> orders = null;
        try {
            orders = orderDAO.getAllOrderPagingByDateTime(paging, 8, fromDate, toDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("ordersList", orders);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }
}
