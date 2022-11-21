package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignupServlet", value = "/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/signup.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/signin.jsp";

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt());

        User user = new User();
        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(password);
        user.setIsAdmin(false);
        try{
            UserDAO userDAO = new UserDAO();
            userDAO.insertUser(user);
            request.setAttribute("user", user);

        }catch(NullPointerException e){
            e.printStackTrace();
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
