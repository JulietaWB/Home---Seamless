using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using HomeSeamless.Models;

namespace TP9LoginJS.Controllers;

public class Account : Controller
{
    [HttpPost]
    public IActionResult ValidarUsuario (string email, string contra)
    {
        if (BD.ValidarUsuarioBD (email, contra) == null)
        {
            
            return RedirectToAction("Login", "Home", new {error = "Correo o contraseña incorrectos"});
        }
        else 
        {
            return RedirectToAction("Index", "Home");
        }
    }

    public IActionResult RecuperarContraseña (string email)
    {  
        ViewBag.Contra = BD.EncontrarContra(email);
        if (ViewBag.Contra == null)
        {
            return RedirectToAction("Olvide", "Home",new {error = "Usuario no encontrado."});
        }

        return RedirectToAction("Olvide", "Home", new {contra=ViewBag.Contra});
    }

    public IActionResult GuardarUsuario (string username, string email, string tel, string name, string contra, string contra2)
    {  
        if (BD.BuscarUser(username) != null)
        {
            return RedirectToAction("Registro", "Home",new {error = "Ya existe un usuario con ese Username."});
        }
        else if (BD.BuscarCorreo(email) != null)
        {
            return RedirectToAction("Registro", "Home",new {error = "Ya existe un usuario con ese correo electrónico."});
        }
        else
        {
            BD.CrearUsuario(username, email, tel, name, contra);
            return RedirectToAction("Registro", "Home",new {error = "Usuario creado exitosamente."});  
        }
    }

}