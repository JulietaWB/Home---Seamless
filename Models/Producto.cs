public class Producto
{
    public  int IdProducto {get;set;}
    public  string nombreProd {get;set;}
    public  string descProd {get;set;}
    public  int idVendedor {get;set;}
    public  int idCategoria {get;set;}
    public  int idTipoRopa {get;set;}
    public  int precioProd {get;set;}


    public Producto (int Id_Producto, string nombre_Prod, string desc_Prod, int id_Vendedor, int id_Categoria, int id_TipoRopa, int precio_Prod) { 
        IdProducto = Id_Producto;
        nombreProd = nombre_Prod;
        descProd = desc_Prod;
        idVendedor = id_Vendedor;
        idCategoria = id_Categoria; 
        idTipoRopa = id_TipoRopa;
        precioProd = precio_Prod;
     }

     public Producto () {}

}