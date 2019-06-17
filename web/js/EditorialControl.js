$(document).ready(function(){
    
    $("#btn_Registrar_Editorial").click(function(){
         var nombreEditorial = $("#txtNombreEditorial").val();       
         $.post('srvGestionEditorial',{
            nombreEditorial :  nombreEditorial, 
            accion:"Registrar"
         },function(data){
             if(data==="Exito"){
                 LimpiarCampos();
                 swal("Registro Exitoso !!!","Se ha registrado correctamente la editorial","success");
             }else{
                 swal("Error al registrar Editorial","Contecte con soporte","error");
             }
         });        
    });
    
    function LimpiarCampos(){
        $("#txtNombreEditorial").val("");
    }
    
    $("#btn_Editar_Editorial").click(function(){
        var id = $("#txtIdEditorial").val();
        var nombre = $("#txtNombreEditorial").val();
        $.post('SrvGestionEditorial',
        {
            id:id,
            nombre:nombre,
            accion:'Editar'
        },function(data){
            
        });
    });
    
    
});

