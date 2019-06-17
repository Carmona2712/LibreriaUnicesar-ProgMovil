/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.EditorialJpaController;
import Entidades.Editorial;
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
@WebServlet(name = "SrvGestionEditorial", urlPatterns = {"/SrvGestionEditorial"})
public class SrvGestionEditorial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("plain/text");
        PrintWriter pw = response.getWriter();
        Editorial e;
        EditorialJpaController ce = new EditorialJpaController();
        String accion = request.getParameter("accion");

        if (accion.equals("getEditorial")) {
            String idEditorial = request.getParameter("idEditorial");
            e = ce.findEditorial(Integer.parseInt(idEditorial));
            if (e != null) {
                pw.write(e.getNombre());
            } else {
                pw.write("ERROR");
            }
        }

        if (accion.equals("Registrar")) {
            e = new Editorial();
            e.setNombre(request.getParameter("nombreEditorial"));
            try{
                ce.create(e);
                pw.write("Exito");
            }catch(Exception ex){
                pw.write("Error");
                System.err.println("Error al registrar Editorial : "+ex.getMessage());
            }
        }

    }

}
