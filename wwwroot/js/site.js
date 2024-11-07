// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function ValidarContraseña()
{
    const contra =  document.getElementById("contra");

    const regex = /^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$/;

    if (contra.value.length<8)
    {
        $("#MostrarError").html("La contraseña debe tener al menos 8 caracteres") ;
        return false;
    }
    
    else if (!(regex.test(contra.value))) {
        $("#MostrarError").html("La contraseña debe tener al menos una letra mayúscula y un carácter especial.") ;
        return false;
    }
    else{
        $("#MostrarError").html("") ;
        return true;
    }

    
}

function CompararContraseñas()
{
    const contra =  document.getElementById("contra");
    const contra2 =  document.getElementById("contra2");

    if (contra.value !== contra2.value) {
        $("#MostrarError2").html("Las contraseñas no coinciden.") ;
        return false;
    }else{
        $("#MostrarError2").html("") ;
        return true;
    }
}