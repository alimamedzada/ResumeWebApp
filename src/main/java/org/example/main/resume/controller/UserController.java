package org.example.main.resume.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.inter.UserDaoInter;
import org.example.entity.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.example.main.Context;

@WebServlet(name = "UserController", urlPatterns = {"/users"})
public class UserController extends HttpServlet {

    private UserDaoInter userDao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        List<User> us = new ArrayList<>();
        List<User> list = userDao.getAll();
        if ((name == null || name.isEmpty()) && (surname == null || surname.isEmpty())) {
            us = list;
        } else {
            for (User users : list) {
                if (users.getName().equals(name) && users.getSurname().equals(surname)) {
                    us.add(users);
                }
            }
        }
        request.setAttribute("foundUsers", us);
        request.getRequestDispatcher("/users.jsp").forward(request, response);
    }
}
