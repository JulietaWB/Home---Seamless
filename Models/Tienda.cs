namespace HomeSeamless.Models;
public static class Tienda {

    public static string EncontrarImg (int id)
        {
            if (BD.BuscarProd (id) != null)
            {
                List <string> imagenes = new List <string>();
                imagenes=BD.SelectImagenes(id);
                return imagenes;
            }
            
            return RedirectToAction("Index", "Home");
        }

        
    public static Producto RecibirProd (int id)
    {
        if (BD.BuscarProd (id) != null)
        {
            Producto prodObj = new Producto();
            prodObj=BD.SelectProducto(id);
        }
        
        return prodObj;
    }
}