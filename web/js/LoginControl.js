$(document).ready(function () {

    $("#btnIngresar").click(function () {

        var user = $("#txtuser").val();
        var pass = $("#txtpass").val();

        if (user === "") {

        } else {

            $.post('SrvLogin', {
                user: user,
                pass: pass
            }, function (data) {
                console.log("Retorno Login : " + data);
                if (data === "Invalido") {
                    swal("Datos incorrectos.", "Ingrese nuevamente las credenciales.", "error");
                } else {
                    if (data === "Valido") {
                        window.location.replace("Admin/Menu Principal.jsp");
                    }else{
                        swal("Se ha presentado un error.", "Contactar con soporte", "error");
                    }
                }

            });


        }


    });

});
