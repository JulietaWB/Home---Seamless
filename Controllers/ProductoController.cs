using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9LoginJS.Models;

namespace TP9LoginJS.Controllers;

public class Producto : Controller
{
    [HttpPost]
    public IActionResult EncontrarImg (int id)
    {
        if (BD.BuscarProd (id) != null)
        {
            List <string> imagenes = new List <string>();
            imagenes=BD.SelectImagenes(id);
            return imagenes;
        }
        
        return RedirectToAction("Index", "Home");
    }

    
    public IActionResult RecibirProd (int id)
    {
        if (BD.BuscarProd (id) != null)
        {
            Producto prodObj = new Producto(propiedades);
            prodObj=BD.SelectProducto(id);
            return prodObj;
        }
        
        return RedirectToAction("Index", "Home");
    }

}