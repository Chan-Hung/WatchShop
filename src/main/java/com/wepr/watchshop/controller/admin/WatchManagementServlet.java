package com.wepr.watchshop.controller.admin;

import com.wepr.watchshop.dao.ProductDAO;
import com.wepr.watchshop.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TableBasicsServlet", value = "/watch")
public class WatchManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/watchManagement.jsp";

        String action = request.getParameter("action");
        if (action == null) {
            action = "watchManagement";  // default action
        }
        if (action.equals("watchManagement")) {
            url = "/admin/watchManagement.jsp";
            List<Product> products = new ArrayList<>();
            ProductDAO productDAO = new ProductDAO();
            products = productDAO.getAllProduct();
            request.setAttribute("productsList", products);

        } else if (action.equals("addWatch")) {
            url = "/index.jsp";
            String id = request.getParameter("id");
            System.out.println("id" + id);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
