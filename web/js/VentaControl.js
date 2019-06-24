$(document).ready(function () {

    $(".addLibroVenta").click(function () {
        var libroVenta = new Array();
        var i = 0;
        $(this).parents("tr").find("td").each(function () {
            if (i == 1) {
                    i++;
            } else {
                libroVenta[i] = $(this).html();
                console.log("Entro al bucle : " + libroVenta[i]);
                i++;
            }

        });

        var datos = "<tr><td style='text-align: center;'>" + libroVenta[0] + "</td>"
                + "<td style='text-align: center;'>" + libroVenta[1] + "</td>"
                + "<td style='text-align: center;'>" + libroVenta[2] + "</td>"
                + "<td style='text-align: center;'>" + libroVenta[3] + "</td>"
                + "<td style='text-align: center;'>" + libroVenta[4] + "</td>"
                + "<td style='text-align: center;'>" + libroVenta[5] + "</td>"
                + "<td style='text-align: center;'>" + (libroVenta[5] * libroVenta[4]) + "</td>"
                + "<td style='text-align: center;'><button style='background-color: #30A048;color: #ffffff;' type='button' class='btn btn-success btn-sm  eliminalinea'><span class='fa fa-close'></span></button> </td>" + "</tr>";

        $("#CuerpoTabla-Venta").append(datos);
        $.toast({
            heading: 'Libro Seleccionado',
            text: 'Se ha seleccionado correctamente el cliente',
            position: 'top-right',
            bgColor: '#30A048',
            loaderBg: '#fffff',
            icon: 'success',
            hideAfter: 3500,
            textColor: 'white',
            stack: 6
        });
    });



});

function CargarIdFactura() {

}