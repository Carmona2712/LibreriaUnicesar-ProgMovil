<%-- 
    Document   : Menu Principal
    Created on : 26/06/2019, 02:49:18 AM
    Author     : Ricardo Carmona
--%>

<%@page import="Controladores.CajaJpaController"%>
<%@page import="Entidades.Cliente"%>
<%@page import="Controladores.DetalleVentaJpaController"%>
<%@page import="Entidades.DetalleVenta"%>
<%@page import="Controladores.VentaJpaController"%>
<%@page import="Controladores.LibroJpaController"%>
<%@page import="Controladores.ClienteJpaController"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Entidades.Administrador"%>
<%@page import="Entidades.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misession = request.getSession();
    Administrador a;
    a = (Administrador) misession.getAttribute("user");
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int mes = cal.get(Calendar.MONTH) + 1;
    int dia = cal.get(Calendar.DAY_OF_MONTH);
    DecimalFormat decf = new DecimalFormat("###,###.###");
    ClienteJpaController cc = new ClienteJpaController();
    LibroJpaController cl = new LibroJpaController();
    VentaJpaController cv = new VentaJpaController();
    DetalleVentaJpaController cdv = new DetalleVentaJpaController();
    CajaJpaController caja = new CajaJpaController();
    if (a != null) {
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
        <link href="../assets/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/node_modules/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/node_modules/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
        <!-- Page plugins css -->
        <link href="../assets/node_modules/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
        <!-- chartist CSS -->
        <link href="../assets/node_modules/chartist-js/dist/chartist.min.css" rel="stylesheet">
        <link href="../assets/node_modules/chartist-js/dist/chartist-init.css" rel="stylesheet">
        <link href="../assets/node_modules/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
        <link href="../assets/node_modules/css-chart/css-chart.css" rel="stylesheet">
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
                        <a class="navbar-brand" href="Menu Principal.jsp">
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
                                <img src="../images/Unicesar/logo_unicesar_Texto.png" height="28" width="152" alt="homepage" class="dark-logo" /> 
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
                                    <li><a href="Registro Libros.jsp">Registrar Libro</a></li>
                                    <li><a href="Lista Libros.jsp">Listado de Libros</a></li>
                                    <li><a href="Registrar Autor.jsp">Registrar Autor</a></li>
                                    <li><a href="Lista Autores.jsp">Listado de Autores</a></li>
                                    <li><a href="Registrar Editorial.jsp">Registrar Editorial</a></li>
                                    <li><a href="Lista Editoriales.jsp">Listado de Editoriales</a></li>
                                </ul>
                            </li>
                            <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-cart-plus"></i><span class="hide-menu">Abastecimiento</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="Abastecimiento.jsp">Nuevo Abastecimiento</a></li>
                                    <li><a href="Lista Abastecimientos.jsp">Historial Abastecimientos</a></li>             
                                </ul>
                            </li>

                            <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-money"></i><span class="hide-menu">Nueva Venta</span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="Registro Venta.jsp">Nueva Venta</a></li>
                                    <li><a href="Lista Ventas.jsp">Historial de Ventas</a></li>
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
            <div class="page-wrapper" style="background-color: white">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid" style="background-color: white;font-family: sans-serif;font-size: 18px">
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
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <div class="row p-t-10 p-b-10">
                                        <!-- Column -->
                                        <div class="col p-r-0">
                                            <h1 class="font-bold"><% out.print(cc.getClienteCount()); %></h1>
                                            <h6 class="text-muted" style="font-weight: bold;color: black">Clientes Actuales</h6>
                                        </div>
                                        <!-- Column -->
                                        <div class="col text-right align-self-center">
                                            <div data-label="100%" class="css-bar m-b-0 css-bar-primary css-bar-20"><i class="mdi mdi-account-circle"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <div class="row p-t-10 p-b-10">
                                        <!-- Column -->
                                        <div class="col p-r-0">
                                            <h1 class="font-bold"><% out.print(cv.getVentaCount()); %></h1>
                                            <h6 class="text-muted" style="font-weight: bold;color: black">Total Ventas</h6></div>
                                        <!-- Column -->
                                        <div class="col text-right align-self-center">
                                            <div data-label="100%" class="css-bar m-b-0 css-bar-primary css-bar-20"><i class="fa fa-money"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <h5 class="card-title" style="font-weight: bold;color: black">Ventas Mes Actual (<% out.print(cv.RetornarMes(mes)); %>)</h5>
                                    <div class="text-right"> <span class="text-muted">Total entradas</span>
                                        <h2 class="font-bold"><sup><i class="ti-arrow-up text-success"></i></sup> $<% out.print(decf.format(cv.RetornarGananciasxMes(mes))); %></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <div class="row p-t-10 p-b-10">
                                        <!-- Column -->
                                        <div class="col p-r-0">
                                            <h1 class="font-bold"><% out.print(cv.numeroLibrosVendidos()); %></h1>
                                            <h6 class="text-muted" style="font-weight: bold;color: black">Libros Vendidos</h6></div>
                                        <!-- Column -->
                                        <div class="col text-right align-self-center">
                                            <div data-label="100%" class="css-bar m-b-0 css-bar-primary css-bar-20"><i class="fa fa-book"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <div class="row p-t-10 p-b-10">
                                        <!-- Column -->
                                        <div class="col p-r-0">
                                            <h3 class="font-light"><% out.print(cdv.CantidadVecesVendidaLibro(cdv.LibroMasVendido().getCodigo()) + " Veces"); %></h3>
                                            <h6 class="text-muted" style="font-weight: bold;color: black">Libro mas Vendido</h6>
                                        </div>
                                        <!-- Column -->
                                        <div class="col text-right align-self-center">
                                            <% String img = new String(cdv.LibroMasVendido().getImagen(), "utf-8"); %>
                                            <img src="<% out.print(img); %>" height="50" width="67">
                                            <h6 style="margin-top: 5px" class="font-light"><% out.print(cdv.LibroMasVendido().getNombre()); %></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <div class="row">
                                        <!-- Column -->
                                        <div class="col-12">
                                            <h5 class="font-light">Mejor Cliente</h5>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-12"> 
                                            <% Cliente c = cv.MejorCliente(); %>
                                            <h2 style="margin-top: 10px" class="font-light"><% out.print(c.getNombres() + " " + c.getApellidos()); %></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body" style="border: 1px solid black">
                                    <h4 class="card-title" style="font-weight: bold;color: black">Saldo en Caja</h4>
                                    <div class="text-right"> <span class="text-muted">Total Saldo</span>
                                        <h2 class="font-bold"><sup><i class="fa fa-money text-success"></i></sup> $<% out.print(decf.format(caja.findCaja(1).getSaldo())); %></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="border: 1px solid black">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Estadisticas de Ventas Anuales (<% out.print(year); %>)</h4>
                                <div id="bar-chart" style="width:100%; height:400px;"></div>
                            </div>
                        </div>
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
            <!-- This page plugins -->
            <!-- ============================================================== -->
            <!-- Chart JS -->
            <script src="../assets/node_modules/echarts/echarts-all.js"></script>
            <script src="../assets/node_modules/echarts/echarts-init.js"></script>
            <!-- ============================================================== -->
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
                    $('#tabla-Editoriales').DataTable({
                        "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "Todo"]],
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

                    $('#Tabla-Autores').DataTable({
                        "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "Todo"]],
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
            <script>
                // ============================================================== 
                // Bar chart option
                // ============================================================== 
                var myChart = echarts.init(document.getElementById('bar-chart'));

                // specify chart configuration item and data
                option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['Representación de Ventas $']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    color: ["#30A048"],
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            data: ['Eneero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: 'Ventas',
                            type: 'bar',
                            data: [
                                <% for (int i=1;i<=12;i++){ 
                                  if(i==12){
                                      out.print(cv.RetornarGananciasxMes(i));
                                  }else{
                                      out.print(cv.RetornarGananciasxMes(i)+","); 
                                  }                             
                                 } %>                    
                                 ],
                            markPoint: {
                                data: [
                                    {type: 'max', name: 'Max'},
                                    {type: 'min', name: 'Min'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: 'Average'}
                                ]
                            }
                        }

                    ]
                };


                // use configuration item and data specified to show chart
                myChart.setOption(option, true), $(function () {
                    function resize() {
                        setTimeout(function () {
                            myChart.resize()
                        }, 100)
                    }
                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });
            </script>
    </body>

</html>
<% } else{%>

<% if (a == null) { %>
<script>
    window.location.replace("../pages-login.html");
</script>
<% } %>

<% }%>
