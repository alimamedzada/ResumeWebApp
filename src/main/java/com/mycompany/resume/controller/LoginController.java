package com.mycompany.resume.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.mycompany.dao.inter.UserDaoInter;
import com.mycompany.entity.User;
import com.mycompany.main.Context;
import com.mycompany.resume.util.ControllerUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
	UserDaoInter userDao = Context.instanceUserDao();
	BCrypt.Verifyer verifyer = BCrypt.verifyer();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = userDao.findByEmail(email);
			System.out.println(user.getName());
			if (user == null) {
				throw new IllegalArgumentException("User doesn't exist.");
			}
			BCrypt.Result rs = verifyer.verify(password.toCharArray(), user.getPassword().toCharArray());

			if (!rs.verified) {
				throw new IllegalArgumentException("password is incorrect.");
			}

			request.getSession().setAttribute("loggedInUser", user);
			response.sendRedirect("users");
		} catch (Exception ex) {
			ControllerUtil.errorPage(response, ex);
		}
	}

}
