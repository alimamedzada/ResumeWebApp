/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.main.resume.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Asus
 */
@WebFilter(filterName = "JSPFileFilter", urlPatterns = {"*"})
public class SecurityFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("FILTER DEVREDE! URI: " + ((HttpServletRequest) request).getRequestURI());
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;

            if (!req.getRequestURI().contains("/login") && req.getSession().getAttribute("loggedInUser") == null) {
                res.sendRedirect("login");
                return;
            } else {
                chain.doFilter(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
