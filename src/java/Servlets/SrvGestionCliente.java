/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.ClienteJpaController;
import Entidades.Cliente;
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
@WebServlet(name = "SrvGestionCliente", urlPatterns = {"/SrvGestionCliente"})
public class SrvGestionCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("plain/text");
        PrintWriter pw = response.getWriter();
        String accion = request.getParameter("accion");
        ClienteJpaController cc = new ClienteJpaController();
        if (accion.equals("Registrar")) {
            Cliente c = new Cliente();
            c.setId(request.getParameter("idCliente"));
            c.setNombres(request.getParameter("nombresCliente"));
            c.setApellidos(request.getParameter("apellidosCliente"));
            c.setEmail(request.getParameter("emailCliente"));
            try {
                cc.create(c);
                pw.write("Exito");
            } catch (Exception ex) {
                pw.write("Error : " + ex.getMessage());
            }
        }

        if (accion.equals("Listar")) {
            if (cc.findClienteEntities().isEmpty()) {

            } else {
                String retorno = "";
                for (Cliente c : cc.findClienteEntities()) {
                    retorno += "<tr>";
                    retorno += "<td style='text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black'>" + c.getId() + "</td>";
                    retorno += "<td style='text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black'>" + c.getNombres() + "</td>";
                    retorno += "<td style='text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black'>" + c.getApellidos() + "</td>";
                    retorno += "<td style='text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black'>" + c.getEmail() + "</td>";
                    retorno += "<td style='text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black'><button class='btn addCliente'  style='background-color: #30A048;color: white;font-weight: bold'>Seleccionar</button></td>";
                    retorno += "</tr>";
                }
                pw.write(retorno);
            }
        }

    }

}
