/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.LibroJpaController;
import Entidades.Autor;
import Entidades.Editorial;
import Entidades.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo Carmona
 */
@WebServlet(name = "SrvGestionLibros", urlPatterns = {"/SrvGestionLibros"})
public class SrvGestionLibros extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("plain/text");
        PrintWriter pw = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        String accion = request.getParameter("accion");
        LibroJpaController cl = new LibroJpaController();
        DecimalFormat decf = new DecimalFormat("###,###.###");
        Libro l = new Libro();
        Autor a = new Autor();
        Editorial e = new Editorial();
        System.err.println("ID Autor recibido : " + request.getParameter("idAutor"));
        a.setId(Integer.parseInt(request.getParameter("idAutor")));
        e.setId(Integer.parseInt(request.getParameter("idEditorial")));
        l.setCodigo(request.getParameter("isbn"));
        l.setNombre(request.getParameter("nombrelibro"));
        l.setGenero(request.getParameter("genero"));
        l.setFkAutor(a);
        l.setFkEditorial(e);
        try {
            l.setFechapublicacion(sdf.parse(request.getParameter("fechalanz")));
        } catch (ParseException ex) {
            System.err.println("Error al convertir Fecha : " + ex.getMessage());
        }
        l.setPrecioCompra(Float.parseFloat(request.getParameter("precCompra")));
        l.setPrecioVenta(Float.parseFloat(request.getParameter("precVenta")));
        l.setStock(Integer.parseInt(request.getParameter("stock")));
        if (request.getParameter("imagen").equals("")) {
            l.setImagen(null);
        } else {
            l.setImagen(request.getParameter("imagen").getBytes());
        }
        
        if (accion.equals("Registrar")) {
            try {
                if (cl.findLibro(l.getCodigo()) != null) {
                    pw.write("Existe");
                } else {
                    cl.create(l);
                    pw.write("Exito");
                }
            } catch (Exception ex) {
                System.err.println("Error al registrar libro : " + ex.getMessage());
                pw.write("Error");
            }
        }
        
        if (accion.equals("Editar")) {
            try {
                cl.edit(l);
                pw.write("Exito");
            } catch (Exception ex) {
                System.err.println("Error al Editar libro : " + ex.getMessage());
                pw.write("Error");
            }
        }
        
        if (accion.equals("Eliminar")) {
            try {
                if (cl.findLibro(l.getCodigo()) == null) {
                    pw.write("Inexistente");
                } else {
                    cl.destroy(l.getCodigo());
                    pw.write("Exito");
                }
            } catch (Exception ex) {
                System.err.println("Error al Editar libro : " + ex.getMessage());
                pw.write("Error");
            }
        }
        
    }
    
}
