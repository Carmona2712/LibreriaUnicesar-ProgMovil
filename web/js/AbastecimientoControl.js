$(document).ready(function () {

    $(".addLibro").click(function () {
        var libroSeleccionado = new Array();
        var i = 0;

        $(this).parents('tr').find('td').each(function () {
            libroSeleccionado[i] = $(this).html();
            i++;
        });

        var imagen = libroSeleccionado[0];
        var isbn = libroSeleccionado[1];
        var nombreLibro = libroSeleccionado[2];
        var autor = libroSeleccionado[3];
        var fecha = libroSeleccionado[4];
        var genero = libroSeleccionado[5];
        var editorial = libroSeleccionado[6];
        var precioCompra = libroSeleccionado[7];
        var PrecioVenta = libroSeleccionado[8];
        var stock = libroSeleccionado[9];
        alert('Ha dado click en el btn');
        console.log("Isbn Seleccionado : " + isbn);
        if (isbn !== "") {
            ToastAddLibro();
            $("#txtISBN").val(isbn);
            $("#txtNombreLibro").val(nombreLibro);
            $("#txtNombresAutor").val(autor);
            $("#txtFechaLanzamiento").val(fecha);
            $("#cboGenero").val(genero);
            $("#txtNombreEditorial").val(editorial);
            $("#txtPrecioCompra").val(precioCompra);
            $("#txtPrecioVenta").val(PrecioVenta);
            $("#txtStock").val(stock);
            $("#ImgLibro").prop('src', imagen);
        }

    });

    $("#txtCantidadAbastecimiento").change(function () {
        var cantidad = $("#txtCantidadAbastecimiento").val();
        var valorLibro = 0;
        if ($("#txtPrecioVenta").val() === "") {
            $("#txtValorAbastecimiento").val("0");
        } else {
            valorLibro = $("#txtPrecioVenta").val();
            var valorpagar = valorLibro * cantidad;
            $("#txtValorAbastecimiento").val(valorpagar);
        }
    });


});

function ToastAddLibro() {
    toastr.success('Se ha seleccionado correctamente el libro', 'Libro añadido', {
        timeOut: 5000,
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "tapToDismiss": false
    });
}


function AddLibro() {
    var libroSeleccionado = new Array();
    var i = 0;

    $(this).parents('tr').find('td').each(function () {
        libroSeleccionado[i] = $(this).html();
        i++;
    });

    var imagen = libroSeleccionado[0];
    var isbn = libroSeleccionado[1];
    var nombreLibro = libroSeleccionado[2];
    var autor = libroSeleccionado[3];
    var fecha = libroSeleccionado[4];
    var genero = libroSeleccionado[5];
    var editorial = libroSeleccionado[6];
    var precioCompra = libroSeleccionado[7];
    var PrecioVenta = libroSeleccionado[8];
    var stock = libroSeleccionado[9];
    alert('Ha dado click en el btn');
    console.log("Isbn Seleccionado : " + isbn);
    if (isbn !== "") {
        ToastAddLibro();
        $("#txtISBN").val(isbn);
        $("#txtNombreLibro").val(nombreLibro);
        $("#txtNombresAutor").val(autor);
        $("#txtFechaLanzamiento").val(fecha);
        $("#cboGenero").val(genero);
        $("#txtNombreEditorial").val(editorial);
        $("#txtPrecioCompra").val(precioCompra);
        $("#txtPrecioVenta").val(PrecioVenta);
        $("#txtStock").val(stock);
        $("#ImgLibro").prop('src', imagen);
    }
}