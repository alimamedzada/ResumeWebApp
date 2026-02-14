package org.example.main.resume.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.inter.UserDaoInter;
import org.example.entity.User;

import java.io.IOException;
import org.example.main.Context;

@WebServlet(name = "UserDetailController", urlPatterns = {"/userdetail"})
public class UserDetailController extends HttpServlet {

    private UserDaoInter userDaoInter = Context.instanceUserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        Integer id = null;
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                id = Integer.parseInt(idStr);
            } catch (NumberFormatException e) {
                id = null;
            }
        }
        String action = req.getParameter("action");

        if (action.equals("update")) {
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            User user = userDaoInter.getById(id);
            user.setName(name);
            user.setSurname(surname);
            userDaoInter.updateUser(user);
        } else if (action.equals("delete")) {
            userDaoInter.removeUser(id);
        }
        resp.sendRedirect("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isBlank()) {
                throw new IllegalArgumentException("id is not specified!");
            }
            int userId = Integer.parseInt(request.getParameter("id"));

            UserDaoInter userDao = Context.instanceUserDao();
            User u = userDao.getById(userId);

            if (u == null) {
                throw new IllegalArgumentException("There is no user id!");
            }
            request.setAttribute("user", u);
            request.getRequestDispatcher("userdetails.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error?msg=" + ex.getMessage());
        }
    }
}
