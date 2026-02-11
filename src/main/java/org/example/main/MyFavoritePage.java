package org.example.main;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.impl.UserDaoImpl;
import org.example.dao.inter.UserDaoInter;
import org.example.entity.User;

import java.io.*;
import java.util.List;

@WebServlet(name = "MyFavoritePage", urlPatterns = "/MyFavoritePage")
public class MyFavoritePage extends HttpServlet {
    private UserDaoInter userDaoInter = new UserDaoImpl();

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String requestStr = getAllDataFromRequest(req);
            System.out.println(requestStr);
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");

            if (name == null || surname == null) {
                System.out.println("Hata: Parametreler gelmedi!");
            }
            User user = new User(0, name, surname, "+994701234567", "ali@gmail.com", null, null, null);
            boolean b = userDaoInter.addUser(user);
            resp.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = resp.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head><title>Servlet Response</title></head>");
                out.println("<body>");
                out.println("userId= " + user.getId() + "<br>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User u = userDaoInter.getById(id);
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");

        User user = new User(0, name, surname, "+994701234567", "ali@gmail.com", null, null, null);
        boolean b = userDaoInter.addUser(user);
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Servlet Response</title></head>");
            out.println("<h1>Hello</h1>");
            out.println("<body>");
            out.println(u + "<br>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public static String getAllDataFromRequest(HttpServletRequest req) throws Exception {
        String body = null;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;
        try {
            InputStream inputStream = req.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            } else {
                stringBuilder.append("");
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
        body = stringBuilder.toString();
        return body;
    }
}
