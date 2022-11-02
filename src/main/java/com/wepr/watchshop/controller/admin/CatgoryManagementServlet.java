package com.wepr.watchshop.controller.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CatgoryManagementServlet", value = "/category")
public class CatgoryManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/categoryManagement.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
