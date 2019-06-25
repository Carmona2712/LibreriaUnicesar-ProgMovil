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

    $(".addCliente2").on("click", ".activeAccount", function () {
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
        $("#tablaClientes").dataTable().fnDestroy();
        $("#cuerpoTabla-Cliente").html(data);
        var newtable = $("#tablaClientes").DataTable({
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
            "fnDrawCallback": function (oSettings) {
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
            },
        });
        newtable.draw();
    });
}

function LimpiarCampos() {
    $("#txtIdentificacionCliente_Modal").val("");
    $("#txtNombresCliente_Modal").val("");
    $("#txtApellidosCliente_Modal").val("");
    $("#txtEmailCliente_Modal").val("");
}

function CalcularValorPagar() {

}

function AgregarCliente() {
    var cliente = new Array();
    var i = 0;
    $(this).parents("tr").find("td").each(function () {
        cliente[i] = $(this).html();
        i++;
    });
    alert("Id Cliente : " + cliente[0]);
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
}