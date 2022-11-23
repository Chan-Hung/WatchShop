package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
        String rememberMe = request.getParameter("rememberMe");
        UserDAO userDAO = new UserDAO();

        User user = userDAO.findUserByEmail(email);

        boolean isAuthenticated = BCrypt.checkpw(password, user.getPassword());
        if (!isAuthenticated) {
            url = "/public/signin.jsp";
            request.setAttribute("message", "Mật khẩu không chính xác");
        }
        else if (!user.getIsActive()){
            url = "/public/signin.jsp";
            request.setAttribute("message", "Tài khoản chưa xác thực. vui lòng kiểm tra Email");
        }
        else if (user.getIsAdmin())
            url = "/admin/admin.jsp";
        else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            setCookie(response,email,rememberMe);
            loadHomepage(request);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    private static void setCookie(HttpServletResponse response, String email, String rememberMe){
        if (rememberMe != null){
            //Using cookie that stores the user's email to browser
            Cookie c = new Cookie("userEmail", email);
            c.setMaxAge(60 * 60 * 24); // set age to 1 day
            c.setPath("/");                      // allow entire app to access it
            response.addCookie(c);
        }
    }

}
