USE [master]
GO
/****** Object:  Database [Seamless]    Script Date: 31/10/2024 13:37:35 ******/
CREATE DATABASE [Seamless]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Seamless', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Seamless.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Seamless_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Seamless_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Seamless] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Seamless].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Seamless] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Seamless] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Seamless] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Seamless] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Seamless] SET ARITHABORT OFF 
GO
ALTER DATABASE [Seamless] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Seamless] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Seamless] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Seamless] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Seamless] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Seamless] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Seamless] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Seamless] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Seamless] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Seamless] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Seamless] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Seamless] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Seamless] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Seamless] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Seamless] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Seamless] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Seamless] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Seamless] SET RECOVERY FULL 
GO
ALTER DATABASE [Seamless] SET  MULTI_USER 
GO
ALTER DATABASE [Seamless] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Seamless] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Seamless] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Seamless] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Seamless] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Seamless', N'ON'
GO
ALTER DATABASE [Seamless] SET QUERY_STORE = OFF
GO
USE [Seamless]
GO
/****** Object:  User [alumno]    Script Date: 31/10/2024 13:37:36 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carritos]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carritos](
	[idUsuario] [int] NOT NULL,
	[idProducto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NOT NULL,
	[nombreCategoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[idCompra] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[idCompra] [int] NOT NULL,
	[idProducto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosCatalogoMarca]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosCatalogoMarca](
	[idFotoCatalogo] [int] NOT NULL,
	[idVendedor] [int] NOT NULL,
	[linkFotoCataogo] [varchar](200) NOT NULL,
 CONSTRAINT [PK_FotosCatalogoMarca] PRIMARY KEY CLUSTERED 
(
	[idFotoCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosProductos]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosProductos](
	[idFotoProd] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[linkFotoProd] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FotosProductos] PRIMARY KEY CLUSTERED 
(
	[idFotoProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProd] [varchar](70) NOT NULL,
	[descProd] [varchar](700) NOT NULL,
	[idVendedor] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idTipoRopa] [int] NOT NULL,
	[precioProd] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoXtalles]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoXtalles](
	[idProducto] [int] NOT NULL,
	[idTalle] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talles]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Talles](
	[idTalle] [int] NOT NULL,
	[nombreTalle] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Talles] PRIMARY KEY CLUSTERED 
(
	[idTalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoRopa]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoRopa](
	[idTipoRopa] [int] NOT NULL,
	[nombreTipoRopa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipoRopa] PRIMARY KEY CLUSTERED 
(
	[idTipoRopa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[mailUsuario] [varchar](50) NOT NULL,
	[imgUsuario] [varchar](50) NULL,
	[contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 31/10/2024 13:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[idVendedor] [int] NOT NULL,
	[nombreVendedor] [varchar](30) NOT NULL,
	[descVendedor] [varchar](1000) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[instagram] [varchar](100) NULL,
	[telefono] [varchar](100) NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria]) VALUES (1, N'Hombre')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria]) VALUES (2, N'Mujer')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria]) VALUES (3, N'Niños')
GO
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (1, 1, N'https://acdn.mitiendanube.com/stores/966/024/products/demiracolo_11sep_0594-f2764b836b254bce4b17273847514555-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (2, 1, N'https://acdn.mitiendanube.com/stores/966/024/products/demiracolo_11sep_0119_retoque-434a815633a6047be717273983652972-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (3, 1, N'https://acdn.mitiendanube.com/stores/966/024/products/demiracolo_32296252-04d41468b5b8e08dd517158927783919-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (4, 1, N'https://acdn.mitiendanube.com/stores/966/024/products/demiracolo_fw23_04231-e04bccfad5f70b1f6516818605168391-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (5, 1, N'https://acdn.mitiendanube.com/stores/966/024/products/demiracolo_32296064-ac459b494232875dda17146087707103-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (6, 2, N'https://roparevolver.com/cdn/shop/files/Remera-Limon-Blanca_04_960x_crop_center.jpg?v=1725596504')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (7, 2, N'https://roparevolver.com/cdn/shop/files/Remera-Running-Negra_01_960x_crop_center.jpg?v=1725596573')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (8, 2, N'https://roparevolver.com/cdn/shop/files/Pantalon-Fuji_03_960x_crop_center.jpg?v=1725595837')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (9, 2, N'https://roparevolver.com/cdn/shop/files/Jean-Crew-Denim-Celeste_05.jpg?v=1725595576')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (10, 2, N'https://roparevolver.com/cdn/shop/files/Campera-Iron-Verde_01_960x_crop_center.jpg?v=1710795515')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (11, 4, N'https://acdn.mitiendanube.com/stores/008/089/products/_anorak-sprot-negro_01_1-75db4336b643bcbf2f17261135062442-640-0.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (12, 4, N'https://acdn.mitiendanube.com/stores/008/089/products/_camperon-surplus-camo_09-42c68037ab0dc1954717261660149831-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (13, 4, N'https://acdn.mitiendanube.com/stores/008/089/products/_camisa-inkjet-gris_01-e412565646854ad33217024248980628-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (14, 4, N'https://acdn.mitiendanube.com/stores/008/089/products/_musculosa-winn-celeste_01-8058514abe5975471e17261623536594-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (15, 4, N'https://acdn.mitiendanube.com/stores/008/089/products/_gorra-tribal-negro_03-30fed81b2aed62a36817262693786851-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (16, 5, N'https://acdn.mitiendanube.com/stores/001/050/300/products/pantalon-02-4f42a020209df677cd169635635134751-5ded2c469cdd6e9b5216963563905456-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (17, 5, N'https://acdn.mitiendanube.com/stores/001/050/300/products/ijm08463-editar-3b492ef47d8846264e17273791712297-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (18, 5, N'https://acdn.mitiendanube.com/stores/001/050/300/products/ijm07665-d42469c1d51f54bcdd17273058324790-1024-1024.webp')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (19, 5, N'https://www.maria-cher.com.ar/media/catalog/product/p/r/product_mm47p0636701016_image_1.jpg')
INSERT [dbo].[FotosCatalogoMarca] ([idFotoCatalogo], [idVendedor], [linkFotoCataogo]) VALUES (20, 5, N'https://www.maria-cher.com.ar/media/catalog/product/p/r/product_mm47p0147305083_image_3.jpg')
GO
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (1, N'XXS')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (2, N'XS')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (3, N'S')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (4, N'M')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (5, N'L')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (6, N'XL')
INSERT [dbo].[Talles] ([idTalle], [nombreTalle]) VALUES (7, N'XXL')
GO
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (1, N'Remeras/Tops')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (2, N'Pantalones')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (3, N'Jeans')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (4, N'Shorts/Polleras')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (5, N'Vestidos/Monos')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (6, N'Camisas')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (7, N'Buzos/Sweaters')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (8, N'Calzados')
INSERT [dbo].[tipoRopa] ([idTipoRopa], [nombreTipoRopa]) VALUES (9, N'Carteras/Accesorios')
GO
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (1, N'DeMiracolo', N'En DeMiracolo, somos apasionados por la moda y la sostenibilidad. Nuestra marca argentina se enfoca en crear prendas que fusionan diseño contemporáneo con la rica tradición cultural de nuestro país. Cada colección refleja nuestra dedicación a la calidad, utilizando materiales responsables y técnicas artesanales que celebran el talento local.

Creemos que la moda puede ser un vehículo para el cambio, por eso trabajamos para minimizar nuestro impacto ambiental y promover prácticas éticas. Al elegir DeMiracolo, no solo adquieres ropa única, sino que te unes a un movimiento que prioriza el respeto por el planeta y por quienes lo habitan.


', N'hola@demiracolo.com', N'@demiracolo', N'541128701824')
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (2, N'Revolver', N'"ROPA REVOLVER | SINCE 2009"


Soy Ignacio Cattaneo, director creativo de Revolver.

Ropa Revolver es un proyecto que comenzó hace 10 años junto a mi amigo Matias Abelayras. Empezamos por la necesidad de querer hacer ropa que nos guste, en ese momento, eran camisas estampadas, que no había muchas en el mercado, e hicimos la primera colección con camisas y zapatos.

Hoy, Revolver ha crecido hasta convertirse en una marca que representa autenticidad y estilo único. Nuestro enfoque siempre ha sido fusionar diseño y calidad, con prendas que cuentan historias y reflejan nuestra pasión por la moda. Cada colección es una evolución, inspirada en las calles de Buenos Aires y en las personas que nos rodean. Revolver es más que ropa; es una actitud, una forma de expresión para aquellos que buscan marcar la diferencia', N'ana@roparevolver.com', N'@roparevolver', NULL)
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (3, N'Rapsodia', N'En Rapsodia, celebramos la individualidad y la creatividad a través de la moda. Nuestra marca argentina se inspira en la diversidad cultural y la belleza de la naturaleza, creando prendas que reflejan un estilo bohemio y auténtico. Cada colección es una obra de arte, con detalles únicos y estampados vibrantes que cuentan historias y evocan emociones.

Comprometidos con la sostenibilidad, en Rapsodia utilizamos materiales de calidad y técnicas responsables que minimizan nuestro impacto en el medio ambiente. Creemos que la moda puede ser tanto hermosa como consciente. Al elegir Rapsodia, te unes a una comunidad que valora la originalidad y el respeto por el planeta. ', N'comercio@rapsodia.com', N'@rapsodiaoficial', NULL)
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (4, N'Bullbenny', N'En Bullbenny, creemos que la moda es una forma de expresión personal que refleja la esencia de cada individuo. Nuestra marca argentina se destaca por su estilo urbano y contemporáneo, fusionando tendencias globales con la energía vibrante de nuestra cultura local. Cada prenda está diseñada para ser versátil, cómoda y única, ideal para quienes buscan destacar con autenticidad en su día a día.

Comprometidos con la sostenibilidad y la ética, en Bullbenny utilizamos materiales responsables y procesos de producción conscientes. Valoramos la calidad y el impacto positivo que podemos generar en la comunidad y el medio ambiente. Al elegir Bullbenny, no solo adquieres moda, sino que te unes a un movimiento que promueve la individualidad y el respeto por el planeta. Descubre nuestras colecciones y viste tu personalidad con orgullo.', N'comerce@bullbenny.com', N'@bullbenny', NULL)
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (5, N'Galpón de Ropa', N'En Galpón de Ropa, nos dedicamos a redefinir el concepto de moda argentina a través de la creatividad y la autenticidad. Nuestra marca surge de la pasión por el diseño y la necesidad de ofrecer prendas que conecten con las historias de quienes las visten. Cada colección refleja un estilo único, combinando influencias contemporáneas con la tradición textil de nuestro país, para crear piezas versátiles y con carácter.

Además, en Galpón de Ropa estamos comprometidos con la sostenibilidad. Utilizamos materiales responsables y trabajamos con productores locales, apoyando la economía de nuestra comunidad y reduciendo el impacto ambiental. Al elegir Galpón de Ropa, no solo te vistes con estilo, sino que también apoyas un modelo de consumo consciente.', N'ventas@galpondr.com', N'@galponderopa', NULL)
INSERT [dbo].[Vendedor] ([idVendedor], [nombreVendedor], [descVendedor], [email], [instagram], [telefono]) VALUES (6, N'Cocoliche', N'En Cocoliche, celebramos la diversidad y la creatividad de la moda argentina. Nuestra marca se inspira en la riqueza cultural de nuestro país, creando prendas que fusionan tradición y vanguardia. Cada colección está diseñada para ser única, con estampados coloridos y cortes originales que reflejan la personalidad de quienes las visten. Creemos que la moda es una forma de expresión y buscamos que cada pieza cuente una historia.

Además, en Cocoliche estamos comprometidos con la sostenibilidad y la producción ética. Trabajamos con materiales responsables y apoyamos a artesanos locales, promoviendo prácticas que respetan tanto al medio ambiente como a nuestra comunidad. Al elegir Cocoliche, no solo adquieres ropa con estilo, sino que te unes a un movimiento que prioriza la autenticidad y el respeto por el planeta. ', N'mayoristas@cocoliche.com', N'@cocoliche', NULL)
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD  CONSTRAINT [FK_Carritos_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carritos] CHECK CONSTRAINT [FK_Carritos_Producto]
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD  CONSTRAINT [FK_Carritos_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carritos] CHECK CONSTRAINT [FK_Carritos_Usuario]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Usuario]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compra] ([idCompra])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[FotosCatalogoMarca]  WITH CHECK ADD  CONSTRAINT [FK_FotosCatalogoMarca_Vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedor] ([idVendedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FotosCatalogoMarca] CHECK CONSTRAINT [FK_FotosCatalogoMarca_Vendedor]
GO
ALTER TABLE [dbo].[FotosProductos]  WITH CHECK ADD  CONSTRAINT [FK_FotosProductos_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FotosProductos] CHECK CONSTRAINT [FK_FotosProductos_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categorias]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_tipoRopa] FOREIGN KEY([idTipoRopa])
REFERENCES [dbo].[tipoRopa] ([idTipoRopa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_tipoRopa]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedor] ([idVendedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Vendedor]
GO
ALTER TABLE [dbo].[productoXtalles]  WITH CHECK ADD  CONSTRAINT [FK_productoXtalles_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productoXtalles] CHECK CONSTRAINT [FK_productoXtalles_Producto]
GO
ALTER TABLE [dbo].[productoXtalles]  WITH CHECK ADD  CONSTRAINT [FK_productoXtalles_Talles] FOREIGN KEY([idTalle])
REFERENCES [dbo].[Talles] ([idTalle])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productoXtalles] CHECK CONSTRAINT [FK_productoXtalles_Talles]
GO
USE [master]
GO
ALTER DATABASE [Seamless] SET  READ_WRITE 
GO
