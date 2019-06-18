<%-- 
    Document   : Eliminar Libro
    Created on : 14/06/2019, 01:55:35 AM
    Author     : Ricardo Carmona
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Controladores.LibroJpaController"%>
<%@page import="Entidades.Libro"%>
<%@page import="Entidades.Autor"%>
<%@page import="Controladores.AutorJpaController"%>
<%@page import="Entidades.Editorial"%>
<%@page import="Controladores.EditorialJpaController"%>
<%@page import="Entidades.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    HttpSession misession = request.getSession();
    Administrador a;
    a = (Administrador) misession.getAttribute("user");
    String libroId = request.getParameter("id");
    Libro l;
    LibroJpaController cl = new LibroJpaController();
    l = cl.findLibro(libroId);
    DecimalFormat decf = new DecimalFormat("###,###.###");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
    if (a != null && l != null) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(l.getFechapublicacion());
        String fecha = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="../images/Unicesar/logo_unicesar_Favicon.png">
        <title>Libreria UNICESAR</title>
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="../assets/node_modules/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/node_modules/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
        <!-- Page plugins css -->
        <link href="../assets/node_modules/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
        <!-- Color picker plugins css -->
        <link href="../assets/node_modules/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
        <!-- Date picker plugins css -->
        <link href="../assets/node_modules/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker plugins css -->
        <link href="../assets/node_modules/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
        <link href="../assets/node_modules/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <!-- toast CSS -->
        <link href="../assets/node_modules/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../css/style.css" rel="stylesheet">
        <!-- You can change the theme colors from here -->
        <link href="../css/colors/default.css" id="theme" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>

    <body class="fix-header card-no-border fix-sidebar" style="font-family: sans-serif">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">Libreria UNICESAR</p>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-light">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">
                            <!-- Logo icon --><b>
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="../images/Unicesar/logo_unicesar.png" height="42" width="50" alt="homepage" class="light-logo-Logo"/>
                                <!-- Light Logo icon -->
                                <!-- <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" /> -->
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text --><span>
                                <!-- dark Logo text -->
                                <img src="../images/Unicesar/logo_unicesar_Texto.png" height="24" width="125" alt="homepage" class="dark-logo" /> 
                                <!-- Light Logo text -->    
                                <!-- <img src="../assets/images/LIRA/LOGO_LIRA.png" height="150" width="80" alt="homepage" class="light-logo" /> -->
                                <!-- <img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" />--></span> </a> 
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse">
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav mr-auto">
                            <!-- This is  -->
                            <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up waves-effect waves-dark" href="javascript:void(0)"><i class="sl-icon-menu"></i></a> </li>
                            <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down waves-effect waves-dark" href="javascript:void(0)"><i class="sl-icon-menu"></i></a> </li>
                            <!-- ============================================================== -->
                            <!-- Search -->
                            <!-- ============================================================== -->

                        </ul>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav my-lg-0">
                            <!-- ============================================================== -->
                            <!-- Comment -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- End Comment -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- Messages -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- End Messages -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- mega menu -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- End mega menu -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- Language -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- Profile -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown u-pro">
                                <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/users/1.jpg" alt="user" class="" /> <span class="hidden-md-down"><% out.print(a.getUsuario()); %> &nbsp;<i class="fa fa-angle-down"></i></span> </a>
                                <div class="dropdown-menu dropdown-menu-right animated flipInY">
                                    <ul class="dropdown-user">
                                        <li>
                                            <div class="dw-user-box">
                                                <div class="u-img"><img src="../assets/images/users/1.jpg" alt="user"></div>
                                                <div class="u-text">
                                                    <h4><% out.print(a.getUsuario()); %></h4>
                                                    <p class="text-muted"><% out.print(a.getEmail()); %></p></div>
                                            </div>
                                        </li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#"><i class="ti-user"></i> Mi perfil</a></li>
                                        <li><a href="#"><i class="fa fa-exchange"></i> Cambiar de Usuario</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#"><i class="ti-settings"></i> Cambiar Contraseña</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#"><i class="fa fa-power-off"></i> Cerrar sesión</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">

                            <li><a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-book"></i><span class="hide-menu">Gestión Libros</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="index.html">Registrar Libro</a></li>
                                    <li><a href="index2.html">Listado de Libros</a></li>
                                    <li><a href="index3.html">Registrar Autor</a></li>
                                    <li><a href="index4.html">Listado de Autores</a></li>
                                    <li><a href="index4.html">Registrar Editorial</a></li>
                                    <li><a href="index4.html">Listado de Editoriales</a></li>
                                </ul>
                            </li>
                            <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-cart-plus"></i><span class="hide-menu">Abastecimiento</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="app-calendar.html">Nuevo Abastecimiento</a></li>
                                    <li><a href="app-chat.html">Historial Abastecimientos</a></li>             
                                </ul>
                            </li>

                            <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-money"></i><span class="hide-menu">Nueva Venta</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="form-basic.html">Nueva Venta</a></li>
                                    <li><a href="form-layout.html">Historial de Ventas</a></li>
                                </ul>
                            </li>
                            <li><a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Administrador</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="table-basic.html">Cambiar Contraseña</a></li>
                                </ul>
                            </li>
                            <li><a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-user-times"></i><span class="hide-menu">Sesión</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="widget-data.html">Cerrar Sesión</a></li>                      
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid" style="background-color: white">
                    <!-- ============================================================== -->
                    <!-- Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- End Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- Start Page Content -->
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card-body">
                                <div class="card-header" style="background-color: #30A048;">
                                    <h4 class="m-b-0 text-white" style="font-weight: bold">Eliminar Libro</h4>
                                </div>
                                <form action="#">
                                    <div class="form-body">
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">ISBN</label>
                                                    <input type="text" id="txtISBN" disabled="" value="<% out.print(l.getCodigo()); %>" readonly="" class="form-control" placeholder="ISBN">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre del Libro</label>
                                                    <input type="text" id="txtNombreLibro" disabled="" value="<% out.print(l.getNombre()); %>" class="form-control" placeholder="Nombre del Libro">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cboGenero">Género</label> 
                                                    <select disabled="" id="cboGenero" class="form-control">
                                                        <option selected="" value="<% out.print(l.getGenero()); %>"><% out.print(l.getGenero()); %></option>
                                                        <option value="Romance">Romance</option>
                                                        <option value="Drama">Drama</option>
                                                        <option value="Terror">Terror</option>
                                                        <option value="Ficción">Ficción</option>
                                                        <option value="Historia">Historia</option>
                                                        <option value="Infantil">Infantil</option>
                                                        <option value="Fantasía">Fantasía</option>
                                                        <option value="Novela Negra">Novela Negra</option>
                                                        <option value="Relato Corto">Relato Corto</option>
                                                        <option value="Suspenso">Suspenso</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Fecha Lanzamiento</label>
                                                    <input disabled="" type="text" id="txtFechaLanzamiento" min="0" value="<% out.print(fecha); %>" class="form-control" placeholder="yyyy-mm-dd">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/Row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txt_nombreEditorial">Editorial</label>
                                                <div class="input-group mb-3">
                                                    <input disabled="" type="text" disabled="5" id="txt_nombreEditorial" class="form-control" value="<% out.print(l.getFkEditorial().getNombre()); %>" placeholder="Nombre Editorial" aria-label="" aria-describedby="basic-addon1">
                                                    <input class="form-control"  type="hidden" value="<% out.print(l.getFkEditorial().getId()); %>" id="txtidEditorial">
                                                    <div class="input-group-append">
                                                        <button disabled="" class="btn" style="background-color: #30A048;color: #ffffff" data-toggle="modal" data-toggle="modal" data-target="#ModalEditorial" type="button">Seleccionar Editorial</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Spam -->
                                            <div class="col-md-6">
                                                <label for="txt_nombreAutor">Autor</label>
                                                <div class="input-group mb-3">
                                                    <input disabled="" type="text" disabled="5" id="txt_nombreAutor" class="form-control" value="<% out.print(l.getFkAutor().getApellidos() + ", " + l.getFkAutor().getNombres()); %>" placeholder="Nombre del Autor" aria-label="" aria-describedby="basic-addon1">
                                                    <input disabled="" class="form-control" hidden="" type="text" value="<% out.print(l.getFkAutor().getId()); %>" id="txtidAutor">
                                                    <div class="input-group-append">
                                                        <button disabled="" class="btn" style="background-color: #30A048;color: #ffffff" data-toggle="modal" data-toggle="modal" data-target=".bs-example-modal-lg" type="button">Seleccionar Autor</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Precio de Compra</label>
                                                <input disabled=""  type="text" step="" pattern="[0-9]" id="txtPrecioCompra" class="form-control" value="<% out.print(l.getPrecioCompra()); %>" placeholder="Precio de Compra">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Precio de Venta</label>
                                                <input type="text" disabled="" id="txtPrecioVenta" pattern="[0-9]" value="<% out.print(l.getPrecioVenta()); %>" class="form-control" placeholder="Precio de Venta">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Stock</label>
                                                <input type="number" value="<% out.print(l.getStock()); %>" disabled="" id="txtStock" class="form-control" placeholder="Stock">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Row -->
                                    <div class="row justify-content-center">
                                        <div class="col-md-4 justify-content-center">
                                            <% String img = new String(l.getImagen(), "utf-8"); %>
                                            <% if (l.getImagen().length == 0) { %>
                                            <img id="ImgLibro" src="../images/Libros/libro_en_Blanco.jpg" height="220" width="220" alt="Libro Ejemplo">
                                            <% } else { %>
                                            <img id="ImgLibro" src="<% out.print(img); %>" height="220" width="220" alt="Libro Ejemplo">
                                            <% } %>
                                            <input id="txtimg64" value="<% out.print(img); %>" type="hidden"/>
                                            <div style="margin-top: 3%">
                                                <input type="file" disabled="" id="btn_subir_Imagen"  class="form-control-file" accept="image/*" />
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" id="btn_Eliminar_Libro" class="btn btn-md btn-block" style="background:#30A048;color: white;font-weight: bolder;margin-top:4%"><i class="fa fa-recycle"></i> Eliminar Libro</button>
                                </form>
                            </div>
                        </div>

                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog  modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">Seleccione el Autor</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center"><h4 style="font-weight: bold;color: #30A048">Lista de Autores</h4></div>


                                        <table class="table table-responsive-xl table-bordered table-striped">
                                            <thead>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Id</th>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Nombres</th>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Apellidos</th>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Seleccionar</th>
                                            </thead>
                                            <tbody>
                                                <% AutorJpaController ca = new AutorJpaController(); %>
                                                <% for (Autor au : ca.findAutorEntities()) { %>
                                                <tr>
                                                    <td style="color: black;text-align: center;vertical-align: middle"><% out.print(au.getId()); %></td>
                                                    <td style="color: black;text-align: center;vertical-align: middle"><% out.print(au.getNombres().toUpperCase()); %></td>
                                                    <td style="color: black;text-align: center;vertical-align: middle"><% out.print(au.getApellidos().toUpperCase()); %></td>
                                                    <td class="justify-content-center" style="text-align: center;vertical-align: middle"><button style="background-color: #30A048;font-weight: bolder;color: white" class="addAutor btn">Seleccionar</button></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <div class="modal fade bs-example-modal-lg" id="ModalEditorial" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog  modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLargeModalLabel">Seleccione la Editorial</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center"><h4 style="font-weight: bold;color: #30A048">Lista de Editoriales</h4></div>


                                        <table class="table table-responsive-xl table-bordered table-striped">
                                            <thead>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Id</th>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Editorial</th>
                                            <th style="background-color: #30A048;color: white;font-weight: bold;border: 1px solid white;text-align: center">Seleccionar</th>
                                            </thead>
                                            <tbody>
                                                <% EditorialJpaController ce = new EditorialJpaController(); %>
                                                <% for (Editorial e : ce.findEditorialEntities()) { %>
                                                <tr>
                                                    <td style="color: black;text-align: center;vertical-align: middle"><% out.print(e.getId()); %></td>
                                                    <td style="color: black;text-align: center;vertical-align: middle"><% out.print(e.getNombre().toUpperCase()); %></td>
                                                    <td class="justify-content-center" style="text-align: center;vertical-align: middle"><button style="background-color: #30A048;font-weight: bolder;color: white" class="addEditorial btn">Seleccionar</button></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>                    
                        <!-- End PAge Content -->
                    </div>
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->

                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->
                    <footer class="footer row justify-content-center" style="color: #30A048; font-weight: bold">
                        Libreria UNICESAR © 2019 Todos los derechos reservados.
                    </footer>
                    <!-- ============================================================== -->
                    <!-- End footer -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- End Page wrapper  -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Wrapper -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- All Jquery -->
            <!-- ============================================================== -->
            <script src="../assets/node_modules/jquery/jquery.min.js"></script>
            <!-- Bootstrap tether Core JavaScript -->
            <script src="../assets/node_modules/bootstrap/js/popper.min.js"></script>
            <script src="../assets/node_modules/bootstrap/js/bootstrap.min.js"></script>
            <!-- slimscrollbar scrollbar JavaScript -->
            <script src="../assets/node_modules/ps/perfect-scrollbar.jquery.min.js"></script>
            <!--Wave Effects -->
            <script src="../js/waves.js"></script>
            <!--Menu sidebar -->
            <script src="../js/sidebarmenu.js"></script>
            <!--stickey kit -->
            <script src="../assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
            <script src="../assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
            <!--Custom JavaScript -->
            <script src="../js/custom.min.js"></script>
            <script src="../assets/node_modules/sweetalert/sweetalert.min.js"></script>
            <script src="../assets/node_modules/toast-master/js/jquery.toast.js"></script>
            <script src="../js/toastr.js"></script>
            <!-- ============================================================== -->
            <!-- Style switcher -->
            <!-- ============================================================== -->
            <script src="../assets/node_modules/styleswitcher/jQuery.style.switcher.js"></script>
            <!-- Plugin JavaScript -->
            <script src="../assets/node_modules/moment/moment.js"></script>
            <script src="../assets/node_modules/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
            <!-- Clock Plugin JavaScript -->
            <script src="../assets/node_modules/clockpicker/dist/jquery-clockpicker.min.js"></script>
            <!-- Color Picker Plugin JavaScript -->
            <script src="../assets/node_modules/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
            <script src="../assets/node_modules/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
            <script src="../assets/node_modules/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
            <!-- Date Picker Plugin JavaScript -->
            <script src="../assets/node_modules/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
            <!-- Date range Plugin JavaScript -->
            <script src="../assets/node_modules/timepicker/bootstrap-timepicker.min.js"></script>
            <script src="../assets/node_modules/bootstrap-daterangepicker/daterangepicker.js"></script>
            <script>
                $("#txtFechaLanzamiento").bootstrapMaterialDatePicker({weekStart: 0, time: false});
            </script>
            <script src="../js/ImgControl.js"></script>
            <script src="../js/BookControl.js"></script>
            <script>
                $(function () {
                    $('#btn_subir_Imagen').change(function (e) {
                        addImage(e);
                    });

                    function addImage(e) {
                        var file = e.target.files[0],
                                imageType = /image.*/;

                        if (!file.type.match(imageType))
                            return;

                        var reader = new FileReader();
                        reader.onload = fileOnload;
                        reader.readAsDataURL(file);
                    }

                    function fileOnload(e) {
                        var result = e.target.result;
                        $('#ImgLibro').attr("src", result);
                    }
                });

            </script>
    </body>

</html>
<% } else{ %>

<% if (a == null) { %>
<script>
    window.location.replace("../pages-login.html");
</script>
<% } %>

<% }%>

