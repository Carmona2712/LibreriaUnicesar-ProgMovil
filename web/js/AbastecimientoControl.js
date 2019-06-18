$(document).ready(function () {

    $(".addLibro").click(function () {
        var libroSeleccionado = new Array();
        var i = 0;

        $(this).parents('tr').find('td').each(function () {
            libroSeleccionado[i] = $(this).html();
            i++;
        });

        $(this).parents("tr").find("td").find("img").each(function () {
            libroSeleccionado[0] = $(this).attr('src');
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
        
        if (isbn !== "") {
            ToastAddLibro();
            $("#txtISBN").val(isbn);
            $("#txtNombreLibro").val(nombreLibro);
            $("#txt_nombreAutor").val(autor);
            $("#txtFechaLanzamiento").val(fecha);
            $("#cboGenero").append('<option value="' + genero + '" selected="selected">' + genero + '</option>');
            $("#txt_nombreEditorial").val(editorial);
            $("#txtPrecioCompra").val(precioCompra);
            $("#txtPrecioVenta").val(PrecioVenta);
            $("#txtStock").val(stock);
            $("#ImgLibro").prop('src', imagen);
        }

    });

    $("#txtCantidadAbastecimiento").change(function () {
        var cantidad = $("#txtCantidadAbastecimiento").val();
        var valorLibro = 0;
        if ($("#txtPrecioCompra").val() === "") {
            $("#txtValorAbastecimiento").val("0");
        } else {
            valorLibro = $("#txtPrecioCompra").val();
            var valorpagar = valorLibro * cantidad;
            $("#txtValorAbastecimiento").val(valorpagar);
        }
    });
    
    
    $("#btn_Registrar_Abastecimiento").click(function(){
        var idLibro = $("#txtISBN").val();
        var idAdmin = $("#idAdmin").val();
        var fecha_transaccion = $("#txtFechaAbastecimiento").val();
        var cantidad = $("#txtCantidadAbastecimiento").val();
        var total = $("#txtValorAbastecimiento").val();
        
        $.post('../SrvGestionAbastecimiento',{
            idLibro : idLibro,
            idAdmin:idAdmin,
            fecha_transaccion:fecha_transaccion,
            cantidad:cantidad,
            valor_total:total
        },function(data){
            if(data === "Exito"){
                
            }else{
                if(data === "Error"){
                    
                }else{
                    
                }
            }
        });
    });


});

function ToastAddLibro() {
    $.toast({
        heading: 'Libro Seleccionado',
        text: 'Se ha agregado correctamente el libro',
        position: 'top-right',
        loaderBg: '#30A048',
        icon: 'success',
        hideAfter: 3500,
        stack: 6
    });
}

