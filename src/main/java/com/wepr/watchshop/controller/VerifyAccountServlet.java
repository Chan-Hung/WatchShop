package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyAccountServlet", value = "/verify")
public class VerifyAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url =null ;
        String verificationCode = request.getParameter("code");
        if (verify(verificationCode)) {
            url = "/public/signin.jsp";
        } else {
            url = "/public/signup.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private Boolean verify(String verificationCode){
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findUserByVerificationCode(verificationCode);
        if (user == null || user.getIsActive()) {
            return false;
        } else {
            user.setVerificationCode(null);
            user.setIsActive(true);
            userDAO.insertUser(user);
            return true;
        }
    }
}
