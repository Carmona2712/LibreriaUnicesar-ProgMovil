$(document).ready(function () {

    CargarIdFactura();

    $(".addLibroVenta").click(function () {
        var libroVenta = new Array();
        var i = 0;
        var encontro = 0;
        var valor_pagar = 0;
        $(this).parents("tr").find("td").each(function () {
            libroVenta[i] = $(this).html();
            i++;
        });

        $(this).parents("tr").find("td").find("input").each(function () {
            libroVenta[12] = $(this).val();
        });

        if (libroVenta[12] <= 0) {
            swal("Error en la cantidad requerida", "La cantidad requerida es igual o menor a 0", "error");
        } else {
            console.log("libroVenta[12]= " + libroVenta[12] + " > LibroVenta[9] = " + libroVenta[9]);
            if (parseInt(libroVenta[12]) > parseInt(libroVenta[9])) {
                swal("Stock Insuficiente", "La cantidad en stock del libro es inferior a la requerida", "error");
            } else {

                var datos =
                        "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[1] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[0] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[2] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[3] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[6] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[8] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[12] + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + (libroVenta[8] * libroVenta[12]) + "</td>"
                        + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'><button style='background-color: #30A048;color: #ffffff;' type='button' class='btn btn-success btn-bg  eliminarItem'><span class='fa fa-close'></span></button> </td>";
                var valor_pagar = 0;
                $("#CuerpoTabla-Venta tr").each(function () {
                    var tds = $(this).find("td");
                    if (tds.filter(":eq(0)").text() === libroVenta[1]) {
                        encontro = 1;
                        ToastMensajeLibroReemplazado();
                        $(this).html(datos);
                    }
                });

                if (encontro === 0) {
                    ToastMensajeLibroAdd();
                    $("#CuerpoTabla-Venta").append("<tr>" + datos + "</tr>");
                }

                $("#CuerpoTabla-Venta tr").each(function () {
                    var tds = $(this).find("td");
                    valor_pagar += parseFloat(tds.filter(":eq(7)").text());
                });

                $("#txtTotalVenta").val(valor_pagar);
            }

        }


    });



    $("#btn_Registrar_Venta").click(function () {
        var fechaVenta = $("#txtFechaVenta").val();
        var idFactura = $("#txtCodigoFactura").val();
        var total_venta = $("#txtTotalVenta").val();
        var idCliente = $("#txtIdCliente").val();
        var idAdmin = $("#idAdmin").val();
        var erPres = 0;
        $.post('../SrvGestionVenta', {
            fechaVenta: fechaVenta,
            idFactura: idFactura,
            totalVenta: total_venta,
            idCliente: idCliente,
            idAdmin: idAdmin,
            accion: "Registrar"
        }, function (data) {
            if (data === "Exito") {
                $("#CuerpoTabla-Venta tr").each(function () {
                    console.log("Entro a iteración");
                    var tds = $(this).find("td");
                    var idLibro = tds.filter(":eq(0)").text();
                    var cantidad = tds.filter(":eq(6)").text();
                    console.log("idLibro : " + idLibro);
                    console.log("Cantidad : " + cantidad);
                    $.post("../SrvGestionDetalleVenta", {
                        idVenta: idFactura,
                        idLibro: idLibro,
                        cantidad: cantidad,
                        accion: "Registrar"
                    }, function (data) {
                        if (data === "Exito_Detalle") {

                        }
                        if (data === "Error_Detalle") {
                            erPres = 1;
                        }
                    });

                });

                if (erPres === 0) {
                    swal("Correcto !!!", "Se ha realizada correctamente la venta", "success");
                    LimpiarCamposVenta();
                    CargarIdFactura();

                    swal({
                        title: "Se registro Correctamente la factura",
                        text: "Desea imprimir la factura ? !!",
                        type: "success",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        cancelButtonColor: "#DD6B55",
                        confirmButtonText: "Si, deseo imprimirla !!",
                        cancelButtonText: "No, lo hare despues !!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                            function (isConfirm) {
                                if (isConfirm) {
                                   
                                   // window.location.replace("Reportes/Imprimir_Factura.jsp?id="+ idFactura, '_blank');
                                    window.open("Imprimir_Factura.jsp?id=" + idFactura, '_blank');
                                    swal.close();
                                } else {
                                    swal("OK !!", "Todas las facturas se encuentran en listado ventas, puede imprimir la que desee cuando usted quiera !!", "success");
                                }
                            });
                }

            } else {
                swal("Error Al registrar !!!", "Se ha Producido un error al intentar realizar la venta", "error");
            }
        });


    });


    $("#CuerpoTabla-Venta").on('click', '.eliminarItem', function () {
        valor_pagar = 0;
        var seguro = confirm('Confirma que desea eliminar el item ?');
        if (seguro) {
            var numeroFilas = $("#CuerpoTabla-Venta tr").length;
            if (numeroFilas > 0) {
                $(this).closest('tr').remove();
                $("#CuerpoTabla-Venta tr").each(function () {
                    var tds = $(this).find("td");
                    valor_pagar += parseFloat(tds.filter(":eq(7)").text());
                });

                $("#txtTotalVenta").val(valor_pagar);
            }
        }
    });



});

function CargarIdFactura() {
    $.post('../SrvGestionVenta', {
        accion: "getFactureCode"
    }, function (data) {
        console.log("id Factura : " + data);
        $("#txtCodigoFactura").val(data);
    });
}

function ToastMensajeLibroAdd() {
    $.toast({
        heading: 'Libro Seleccionado',
        text: 'Se ha agregado  correctamente el Libro a la lista',
        position: 'top-right',
        bgColor: '#30A048',
        loaderBg: '#fffff',
        icon: 'success',
        hideAfter: 3500,
        textColor: 'white',
        stack: 6
    });
}

function CalcularValorPagar() {
    var totalpago = 0;
    $("#CuerpoTabla-Venta tr").each(function (el) {
        var tds = $(this).find("td");
        totalpago = totalpago + parseFloat(tds.filter(":eq(5)").text());
    });

    return totalpago;
}

function ToastMensajeLibroReemplazado() {
    $.toast({
        heading: 'Libro Seleccionado',
        text: 'Se ha Reemplazado el Libro en la lista',
        position: 'top-right',
        bgColor: '#F5AB0E',
        loaderBg: '#fffff',
        icon: 'warning',
        hideAfter: 3500,
        textColor: 'white',
        stack: 6
    });
}

function LimpiarCamposVenta() {
    $("#txtFechaVenta").val("");
    $("#txtCodigoFactura").val("");
    $("#txtTotalVenta").val("0");
    $("#txtIdCliente").val("");
    $("#idAdmin").val("");
    $("#txtNombresCliente").val("");
    $("#txtApellidosCliente").val("");
    $("#txtEmailCliente").val("");
    LimpiarCuerpoTablaVenta();
}

function LimpiarCuerpoTablaVenta() {
    $("#CuerpoTabla-Venta tr").remove();
}