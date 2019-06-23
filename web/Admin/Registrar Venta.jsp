<%-- 
    Document   : Registrar Venta
    Created on : 21/06/2019, 08:14:41 PM
    Author     : Ricardo Carmona
--%>


<%@page import="Controladores.LibroJpaController"%>
<%@page import="java.util.Calendar"%>
<%@page import="Entidades.Libro"%>
<%@page import="Entidades.Administrador"%>
<%
    LibroJpaController cl = new LibroJpaController();
    HttpSession misession = request.getSession();
    Administrador a;
    a = (Administrador) misession.getAttribute("user");
    if (a != null) {
        Calendar cal2 = Calendar.getInstance();
        String mes = String.valueOf((cal2.get(Calendar.MONTH) + 1));
        if (Integer.parseInt(mes) < 10) {
            mes = "0" + mes;
        }
        String fecha2 = cal2.get(Calendar.YEAR) + "-" + mes + "-" + cal2.get(Calendar.DAY_OF_MONTH);
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

    <body class="fix-header card-no-border fix-sidebar" style="font-family: sans-serif;font-size: 18px">
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
                                                    <h4>Administrador</h4>
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
                                    <h4 class="m-b-0 text-white" style="font-weight: bold">Registrar Transacción de Venta</h4>
                                </div>
                                <form action="#">
                                    <div class="form-body">
                                        <div class="row p-t-20">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Código Factura</label>
                                                    <input type="hidden" id="idAdmin" value="<% out.print(a.getUsuario()); %>" />
                                                    <input type="text" id="txtCodigoFactura" class="form-control" disabled="" placeholder="Código Factura">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Fecha Venta</label>
                                                    <input type="text" id="txtFechaVenta" value="<% out.print(fecha2); %>" class="form-control" disabled="" placeholder="Fecha de Venta">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Atendido por</label>
                                                    <input type="text" value="<% out.print(a.getUsuario()); %>" class="form-control" disabled="" id="txtAtendidoPor">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>ID Cliente</label>
                                                    <input type="text" disabled="" placeholder="ID Cliente" id="txtIdCliente" class="form-control">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label class="control-label">Nombres</label>
                                                    <input disabled="" type="text" id="txtNombresCliente" class="form-control" placeholder="Nombres Cliente">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label class="control-label">Apellidos</label>
                                                    <input  type="text" id="txtApellidosCliente" class="form-control" disabled="" placeholder="Apellidos Cliente">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">E-mail</label>
                                                    <input  type="text" id="txtEmailCliente"  class="form-control" disabled="" placeholder="E-mail">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">    </label>
                                                    <button type="button" class="btn btn-block" style="background: #30A048;font-weight: bold;color: white;font-family: serif;font-size: 18px;margin-top: 5px" data-toggle="modal" data-toggle="modal" data-target="#ModalSeleccionarLibro"><i class="fa fa-user">   Lista de Clientes</i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/Row-->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label style="font-weight: bold; color: #30A048;">TOTAL FACTURA</label>
                                                <div class="input-group">   
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroup-sizing-default">$</span>
                                                    </div>
                                                    <input type="number" disabled id="txtTotalVenta"  value="0" class="form-control" min="0" placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                </form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table>
                                                <thead>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Id</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Imagen</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Nombre</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Autor</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Editorial</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Precio</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Cantidad</th>
                                                <th style="background-color: #30A048;font-weight: bold;color: white;text-align: center;vertical-align: middle">Subtotal</th>
                                                </thead>
                                                <tbody id="CuerpoTabla-Venta">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Row -->

                                    <div class="modal fade bs-example-modal-lg" id="ModalSeleccionarLibro" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog  modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myLargeModalLabel">Seleccione el Libro</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row justify-content-center"><h4 style="font-weight: bold;color: #30A048">Lista de Editoriales</h4></div>
                                                    <table  id="tablaLibros"class="table  table-responsive-xl table-responsive-sm">
                                                        <thead>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Imagen</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">ISBN</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Nombre</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Autor</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px;display: none">Fecha Publicación</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Género</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Editorial</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Precio Compra</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">PVP</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Stock</th>
                                                        <th style="background-color: #30A048;font-weight: bolder;color: white;text-align: center;border: white solid 1px;font-size:18px">Seleccionar</th>
                                                        </thead>
                                                        <tbody>
                                                            <% for (Libro l : cl.findLibroEntities()) { %>
                                                            <tr>
                                                                <% String img = new String(l.getImagen(), "utf-8"); %>
                                                                <% Calendar cal = Calendar.getInstance();
                                                                    cal.setTime(l.getFechapublicacion());
                                                                    String fecha = cal.get(Calendar.DAY_OF_MONTH) + " - " + (cal.get(Calendar.MONTH) + 1) + " - " + cal.get(Calendar.YEAR);
                                                                %> 
                                                                <td style="text-align: center;color:black;vertical-align: middle;border-bottom: 1px solid black"><img class="img-biblioteca" src="<% out.print(img);%>" height="75" width="90" /></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getCodigo()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getNombre()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getFkAutor().getNombres() + " " + l.getFkAutor().getApellidos()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;display: none"><% out.print(fecha); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getGenero()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getFkEditorial().getNombre()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getPrecioCompra()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getPrecioVenta()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><% out.print(l.getStock()); %></td>
                                                                <td style="text-align: center;color:black;vertical-align: middle;font-size:18px;border-bottom: 1px solid black"><button class="btn addLibro"  style="background-color: #30A048;color: white;font-weight: bold">Seleccionar</button></td>
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
                                </form> 
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
                        $("#txtFechaAbastecimiento").bootstrapMaterialDatePicker({weekStart: 0, time: false});
                    </script>
                    <script src="../js/AbastecimientoControl.js"></script>
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
                    <script src="../assets/node_modules/datatables/jquery.dataTables.min.js"></script>
                    <!-- start - This is for export functionality only -->
                    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
                    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
                    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
                    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
                    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
                    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
                    <!-- end - This is for export functionality only -->
                    <script>
                        $(function () {
                            var table = $('#tablaLibros').DataTable({
                                "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "All"]],
                                language: {
                                    "sProcessing": "Procesando...",
                                    "sLengthMenu": "Mostrar _MENU_ registros",
                                    "sZeroRecords": "No se encontraron resultados",
                                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                    "sInfoPostFix": "",
                                    "sSearch": "Buscar:",
                                    "sUrl": "",
                                    "sInfoThousands": ",",
                                    "sLoadingRecords": "Cargando...",
                                    "oPaginate": {
                                        "sFirst": "Primero",
                                        "sLast": "Último",
                                        "sNext": "Siguiente",
                                        "sPrevious": "Anterior"
                                    },
                                    "oAria": {
                                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                    },
                                },
                            });
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