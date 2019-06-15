/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.AdministradorJpaController;
import Entidades.Administrador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ricardo Carmona
 */
@WebServlet(name = "SrvLogin", urlPatterns = {"/SrvLogin"})
public class SrvLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/plain");
        PrintWriter pw = response.getWriter();
        Administrador a;
        AdministradorJpaController ca = new AdministradorJpaController();
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        if (ca.getAdminCredencial(user, pass).isEmpty()) {

            pw.write("Invalido");

        } else {
            a = ca.getAdminCredencial(user, pass).get(0);
            HttpSession session = request.getSession();
            session.setAttribute("user", a);
            pw.write("Valido");
        }
    }

}
