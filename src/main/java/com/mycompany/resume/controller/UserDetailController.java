package com.mycompany.resume.controller;

import com.mycompany.dao.inter.UserDaoInter;
import com.mycompany.entity.User;
import com.mycompany.main.Context;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "UserDetailController", urlPatterns = {"/userdetail"})
public class UserDetailController extends HttpServlet {
	private UserDaoInter userDao = Context.instanceUserDao();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.valueOf(request.getParameter("id"));

		if (action.equals("update")) {
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String birthdateStr = request.getParameter("birthdate");

			User u = userDao.getById(id);
			u.setName(name);
			u.setSurname(surname);

			u.setEmail(email);
			u.setPhone(phone);
			u.setBirthDate(Date.valueOf(birthdateStr));
			userDao.updateUser(u);
		} else if (action.equals("delete")) {
			userDao.removeUser(id);
		}
		response.sendRedirect("users");
	}

	protected void doGet(javax.servlet.http.HttpServletRequest request,
	                     javax.servlet.http.HttpServletResponse response)
			throws javax.servlet.ServletException, IOException {
		try {
			String userIdStr = request.getParameter("id");
			if (userIdStr == null || userIdStr.trim().isEmpty()) {
				System.out.println("id is not specified!");
			}

			Integer userId = Integer.parseInt(request.getParameter("id"));
			UserDaoInter userDao = Context.instanceUserDao();

			User u = userDao.getById(userId);
			if (u == null) {
				throw new IllegalArgumentException("There is no user with this id!");
			}
			request.setAttribute("user", u);
			request.getRequestDispatcher("userdetail.jsp").forward(request, response);
		} catch (Exception ex) {
			response.sendRedirect("error?msg=" + ex.getMessage());
		}
	}
}
