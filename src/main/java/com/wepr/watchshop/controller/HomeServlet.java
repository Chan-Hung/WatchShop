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

@WebServlet(name = "HomeServlet", urlPatterns ={"","/home"})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/index.jsp";
        ProductDAO productDAO = new ProductDAO();

        //Show products from Citizen brand
        List<Product> citizenProducts;
        citizenProducts = productDAO.getProductsFromBrand("Citizen");
        //Set request for citizen products
        request.setAttribute("citizenProducts", citizenProducts);


        //Show products from Casio brand
        List<Product> casioProducts;
        casioProducts = productDAO.getProductsFromBrand("Casio");
        //Set request for citizen products
        request.setAttribute("casioProducts", casioProducts);

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);
    }
}
