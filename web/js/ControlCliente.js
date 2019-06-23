$(document).ready(function () {

    $("#btnRegistrarCliente").click(function () {
        var id = $("#txtIdentificacionCliente_Modal").val();
        var nombresCliente = $("#txtNombresCliente_Modal").val();
        var apellidosCliente = $("#txtApellidosCliente_Modal").val();
        var emailCliente = $("#txtEmailCliente_Modal").val();
        console.log("ID Cliente :" + id);
        console.log("Email : " + emailCliente);
        $.post('../SrvGestionCliente', {
            idCliente: id,
            nombresCliente: nombresCliente,
            apellidosCliente: apellidosCliente,
            emailCliente: emailCliente,
            accion: "Registrar"
        }, function (data) {
            if (data === "Exito") {
                LimpiarCampos();
                ActualizarTablaClientes();
                swal("Registro Exitoso !!!", "Se registro correctamente el cliente", "success");
            } else {
                swal("Error al Registrar", "Error cause : " + data, "error");
            }
        });
    });


    $(".addCliente").click(function () {
        var cliente = new Array();
        var i = 0;
        $(this).parents("tr").find("td").each(function () {
            cliente[i] = $(this).html();
            i++;
        });

        $("#txtIdCliente").val(cliente[0]);
        $("#txtNombresCliente").val(cliente[1]);
        $("#txtApellidosCliente").val(cliente[2]);
        $("#txtEmailCliente").val(cliente[3]);
        $.toast({
            heading: 'Cliente Seleccionado',
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


function ActualizarTablaClientes() {
    var accion = "Listar";
    $.post('../SrvGestionCliente', {
        accion: accion
    }, function (data) {
        $("#cuerpoTabla-Cliente").empty();
        console.log(data);
        $("#cuerpoTabla-Cliente").html(data);
    });
}

function LimpiarCampos() {
    $("#txtIdentificacionCliente_Modal").val("");
    $("#txtNombresCliente_Modal").val("");
    $("#txtApellidosCliente_Modal").val("");
    $("#txtEmailCliente_Modal").val("");
}