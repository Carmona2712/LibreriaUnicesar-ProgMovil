$(document).ready(function(){
    
    $(".addLibro").click(function(){
        
    });
    
    $("#txtCantidadAbastecimiento").change(function(){
        var cantidad = $("#txtCantidadAbastecimiento").val();
        var valorLibro = 0;
        if($("#txtPrecioVenta").val() === ""){
            $("#txtValorAbastecimiento").val("0");
        }else{
            valorLibro = $("#txtPrecioVenta").val();
            var valorpagar = valorLibro * cantidad;
            $("#txtValorAbastecimiento").val(valorpagar);
        }
    });
    
    
});

