$(document).ready(function () {

    $("#btn_Registrar_Libro").click(function () {

        var isbn = $("#txtISBN").val();
        var nombre = $("#txtNombreLibro").val();
        var genero = $("#cboGenero").val();
        var fecha = $("#txtFechaLanzamiento").val();
        var precCompra = $("#txtPrecioCompra").val();
        var precVenta = $("#txtPrecioVenta").val();
        var Stock = $("#txtStock").val();
        var imagen = $("#txtimg64").val();
        var fkEditorial = $("#txtidEditorial").val();
        var fkAutor = $("#txtidAutor").val();
        $.post('../SrvGestionLibros', {
            isbn: isbn,
            nombrelibro: nombre,
            genero: genero,
            fechalanz: fecha,
            idEditorial: fkEditorial,
            idAutor: fkAutor,
            precCompra: precCompra,
            precVenta: precVenta,
            stock:Stock,
            imagen: imagen,
            accion: 'Registrar'
        }, function (data) {
            console.log("Retorno data : " + data);
            if (data === "Error") {
                swal("Se ha presentado un error.", "Contactar con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Exito al registrar !!", "Se ha registrado exitosamente el libro.", "success");
                } else {

                }

            }

        });

    });



    $(".addAutor").click(function () {
        var campos = new Array();
        i = 0;
        $(this).parents("tr").find("td").each(function () {
            campos[i] = $(this).html();
            i++;
        });
        console.log("ID Enviado : " + campos[0]);
        $("#txtidAutor").val(campos[0]);
        $.post('../SrvGestionAutor', {idAutor: campos[0], accion: 'getAutor'}, function (data) {
            console.log("Retorno data Nombre executivo : " + data);
            if (data === "ERROR") {
                console.log("Error al Seleccionar Autor");
            } else {
                console.log("correcto _ añadido Autor");
                $("#txt_nombreAutor").val(data);
                $.toast({
                    heading: 'Autor Añadido',
                    text: 'Se ha añadido correctamente el autor',
                    position: 'top-right',
                    loaderBg: '#ff6849',
                    icon: 'success',
                    hideAfter: 3500,
                    stack: 6
                });
            }
        });
    });


    $(".addEditorial").click(function () {
        var campos = new Array();
        i = 0;
        $(this).parents("tr").find("td").each(function () {
            campos[i] = $(this).html();
            i++;
        });
        console.log("ID Enviado : " + campos[0]);
        $("#txtidEditorial").val(campos[0]);
        $.post('../SrvGestionEditorial', {idEditorial: campos[0], accion: 'getEditorial'}, function (data) {
            console.log("Retorno data Nombre Editorial : " + data);
            if (data === "ERROR") {
                console.log("Error al Seleccionar Editorial");
            } else {
                console.log("correcto _ añadido Editorial");
                $("#txt_nombreEditorial").val(data);
                $.toast({
                    heading: 'Editorial Añadida',
                    text: 'Se ha añadido correctamente la editorial',
                    position: 'top-right',
                    loaderBg: '#ff6849',
                    icon: 'success',
                    hideAfter: 3500,
                    stack: 6
                });
            }
        });
    });


    function LimpiarCampos() {
        $("#txtISBN").val("");
        $("#txtNombreLibro").val("");
        $("#cboGenero").val("");
        $("#txtFechaLanzamiento").val("");
        $("#txt_nombreAutor").val("");
        $("#txt_nombreEditorial").val("");
        $("#txtPrecioCompra").val("");
        $("#txtPrecioVenta").val("");
        $("#txtStock").val("0");
        $("#txtimg64").val("");
        $("#ImgLibro").prop("src", "../images/Libros/libro_en_Blanco.jpg");
    }



    $("#btn_Editar_Libro").click(function () {

        var isbn = $("#txtISBN").val();
        var nombre = $("#txtNombreLibro").val();
        var genero = $("#cboGenero").val();
        var fecha = $("#txtFechaLanzamiento").val();
        var precCompra = $("#txtPrecioCompra").val();
        var precVenta = $("#txtPrecioVenta").val();
        var Stock = $("#txtStock").val();
        var imagen = $("#txtimg64").val();
        var fkEditorial = $("#txtidEditorial").val();
        var fkAutor = $("#txtidAutor").val();
        $.post('../SrvGestionLibros', {
            isbn: isbn,
            nombrelibro: nombre,
            genero: genero,
            fechalanz: fecha,
            idEditorial: fkEditorial,
            idAutor: fkAutor,
            precCompra: precCompra,
            precVenta: precVenta,
            stock:Stock,
            imagen: imagen,
            accion: 'Editar',
        }, function (data) {
            console.log("Retorno data : " + data);
            if (data === "Error") {
                swal("Se ha presentado un error.", "Contactar con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Exito al Modificar Libro !!", "Se ha actualizado correctamente la información del libro.", "success");
                } else {
                    if (data === "Existe") {
                        swal("El libro a ingresar ya existe !!", "Pruebe a ingresar otro código.", "success");
                    }
                }
            }

        });

    });


    $("#btn_Eliminar_Libro").click(function () {
        var isbn = $("#txtISBN").val();
        var nombre = $("#txtNombreLibro").val();
        var genero = $("#cboGenero").val('Romance');
        var fecha = $("#txtFechaLanzamiento").val();
        var precCompra = $("#txtPrecioCompra").val();
        var precVenta = $("#txtPrecioVenta").val();
        var Stock = $("#txtStock").val();
        var imagen = $("#txtimg64").val();
        var fkEditorial = $("#txtidEditorial").val();
        var fkAutor = $("#txtidAutor").val();
        $.post('../SrvGestionLibros', {
            isbn: isbn,
            nombrelibro: nombre,
            genero: genero,
            fechalanz: fecha,
            idEditorial: fkEditorial,
            idAutor: fkAutor,
            precCompra: precCompra,
            precVenta: precVenta,
            stock:Stock,
            imagen: imagen,
            accion: 'Eliminar',
        }, function (data) {
            console.log("Retorno data : " + data);
            if (data === "Error") {
                swal("Se ha presentado un error.", "Contactar con soporte", "error");
            } else {
                if (data === "Exito") {
                    LimpiarCampos();
                    swal("Exito al Eliminar Libro !!", "Se ha eliminado la información del libro correctamente.", "success");
                } else {
                    if (data === "Inexistente") {
                        swal("El libro a eliminar no existe o ya fue eliminado !!", "Verifique e intente nuevamente", "error");
                    }
                }
            }

        });
    });



});
