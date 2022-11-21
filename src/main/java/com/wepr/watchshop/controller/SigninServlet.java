package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.wepr.watchshop.controller.HomeServlet.loadHomepage;

@WebServlet(name = "SigninServlet", value = "/signin")
public class SigninServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/signin.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/index.jsp";

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.selectUser(email);

        boolean isAuthenticated = BCrypt.checkpw(password, user.getPassword());
        if (!isAuthenticated) {
            url = "/public/signin.jsp";
            System.out.println("wrong password");
        }
        else if (user.getIsAdmin() == true)
            url = "/admin/admin.jsp";
        else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            loadHomepage(request);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }


}
