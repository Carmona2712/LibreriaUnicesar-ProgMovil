$(document).ready(function () {

    $("#btn_Registrar_Autor").click(function () {
        var nombresAutor = $("#txtNombresAutor").val();
        var apellidosAutor = $("#txtApellidosAutor").val();
        var idAutor = $("#txtIDautor").val();
        $.post('../ServAutor', {
            idAutor: idAutor,
            nombresAutor: nombresAutor,
            apellidosAutor: apellidosAutor,
            accion: 'Registrar'
        }, function (data) {
            if (data === "Error") {
                swal("Se ha producido un error al registrar el autor", "Contacte con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Registro exitoso", "Se ha registrado correctamente el autor", "success");
                } else if (data === "Existe") {
                    swal("El autor a regitrar ya existe", "Intente nuevamente", "warning");
                }
            }

        });
    });

    function LimpiarCampos() {
        $("#txtNombresAutor").val("");
        $("#txtApellidosAutor").val("");
        $("#txtIDautor").val("");
    }


    $("#btn_Editar_Autor").click(function () {
        var nombresAutor = $("#txtNombresAutor").val();
        var apellidosAutor = $("#txtApellidosAutor").val();
        var idAutor = $("#txtIDautor").val();
        $.post('../SrvGestionAutor', {
            idAutor: idAutor,
            nombresAutor: nombresAutor,
            apellidosAutor: apellidosAutor,
            accion: 'Editar'
        }, function (data) {
            if (data === "Error") {
                swal("Se ha producido un error al Actualizar el autor", "Contacte con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Actualización exitosa", "Se ha actualizado correctamente la información del autor", "success");
                }
            }

        });
    });

    $("#btn_Eliminar_Autor").click(function () {
        var nombresAutor = $("#txtNombresAutor").val();
        var apellidosAutor = $("#txtApellidosAutor").val();
        var idAutor = $("#txtIDautor").val();
        $.post('../SrvGestionAutor', {
            idAutor: idAutor,
            nombresAutor: nombresAutor,
            apellidosAutor: apellidosAutor,
            accion: 'Eliminar'
        }, function (data) {
            if (data === "Error") {
                swal("Se ha producido un error al eliminar el autor", "Contacte con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Autor Eliminado Correctamente", "Se ha eliminado correctamente la información del autor", "success");
                }
            }

        });
    });



});
      