$(document).ready(function(){
    
    $("#btnRegistrarCliente").click(function(){
        var id = $("#txtIdCliente").val();
        var nombresCliente = $("#txtNombresCliente").val();
        var apellidosCliente = $("#txtApellidosCliente").val();
        var emailCliente = $("#txtEmailCliente").val();
        console.log("ID Cliente :"+id);
        console.log("Email : "+emailCliente);
        $.post('../SrvGestionCliente',{
            idCliente:id,
            nombresCliente:nombresCliente,
            apellidosCliente:apellidosCliente,
            emailCliente:emailCliente,
            accion:"Registrar"
        },function(data){
            if(data==="Exito"){
                LimpiarCampos();
                ActualizarTablaClientes();
                swal("Registro Exitoso !!!","Se registro correctamente el cliente","success");
            }else{
                swal("Error al Registrar","Error cause : "+data,"error");
            }
        });
    });
});


function ActualizarTablaClientes(){  
    var accion = "Listar";    
    $.post('SrvGestionCliente',{
        accion:accion
    },function(data){
        $("#cuerpoTabla-Cliente").empty();
        $("#cuerpoTabla-Cliente").append(data);
    });
}

function LimpiarCampos(){
        $("#txtIdCliente").val("");
        $("#txtNombresCliente").val("");
        $("#txtApellidosCliente").val("");
        $("#txtEmailCliente").val("");
}