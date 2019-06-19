/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.AbastecimientoJpaController;
import Controladores.LibroJpaController;
import Entidades.Abastecimiento;
import Entidades.Administrador;
import Entidades.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        LibroJpaController cl = new LibroJpaController();
        Abastecimiento ab = new Abastecimiento();
        Libro l;
        Administrador a;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        String accion = request.getParameter("accion");
        if (accion.equals("Registrar")) {
            a = new Administrador();
            l = new Libro();
            a.setUsuario(request.getParameter("idAdmin"));
            try {
                l = cl.findLibro(request.getParameter("idLibro"));
                if (l == null) {
                    System.err.println("Libro es null");
                }else{
                     ab.setFkLibro(l);
                } 
            } catch (Exception ex) {
                System.err.println("Error en el libro : " + ex.getMessage());
            }
            try {
                System.out.println("Fecha recibida : "+request.getParameter("fecha_transaccion"));
                ab.setFecha(sdf.parse(request.getParameter("fecha_transaccion")));
            } catch (ParseException ex) {
                System.err.println("Error al convertir Fecha de transacción");
            }
            if (request.getParameter("cantidad").equals("") || request.getParameter("cantidad") == null) {
                System.out.println("Cantidad Recibida 1 : " + request.getParameter("cantidad"));
                ab.setCantidad(0);
            } else {
                System.out.println("Cantidad Recibida 2 : " + request.getParameter("cantidad"));
                ab.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            }
            ab.setFkAdmin(a);
            ab.setTotal(Float.parseFloat(request.getParameter("valor_total")));
            try {
                cab.create(ab);
                l.setStock((l.getStock()) + ab.getCantidad());
                cl.edit(l);
                pw.write("Exito");
            } catch (Exception ex) {
                System.out.println("Error al Registrar Abastecimiento");
                pw.write("Error");
            }
        }
    }

}
