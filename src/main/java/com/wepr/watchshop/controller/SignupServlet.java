package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.UserDAO;
import com.wepr.watchshop.model.User;
import com.wepr.watchshop.service.EmailService;
import net.bytebuddy.utility.RandomString;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignupServlet", value = "/signup")
public class SignupServlet extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = System.getenv("SMTP_PASSWORD");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/signup.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/public/processregister.jsp";

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");


        String password = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt());

        User newUser = new User();
        newUser.setUserName(userName);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setIsAdmin(false);

        String verificationCode = RandomString.make(30);
        newUser.setVerificationCode(verificationCode);
        newUser.setIsActive(false);

        try{
            UserDAO userDAO = new UserDAO();
            userDAO.insertUser(newUser);
            try {
                String siteURL = getSiteURL(request);
                EmailService.sendEmail(host, port, user, pass, email, "Xác nhận tài khoản của bạn trên Watchshop",
                        EmailService.verifyEmail, newUser, siteURL);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            request.setAttribute("user", newUser);

        }catch(NullPointerException e){
            e.printStackTrace();
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    private String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}
