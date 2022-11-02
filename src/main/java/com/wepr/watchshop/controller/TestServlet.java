package com.wepr.watchshop.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TestServlet", value = "/test")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/signin.jsp";
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action.equals("checkUser")) {
            System.out.println(id);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);
    }
}
