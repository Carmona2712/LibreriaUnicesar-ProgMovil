/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.AbastecimientoJpaController;
import Entidades.Abastecimiento;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Carmona
 */
@WebServlet(name = "SrvGestionAbastecimiento", urlPatterns = {"/SrvGestionAbastecimiento"})
public class SrvGestionAbastecimiento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("plain/text");
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        AbastecimientoJpaController cab = new AbastecimientoJpaController();
        Abastecimiento ab = null;

    }

}
