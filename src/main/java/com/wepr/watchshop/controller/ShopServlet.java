package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.ProductDAO;
import com.wepr.watchshop.model.Product;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="ShopServlet",urlPatterns={"/shop"})
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/shop.jsp";

        List<Product> products = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        products = productDAO.getAllProduct();
        for (Product product : products) {
            System.out.println(product);
        }
        request.setAttribute("productsList", products);

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}