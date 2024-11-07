using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using HomeSeamless.Models;

namespace HomeSeamless.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Login(string error = "")
    {
        ViewBag.MensajeError = error;
        return View();
    }

    public IActionResult Registro(string error = "")
    {
        ViewBag.MensajeError = error;
        return View();
    }

    public IActionResult PagBienvenida()
    {
        return View();
    }

    public IActionResult Olvide(string error = "", string contra = "")
    {
        ViewBag.MensajeError = error;
        ViewBag.Contra = contra;
        return View();
    }
}
