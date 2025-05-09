using System.Data.SqlClient;
using Dapper;
namespace HomeSeamless.Models;

public static class BD
{
    private static string _ConnectionString = "Server=localhost;DataBase=BDtp9Login;Trusted_Connection=true;";
    public static string ValidarUsuarioBD(string correo, string contra)
    {
        string usuario = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT Correo from Usuarios where Correo=@pcorreo and Contraseña=@pcontra";
            usuario = conn.QueryFirstOrDefault<string>(sql, new {pcontra = contra, pcorreo = correo});
        }
        return usuario;
    }

    public static string EncontrarContra(string correo)
    {
        string contra = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT Contraseña from Usuarios where Correo=@pcorreo";
            contra = conn.QueryFirstOrDefault<string>(sql, new {pcorreo = correo});
        }
        return contra;
    }

    public static string BuscarUser (string user)
    {
        string existe = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT Username from Usuarios where Username=@pUser";
            existe = conn.QueryFirstOrDefault<string>(sql, new {puser = user});
        }
        return existe;
    }

    public static string BuscarCorreo (string correo)
    {
        string existe = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT Correo from Usuarios where Correo=@pcorreo";
            existe = conn.QueryFirstOrDefault<string>(sql, new {pcorreo = correo});
        }
        return existe;
    }

    public static void CrearUsuario (string username, string email, string tel, string name, string contra)   
    {
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="INSERT INTO Usuarios (Username, Contraseña, Correo, Telefono, Nombre) VALUES (@pusername, @pcontra, @pemail, @ptel, @pname)";
            conn.Execute(sql, new {pusername=username, pcontra=contra, pemail = email, ptel=tel, pname=name});
        }
    }
    
//PRODUCTOS

    public static Producto SelectProducto (int id)   
    {
        Producto prod = new Producto();
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT * from Producto WHERE IdProducto=@pid";
            prod = conn.QueryFirstOrDefault<Producto>(sql, new {pid=id});
        }
        return prod;
    }

    public static string BuscarProd (int id)
    {
        string existe = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT idProducto from Producto where idProducto=@pid";
            existe = conn.QueryFirstOrDefault<string>(sql, new {pid=id});
        }
        return existe;
    }

    public static List<string> SelectImagenes(int id)
    {
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT linkFotoProd FROM FotosProductos WHERE idProducto=@pid";
            return conn.Query<string>(sql, new { pid = id }).ToList();
        }
    }
    
    public static void CrearProducto (int id, string nombre, string desc, int idVendedor, int idCategoria, int idTipoRopa, int precio)   
    {
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="INSERT INTO Producto (idProducto, nombreProd, descProd, idVendedor, idCategoria, idTipoRopa, precioProd) VALUES (@pid, @pnombre, @pdesc, @pidVendedor, @pidCategoria, @pidTipoRopa, @pprecio)";
            conn.Execute(sql, new {pid=id, pnombre=nombre, pdesc = desc, pidVendedor=idVendedor, pidCategoria=idCategoria, pidTipoRopa=idTipoRopa, pprecio=precio});
        }
    }

}