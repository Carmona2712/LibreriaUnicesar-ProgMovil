<%-- 
    Document   : Imprimir_Factura
    Created on : 25/06/2019, 11:39:47 PM
    Author     : Ricardo Carmona
--%>



<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="Controladores.VentaJpaController"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Entidades.Venta"%>
<%@page import="Entidades.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misession = (HttpSession) request.getSession();
    Administrador a = (Administrador) misession.getAttribute("user");
    if (a != null) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  try {
                String idVenta = request.getParameter("id");
                Venta v = new Venta();
                VentaJpaController cv = new VentaJpaController();
                DecimalFormat decf = new DecimalFormat("###,###.###");
                v = cv.findVenta(Integer.parseInt(idVenta));
                if (v == null) {
                    System.out.println("Factura nula");
                }
                Connection con = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreriaunicesar","root","");
                File reportFile = new File(application.getRealPath("/Reporte_Venta_Libreria.jasper"));
                Map parametros = new HashMap();
                parametros.put("IdFactura", v.getId());
                parametros.put("Total_Factura", decf.format(v.getTotalventa()));
                parametros.put("pFecha", v.getFechaventa());
                parametros.put("pNombres", v.getFkCliente().getNombres());
                parametros.put("pIdentificacionCliente", v.getFkCliente().getId());
                parametros.put("pApellidosCliente", v.getFkCliente().getApellidos());
                parametros.put("pEmail", v.getFkCliente().getEmail());
                parametros.put("pAdmin", v.getFkAdmin().getUsuario());
                parametros.put("pTotalPagar", decf.format(v.getTotalventa()));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream output = response.getOutputStream();
                response.getOutputStream();
                output.write(bytes, 0, bytes.length);
                output.flush();
                output.close();
                con.close();
            } catch (Exception ex) {
                System.out.print("Error imprimir : " + ex.getMessage());
            }

        %>

    </body>
</html>
<% } else { %> 

<script>

    window.location.replace('../pages-login.html');

</script>


<% }%>