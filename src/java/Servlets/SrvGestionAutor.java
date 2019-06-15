/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.AutorJpaController;
import Controladores.exceptions.NonexistentEntityException;
import Entidades.Autor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Carmona
 */
@WebServlet(name = "SrvGestionAutor", urlPatterns = {"/SrvGestionAutor"})
public class SrvGestionAutor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("plain/text");
        PrintWriter pw = response.getWriter();
        Autor a;
        AutorJpaController ca = new AutorJpaController();
        String accion = request.getParameter("accion");

        if (accion.equals("getAutor")) {
            String idAutor = request.getParameter("idAutor");
            a = ca.findAutor(Integer.parseInt(idAutor));
            if (a != null) {
                pw.write(a.getApellidos().toUpperCase() + ", " + a.getNombres().toUpperCase());
            } else {
                pw.write("ERROR");
            }
        }

        if (accion.equals("Registrar")) {
            Autor au = new Autor();
            au.setNombres(request.getParameter("nombresAutor"));
            au.setApellidos(request.getParameter("apellidosAutor"));
            try {
                ca.create(au);
                pw.write("Exito");
            } catch (Exception ex) {
                pw.write("Error");
                System.err.println("Error al Registrar Autor " + ex.getMessage());
            }
        }

        if (accion.equals("Editar")) {
            Autor aut;
            aut = ca.findAutor(Integer.parseInt(request.getParameter("idAutor")));
            aut.setApellidos(request.getParameter("apellidosAutor"));
            aut.setNombres(request.getParameter("nombresAutor"));
            try {
                ca.edit(aut);
                pw.write("Exito");
            } catch (NonexistentEntityException ex) {
                pw.write("Error");
                System.err.println("Error al Modificar Autor " + ex.getMessage());
                Logger.getLogger(SrvGestionAutor.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                pw.write("Error");
                System.err.println("Error al Modificar Autor " + ex.getMessage());
                Logger.getLogger(SrvGestionAutor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (accion.equals("Eliminar")) {
           Autor aut;
           aut = ca.findAutor(Integer.parseInt(request.getParameter("idAutor")));
            try {
                ca.destroy(aut.getId());
                pw.write("Exito");
            } catch (Exception ex) {
                pw.write("Error");
                System.err.println("Error al Eliminar Autor " + ex.getMessage());
            }
        }

    }

}
