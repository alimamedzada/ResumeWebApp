package org.example.main.resume.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.inter.UserDaoInter;
import org.example.entity.User;
import java.io.IOException;
import org.example.main.Context;
import org.example.main.resume.util.ControllerUtil;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private final BCrypt.Verifyer verifyer = BCrypt.verifyer();

    private UserDaoInter userDao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User u = userDao.findByEmail(email);
            if (u == null) {
                throw new IllegalArgumentException("user does not exist!!!");
            }
            BCrypt.Result rs = verifyer.verify(password.toCharArray(), u.getPassword().toCharArray());

            if (!rs.verified) {
                throw new IllegalArgumentException("password is incorrect!!!");
            }
            request.getSession().setAttribute("loggedInUser", u);
            response.sendRedirect("users");
        } catch (Exception ex) {
            ControllerUtil.errorPage(response, ex);
        }
    }
}
