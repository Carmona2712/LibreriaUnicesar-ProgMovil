$(document).ready(function () {
    $("#btn_subir_Imagen").change(function () {
        var filesSelected = document.getElementById("btn_subir_Imagen").files;
        if (filesSelected.length > 0) {
            var fileToLoad = filesSelected[0];
            var fileReader = new FileReader();
            fileReader.onload = function (fileLoadedEvent) {
                var base64value = fileLoadedEvent.target.result;
                // console.log(base64value);
                $("#txtimg64").val(base64value);
            };
            fileReader.readAsDataURL(fileToLoad);
        }

    });

});


