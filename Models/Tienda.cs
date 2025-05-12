namespace HomeSeamless.Models;
public static class Tienda {

    public static string EncontrarImg (int id)
        {
            List <string> imagenes = new List <string>();
            if (BD.BuscarProd (id) != null)
            {
                imagenes=BD.SelectImagenes(id);
            }
            return imagenes.FirstOrDefault();            
        }

        
    public static Producto RecibirProd (int id)
    {
        Producto prodObj = new Producto();
        if (BD.BuscarProd (id) != null)
        {
            prodObj=BD.SelectProducto(id);
        }
        
        return prodObj;
    }
}