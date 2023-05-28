package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import static com.wepr.watchshop.controller.HomeServlet.loadHomepage;


@WebServlet(name = "UserServlet", value = "/change")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/account.jsp";

        String email = request.getParameter("email");
        User user = new User();

        UserDAO userDAO = new UserDAO();
        user = userDAO.findUserByEmail(email);
        if (user != null)
        {
            String name = request.getParameter("firstName");
            user.setUserName(name);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            setCookie(response, email, "khac");
            loadHomepage(request);
            userDAO.updateUser(user);
            url = "/public/index.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    private static void setCookie(HttpServletResponse response, String email, String rememberMe) {
        if (rememberMe != null) {
            //Using cookie that stores the user's email to browser
            Cookie c = new Cookie("userEmail", email);
            c.setMaxAge(60 * 60 * 24); // set age to 1 day
            c.setPath("/");                      // allow entire app to access it
            response.addCookie(c);
        }
    }
}
