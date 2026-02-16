/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.main.resume.util;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Asus
 */
public class ControllerUtil {

    public static void errorPage(HttpServletResponse response, Exception ex) {
        try {
            ex.printStackTrace();
            response.sendRedirect("error?msg=" + ex.getMessage());
        } catch (IOException ex1) {
            System.getLogger(ControllerUtil.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex1);
        }
    }
}
