$(document).ready(function () {
    
    CargarIdFactura();
    
    $(".addLibroVenta").click(function () {
        var libroVenta = new Array();
        var i = 0;
        var encontro = 0;
        $(this).parents("tr").find("td").each(function () {
            libroVenta[i] = $(this).html();
            i++;
        });

        $(this).parents("tr").find("td").find("input").each(function () {
            libroVenta[12] = $(this).val();
        });

        var datos =
                "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[1] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[0] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[2] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[3] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[6] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[8] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + libroVenta[12] + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'>" + (libroVenta[8] * libroVenta[12]) + "</td>"
                + "<td style='font-size: 18px;vertical-align: middle;text-align: center;color: black;border-bottom: 1px solid black;'><button style='background-color: #30A048;color: #ffffff;' type='button' class='btn btn-success btn-bg  eliminalinea'><span class='fa fa-close'></span></button> </td>";

        $("#CuerpoTabla-Venta tr").each(function () {
            var tds = $(this).find("td");
            if (tds.filter(":eq(0)").text() === libroVenta[1]) {
                encontro = 1;
                ToastMensajeLibroReemplazado();
                $(this).html(datos);
                console.log("Total Pagar : " + CalcularValorPagar);
                var total = CalcularValorPagar();
                $("#txtTotalVenta").val(total);
            }
        });

        if (encontro === 0) {
            ToastMensajeLibroAdd();
            $("#CuerpoTabla-Venta").append("<tr>" + datos + "</tr>");
            console.log("Total Pagar : " + CalcularValorPagar());
            var total = CalcularValorPagar();
            $("#txtTotalVenta").val(total);
        }

    });



});

function CargarIdFactura() {
    $.post('../SrvGestionVenta', {
        accion: "getFactureCode"
    }, function (data) {
        console.log("id Factura : "+data);
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

function CalcularValorPagar() {
    var total_pagar = 0;
    $("#Tabla-Detalle").each(function (el) {
        console.log("el : " + el);
        if (el === 0) {
            total_pagar = total_pagar + parseFloat($(this).text());
        }
    });
    return total_pagar;
}