using System.Data.SqlClient;
using Dapper;
namespace TP9LoginJS.Models;

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

    public static Producto SelectProducto (int id)   
    {
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT * from Producto WHERE idProducto=@pid";
            conn.Execute(sql, new {pid=id});
        }
    }

    public static string BuscarProd (int id)
    {
        string existe = null;
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT idProucto from Proucto where idProucto=@pid";
            existe = conn.QueryFirstOrDefault<string>(sql, new {pid=id});
        }
        return existe;
    }

    public static Producto SelectImagenes (int id)   
    {
        List <string> imagenes = new List <string>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql="SELECT linkFotoProd from FotosProductos WHERE idProducto=@pid";
            imagenes=conn.QueryFirstOrDefault<string>(sql, new {pid=id});
        }
        return imagenes;
    }


}