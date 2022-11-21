USE [master]
GO
/****** Object:  Database [Domus]    Script Date: 21/11/2022 14:51:55 ******/
CREATE DATABASE [Domus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Domus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Domus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Domus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Domus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Domus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Domus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Domus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Domus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Domus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Domus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Domus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Domus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Domus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Domus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Domus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Domus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Domus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Domus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Domus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Domus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Domus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Domus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Domus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Domus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Domus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Domus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Domus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Domus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Domus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Domus] SET  MULTI_USER 
GO
ALTER DATABASE [Domus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Domus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Domus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Domus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Domus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Domus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Domus] SET QUERY_STORE = OFF
GO
USE [Domus]
GO
/****** Object:  Table [dbo].[actividad]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividad](
	[id_actividad] [bigint] IDENTITY(1,1) NOT NULL,
	[motivo] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alquiler]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alquiler](
	[id_operacion] [bigint] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[interes_mora] [decimal](8, 2) NOT NULL,
	[impuesto_tasa] [decimal](8, 2) NOT NULL,
	[impuesto_servicio] [decimal](8, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [alquiler_id_operacion_primary] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ambiente]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ambiente](
	[id_ambiente] [bigint] IDENTITY(1,1) NOT NULL,
	[superficie] [decimal](8, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[codigo_propiedad] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ambiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cita]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cita](
	[id_cita] [bigint] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[fecha_hs] [datetime] NOT NULL,
	[motivo] [nvarchar](255) NOT NULL,
	[legajo_secretaria] [bigint] NOT NULL,
	[legajo_agente] [bigint] NOT NULL,
	[id_cliente] [bigint] NOT NULL,
	[codigo_inmueble] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[correo_electronico] [nvarchar](255) NOT NULL,
	[telefono] [nvarchar](255) NOT NULL,
	[dni] [nvarchar](255) NULL,
	[cuil_cuit] [nvarchar](255) NOT NULL,
	[direccion] [nvarchar](255) NOT NULL,
	[nombre_apellido] [nvarchar](255) NULL,
	[nombre_propietario] [nvarchar](255) NULL,
	[razon_social] [nvarchar](255) NULL,
	[legajo_secretaria] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[id_area] [bigint] IDENTITY(1,1) NOT NULL,
	[legajo_director] [bigint] NULL,
	[area] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documentacion]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documentacion](
	[id_documento] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[direccion_url] [nvarchar](255) NOT NULL,
	[id_cliente] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[legajo] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [nvarchar](255) NOT NULL,
	[dni] [nvarchar](255) NULL,
	[contrasenia] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[nombre_apellido] [nvarchar](255) NOT NULL,
	[puesto_trabajo] [nvarchar](255) NOT NULL,
	[telefono_contacto] [nvarchar](255) NOT NULL,
	[telefono_alternativo] [nvarchar](255) NULL,
	[sueldo] [decimal](8, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[id_area] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[numero] [bigint] IDENTITY(1,1) NOT NULL,
	[cuit_inmobiliaria] [nvarchar](255) NOT NULL,
	[razon_social_inmobiliaria] [nvarchar](255) NOT NULL,
	[fecha_emision] [date] NOT NULL,
	[id_operacion] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id_localidad] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimiento]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento](
	[id_movimiento] [bigint] IDENTITY(1,1) NOT NULL,
	[concepto] [nvarchar](max) NOT NULL,
	[monto] [decimal](8, 2) NOT NULL,
	[fecha] [date] NOT NULL,
	[legajo_cajera] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id_operacion] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[forma_pago] [nvarchar](255) NOT NULL,
	[tipo] [nvarchar](255) NOT NULL,
	[archivo] [nvarchar](255) NOT NULL,
	[moneda_cotizacion] [nvarchar](255) NOT NULL,
	[monto] [decimal](8, 2) NOT NULL,
	[comision_agente] [decimal](8, 2) NOT NULL,
	[legajo_cajera] [bigint] NOT NULL,
	[legajo_agente] [bigint] NOT NULL,
	[id_cliente] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[codigo_propiedad] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion_movimiento]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion_movimiento](
	[id_operacion] [bigint] NOT NULL,
	[id_movimiento] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [operacion_movimiento_id_operacion_id_movimiento_primary] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC,
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal_access_tokens](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tokenable_type] [nvarchar](255) NOT NULL,
	[tokenable_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[abilities] [nvarchar](max) NULL,
	[last_used_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad](
	[codigo_propiedad] [bigint] IDENTITY(1,1) NOT NULL,
	[calle] [nvarchar](255) NOT NULL,
	[altura] [nvarchar](255) NOT NULL,
	[disponibilidad] [bit] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[precio_inmueble] [decimal](8, 2) NOT NULL,
	[superficie_total] [decimal](8, 2) NOT NULL,
	[superficie_cubierta] [decimal](8, 2) NOT NULL,
	[servicio_internet] [bit] NOT NULL,
	[servicio_agua] [bit] NOT NULL,
	[servicio_gas] [bit] NOT NULL,
	[servicio_electricidad] [bit] NOT NULL,
	[piso_dpto] [int] NULL,
	[numero_dpto] [int] NULL,
	[fecha_construccion] [date] NOT NULL,
	[cant_artefactos] [int] NOT NULL,
	[id_cliente_propietario] [bigint] NOT NULL,
	[id_provincia] [bigint] NOT NULL,
	[id_localidad] [bigint] NOT NULL,
	[id_tipo_propiedad] [bigint] NOT NULL,
	[legajo_marketing] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad_foto]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad_foto](
	[codigo_propiedad] [bigint] NOT NULL,
	[foto] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [propiedad_foto_codigo_propiedad_foto_primary] PRIMARY KEY CLUSTERED 
(
	[codigo_propiedad] ASC,
	[foto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_propiedad]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_propiedad](
	[id_tipo_propiedad] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 21/11/2022 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id_operacion] [bigint] NOT NULL,
	[tipo_venta] [nvarchar](255) NOT NULL,
	[comision_agente] [decimal](8, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [venta_id_operacion_primary] PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actividad] ON 

INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (1, N'metus. Vivamus euismod urna. Nullam', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (2, N'non, luctus sit amet, faucibus', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (3, N'eget laoreet posuere, enim nisl elementum', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (4, N'Etiam gravida molestie arcu. Sed eu', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (5, N'a tortor. Nunc commodo auctor velit. Aliquam', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (6, N'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (7, N'orci, in consequat enim diam vel arcu. Curabitur', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (8, N'dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (9, N'sed consequat auctor, nunc nulla vulputate dui,', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (10, N'eu, accumsan sed, facilisis vitae, orci.', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (11, N'placerat, orci lacus vestibulum lorem, sit amet ultricies', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (12, N'fringilla cursus purus. Nullam scelerisque neque', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (13, N'at sem molestie sodales. Mauris blandit enim consequat', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (14, N'varius orci, in consequat enim diam vel', NULL, NULL)
INSERT [dbo].[actividad] ([id_actividad], [motivo], [created_at], [updated_at]) VALUES (15, N'ornare placerat, orci lacus vestibulum lorem, sit', NULL, NULL)
SET IDENTITY_INSERT [dbo].[actividad] OFF
GO
INSERT [dbo].[alquiler] ([id_operacion], [fecha_inicio], [fecha_fin], [interes_mora], [impuesto_tasa], [impuesto_servicio], [created_at], [updated_at]) VALUES (1, CAST(N'2021-08-13' AS Date), CAST(N'2023-11-13' AS Date), CAST(3695.96 AS Decimal(8, 2)), CAST(734.08 AS Decimal(8, 2)), CAST(758.71 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[alquiler] ([id_operacion], [fecha_inicio], [fecha_fin], [interes_mora], [impuesto_tasa], [impuesto_servicio], [created_at], [updated_at]) VALUES (3, CAST(N'2021-09-09' AS Date), CAST(N'2023-07-12' AS Date), CAST(3950.86 AS Decimal(8, 2)), CAST(977.77 AS Decimal(8, 2)), CAST(709.36 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[alquiler] ([id_operacion], [fecha_inicio], [fecha_fin], [interes_mora], [impuesto_tasa], [impuesto_servicio], [created_at], [updated_at]) VALUES (4, CAST(N'2021-07-04' AS Date), CAST(N'2023-10-18' AS Date), CAST(5936.38 AS Decimal(8, 2)), CAST(750.19 AS Decimal(8, 2)), CAST(297.65 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[alquiler] ([id_operacion], [fecha_inicio], [fecha_fin], [interes_mora], [impuesto_tasa], [impuesto_servicio], [created_at], [updated_at]) VALUES (6, CAST(N'2021-03-14' AS Date), CAST(N'2023-04-29' AS Date), CAST(7736.87 AS Decimal(8, 2)), CAST(496.80 AS Decimal(8, 2)), CAST(85.81 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[alquiler] ([id_operacion], [fecha_inicio], [fecha_fin], [interes_mora], [impuesto_tasa], [impuesto_servicio], [created_at], [updated_at]) VALUES (7, CAST(N'2021-11-15' AS Date), CAST(N'2022-12-25' AS Date), CAST(8343.49 AS Decimal(8, 2)), CAST(974.26 AS Decimal(8, 2)), CAST(302.09 AS Decimal(8, 2)), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ambiente] ON 

INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (1, CAST(27.00 AS Decimal(8, 2)), 3, N'garage', 13, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (2, CAST(20.00 AS Decimal(8, 2)), 2, N'baño', 11, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (3, CAST(20.00 AS Decimal(8, 2)), 3, N'baño', 11, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (4, CAST(19.00 AS Decimal(8, 2)), 2, N'baño', 15, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (5, CAST(22.00 AS Decimal(8, 2)), 1, N'baño', 10, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (6, CAST(28.00 AS Decimal(8, 2)), 4, N'dormitorio', 16, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (7, CAST(29.00 AS Decimal(8, 2)), 2, N'cocina', 8, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (8, CAST(17.00 AS Decimal(8, 2)), 1, N'garage', 9, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (9, CAST(20.00 AS Decimal(8, 2)), 2, N'baño', 12, NULL, NULL)
INSERT [dbo].[ambiente] ([id_ambiente], [superficie], [cantidad], [nombre], [codigo_propiedad], [created_at], [updated_at]) VALUES (10, CAST(14.00 AS Decimal(8, 2)), 1, N'patio', 11, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ambiente] OFF
GO
SET IDENTITY_INSERT [dbo].[cita] ON 

INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (1, N'en proceso', N'sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis', CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare', 14, 22, 11, 11, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (2, N'cancelado', N'nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'elementum, dui quis accumsan convallis, ante lectus convallis est, vitae', 16, 22, 7, 6, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (3, N'finalizado', N'lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede,', CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent', 16, 24, 16, 9, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (4, N'cancelado', N'orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas', CAST(N'2022-04-30T00:00:00.000' AS DateTime), N'malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis', 18, 21, 18, 11, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (5, N'finalizado', N'porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis', 16, 30, 22, 6, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (6, N'en proceso', N'sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan', CAST(N'2023-07-22T00:00:00.000' AS DateTime), N'tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque', 13, 23, 9, 7, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (7, N'en proceso', N'nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum', CAST(N'2021-12-20T00:00:00.000' AS DateTime), N'euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', 16, 28, 10, 14, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (8, N'cancelado', N'suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non', CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus.', 17, 28, 26, 7, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (9, N'cancelado', N'nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et,', CAST(N'2023-06-28T00:00:00.000' AS DateTime), N'Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit.', 15, 27, 23, 13, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (10, N'en proceso', N'ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,', CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae', 16, 25, 13, 13, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (11, N'en proceso', N'Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus', CAST(N'2023-03-28T00:00:00.000' AS DateTime), N'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus', 20, 22, 12, 10, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (12, N'cancelado', N'pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam', CAST(N'2023-10-05T00:00:00.000' AS DateTime), N'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac', 20, 25, 26, 5, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (13, N'finalizado', N'dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis,', CAST(N'2023-06-16T00:00:00.000' AS DateTime), N'dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent', 19, 29, 4, 14, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (14, N'en proceso', N'turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis.', CAST(N'2021-12-23T00:00:00.000' AS DateTime), N'In at pede. Cras vulputate velit eu sem. Pellentesque ut', 16, 28, 19, 8, NULL, NULL)
INSERT [dbo].[cita] ([id_cita], [estado], [descripcion], [fecha_hs], [motivo], [legajo_secretaria], [legajo_agente], [id_cliente], [codigo_inmueble], [created_at], [updated_at]) VALUES (15, N'cancelado', N'dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis', 14, 30, 25, 15, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cita] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (1, CAST(N'2021-12-28' AS Date), N'integer@hotmail.couk', N'1-114-873-2918', N'71463286', N'20123176091', N'P.O. Box 706, 775 Ipsum. Rd.', N'', N'Robert Bullock', N'Fusce Mollis Industries', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (2, CAST(N'2021-12-22' AS Date), N'nec.metus@outlook.net', N'237-3145', N'40019653', N'42129960570', N'948-7600 Ipsum Street', N'', N'Dennis Owen', N'Ligula Nullam Incorporated', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (3, CAST(N'2022-10-09' AS Date), N'sit.amet@hotmail.com', N'432-8173', N'50360984', N'76828923057', N'P.O. Box 413, 2958 Sed Avenue', N'', N'Summer Mcgowan', N'A Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (4, CAST(N'2022-07-28' AS Date), N'bibendum.ullamcorper.duis@protonmail.net', N'764-9860', N'55389807', N'22434978934', N'Ap #758-6398 Eleifend Road', N'', N'Buffy Bird', N'Amet Diam Eu Institute', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (5, CAST(N'2023-07-26' AS Date), N'vivamus.euismod@protonmail.org', N'1-744-422-6473', N'83341364', N'84487524092', N'Ap #707-9217 Vivamus Av.', N'', N'Lacy Miranda', N'Vel Sapien Inc.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (6, CAST(N'2022-06-30' AS Date), N'vitae.aliquam@icloud.org', N'1-619-458-3827', N'70764180', N'72225795197', N'Ap #480-3382 Lorem, Rd.', N'', N'Kennan Sandoval', N'In Molestie Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (7, CAST(N'2023-01-01' AS Date), N'vitae.posuere@protonmail.edu', N'343-4724', N'55128604', N'70150047834', N'482-7303 Lectus Road', N'', N'Amity Knox', N'Lacus Etiam Incorporated', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (8, CAST(N'2022-05-22' AS Date), N'tempus.scelerisque@hotmail.com', N'338-8312', N'32421081', N'17747757398', N'P.O. Box 643, 3720 Lobortis St.', N'', N'Chantale Charles', N'Porttitor Interdum Sed Corporation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (9, CAST(N'2022-01-31' AS Date), N'vestibulum@icloud.org', N'1-542-546-7736', N'36978115', N'905423686', N'306 Tristique Rd.', N'', N'Duncan Jefferson', N'Natoque Limited', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (10, CAST(N'2022-06-19' AS Date), N'at.arcu@hotmail.edu', N'1-768-517-1152', N'53234408', N'23752542904', N'Ap #828-5762 Senectus Street', N'', N'Brandon Dodson', N'Semper Pretium Neque Company', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (11, CAST(N'2023-11-16' AS Date), N'sagittis.felis@hotmail.org', N'1-857-832-1847', N'36918388', N'84426125624', N'659-5972 Vestibulum St.', N'', N'Melvin Lee', N'Orci Sem Industries', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (12, CAST(N'2022-12-08' AS Date), N'dui.nec@outlook.edu', N'1-135-666-7338', N'28307817', N'37162027482', N'P.O. Box 989, 1580 Pede Rd.', N'', N'Berk Maynard', N'Eros Non Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (13, CAST(N'2023-06-12' AS Date), N'dapibus.ligula@outlook.net', N'759-0568', N'62023765', N'32272393418', N'Ap #534-3571 Pede Rd.', N'', N'Kirestin Kerr', N'Erat Eget Associates', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (14, CAST(N'2023-08-11' AS Date), N'consectetuer.euismod@outlook.net', N'1-566-451-4382', N'2866969', N'99657710400', N'P.O. Box 859, 2863 Velit. Rd.', N'', N'Phyllis Fields', N'Malesuada Fames PC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (15, CAST(N'2021-12-29' AS Date), N'convallis.convallis@yahoo.edu', N'1-256-874-2421', N'6828617', N'19762895859', N'P.O. Box 599, 5399 Tincidunt St.', N'', N'Emma Goodwin', N'Cum Inc.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (16, CAST(N'2021-12-03' AS Date), N'vel.arcu@outlook.ca', N'836-8834', N'73319346', N'44982337672', N'839-1193 Augue Road', N'', N'Brent Diaz', N'A Dui Cras Associates', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (17, CAST(N'2022-12-23' AS Date), N'tristique.neque@protonmail.ca', N'1-834-676-6452', N'58773450', N'7246851543', N'2753 Orci, Avenue', N'', N'Plato Sharp', N'Vivamus Industries', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (18, CAST(N'2021-12-08' AS Date), N'tortor@google.edu', N'1-448-837-7811', N'98019998', N'15236446978', N'P.O. Box 525, 9469 Elit. Road', N'', N'Kevin Decker', N'Velit Aliquam Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (19, CAST(N'2023-09-22' AS Date), N'pellentesque.tellus@icloud.ca', N'671-7823', N'56423870', N'13863045911', N'Ap #362-6860 Lorem Rd.', N'', N'Shafira Glover', N'Ipsum Leo Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (20, CAST(N'2023-04-10' AS Date), N'ultrices.mauris@aol.couk', N'1-470-277-5240', N'83342139', N'76958801743', N'Ap #773-6460 Vitae, Street', N'', N'Amir Welch', N'Proin Vel Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (21, CAST(N'2022-09-29' AS Date), N'torquent.per@hotmail.edu', N'1-652-611-1534', N'9822607', N'35488695232', N'Ap #360-557 Ipsum Ave', N'', N'Cherokee Morris', N'Pharetra Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (22, CAST(N'2022-01-12' AS Date), N'donec.est.nunc@aol.org', N'1-256-336-6281', N'81444186', N'94146102463', N'189-1857 Urna Rd.', N'', N'Hamish Trevino', N'Nibh Quisque Nonummy Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (23, CAST(N'2022-06-08' AS Date), N'facilisis.non.bibendum@yahoo.couk', N'515-9166', N'62425669', N'13839629927', N'Ap #133-1843 In Rd.', N'', N'Lesley Ross', N'Vitae Risus Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (24, CAST(N'2023-07-03' AS Date), N'eu@icloud.couk', N'1-563-730-2074', N'64284337', N'47053146340', N'Ap #763-4430 Vulputate Ave', N'', N'Beverly Crosby', N'Ipsum Donec Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (25, CAST(N'2021-11-21' AS Date), N'sit.amet@protonmail.ca', N'520-5272', N'1125954', N'91377074432', N'1554 Ante. Av.', N'', N'Laurel Mathis', N'Ut Cursus Incorporated', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (26, CAST(N'2022-12-30' AS Date), N'luctus.lobortis@outlook.net', N'1-123-342-2704', N'70878164', N'11105445071', N'Ap #924-4619 Et Street', N'', N'Alden Hickman', N'Turpis Corporation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (27, CAST(N'2023-07-14' AS Date), N'interdum.enim.non@icloud.org', N'1-827-315-6863', N'2016743', N'59899038079', N'P.O. Box 994, 5747 Malesuada St.', N'', N'Ezra Huffman', N'Nisl LLP', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (28, CAST(N'2022-05-26' AS Date), N'sed.dictum.proin@protonmail.com', N'754-3283', N'67811467', N'63080127057', N'819-6275 Mauris Road', N'', N'Alfonso Richard', N'Id Ante Nunc Consulting', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (29, CAST(N'2022-04-24' AS Date), N'cras.dolor.dolor@hotmail.org', N'121-5868', N'84141240', N'70695933833', N'P.O. Box 314, 3328 Ornare, Street', N'', N'Allegra Vincent', N'Commodo Hendrerit LLC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (30, CAST(N'2022-12-19' AS Date), N'donec.non@google.net', N'672-8033', N'45878506', N'62798027754', N'806-5326 Sagittis Av.', N'', N'Colin Mercado', N'Vestibulum Inc.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (31, CAST(N'2023-03-06' AS Date), N'arcu.iaculis.enim@hotmail.org', N'421-4675', N'972627', N'32924484786', N'P.O. Box 565, 2308 Montes, Street', N'', N'Fleur Vang', N'Sed Nunc Est Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (32, CAST(N'2023-11-12' AS Date), N'a.facilisis@google.couk', N'519-7891', N'34135365', N'83946309508', N'Ap #446-129 Erat, Rd.', N'', N'Barrett Talley', N'Pretium Neque LLC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (33, CAST(N'2023-08-09' AS Date), N'scelerisque@hotmail.org', N'547-3562', N'57323225', N'88718070888', N'1837 Sagittis. Rd.', N'', N'Kelly Carter', N'Magna LLP', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (34, CAST(N'2022-12-14' AS Date), N'amet@outlook.edu', N'1-717-828-6446', N'93281586', N'87369761730', N'Ap #308-8343 Libero. St.', N'', N'Quinlan Holland', N'Elit Industries', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (35, CAST(N'2022-09-20' AS Date), N'ornare.fusce@aol.ca', N'658-4599', N'80298482', N'69414360985', N'Ap #332-4484 Fusce St.', N'', N'Nissim Rosario', N'Amet Foundation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (36, CAST(N'2023-03-10' AS Date), N'molestie@google.ca', N'1-907-626-1428', N'87897200', N'72385894226', N'P.O. Box 433, 8369 Varius St.', N'', N'Baxter Calhoun', N'Mollis Phasellus Libero PC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (37, CAST(N'2021-12-29' AS Date), N'eros@protonmail.couk', N'1-443-874-1785', N'34682834', N'98570193248', N'Ap #438-415 Proin Avenue', N'', N'Baker Holman', N'Pellentesque Industries', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (38, CAST(N'2023-03-16' AS Date), N'donec.tincidunt@protonmail.com', N'492-7844', N'28999256', N'58738996098', N'461-8649 Dictum St.', N'', N'Lucas Craig', N'Proin Sed Corp.', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (39, CAST(N'2022-06-03' AS Date), N'lacus.vestibulum@protonmail.com', N'658-7444', N'72842304', N'30669717614', N'P.O. Box 914, 9677 Metus Ave', N'', N'Roanna Meyers', N'Neque Vitae LLP', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (40, CAST(N'2022-06-04' AS Date), N'ipsum@yahoo.ca', N'1-558-554-6587', N'91514493', N'89495924200', N'934 Erat St.', N'', N'Slade Robles', N'At Lacus Incorporated', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (41, CAST(N'2021-12-01' AS Date), N'donec@outlook.net', N'834-3172', N'19017759', N'88447013118', N'310-7271 Quisque Road', N'', N'Belle Brown', N'Sit Amet LLC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (42, CAST(N'2023-03-05' AS Date), N'tincidunt.nibh.phasellus@hotmail.edu', N'663-5692', N'98390246', N'91766654857', N'Ap #715-3145 Vel St.', N'', N'Eaton O''Neill', N'Risus In Mi Company', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (43, CAST(N'2022-07-08' AS Date), N'tempor.augue@yahoo.org', N'795-1875', N'51429910', N'25529195746', N'Ap #618-1314 Metus Rd.', N'', N'Ina Roach', N'Egestas Blandit Company', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (44, CAST(N'2022-09-05' AS Date), N'non@icloud.org', N'1-322-664-2978', N'28555411', N'71716973178', N'6659 Tempus Street', N'', N'Abraham Rosales', N'Purus Sapien Gravida Corporation', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (45, CAST(N'2022-07-09' AS Date), N'vivamus@protonmail.couk', N'564-6795', N'60600845', N'18798507594', N'Ap #731-7434 Ac Rd.', N'', N'Ishmael Decker', N'Orci Ut Sagittis PC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (46, CAST(N'2022-10-06' AS Date), N'mattis.cras@protonmail.couk', N'392-5858', N'66224765', N'12446207101', N'665-6205 Placerat Avenue', N'', N'Tasha Singleton', N'Et Libero Proin Ltd', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (47, CAST(N'2023-04-06' AS Date), N'amet@yahoo.couk', N'303-9352', N'56616319', N'48822569279', N'577-340 Tempus Av.', N'', N'Eagan Farmer', N'Eros Proin LLC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (48, CAST(N'2022-07-20' AS Date), N'dui.lectus@protonmail.edu', N'674-4741', N'29724593', N'52134260049', N'6886 Massa. Rd.', N'', N'Brett Parks', N'Maecenas Malesuada PC', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (49, CAST(N'2023-06-16' AS Date), N'tincidunt@outlook.couk', N'1-867-535-3353', N'80310714', N'42805399255', N'Ap #446-1442 Volutpat. Ave', N'', N'Joshua Chandler', N'Molestie Institute', NULL, NULL, NULL)
INSERT [dbo].[cliente] ([id_cliente], [fecha_nacimiento], [correo_electronico], [telefono], [dni], [cuil_cuit], [direccion], [nombre_apellido], [nombre_propietario], [razon_social], [legajo_secretaria], [created_at], [updated_at]) VALUES (50, CAST(N'2022-09-05' AS Date), N'pellentesque.ut@yahoo.org', N'732-1239', N'51794769', N'8915197843', N'P.O. Box 805, 3186 In Av.', N'', N'Yolanda Whitley', N'Mauris Non Dui Inc.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[departamento] ON 

INSERT [dbo].[departamento] ([id_area], [legajo_director], [area], [created_at], [updated_at]) VALUES (1, 7, N'comercializacion', NULL, NULL)
INSERT [dbo].[departamento] ([id_area], [legajo_director], [area], [created_at], [updated_at]) VALUES (2, 45, N'administracion', NULL, NULL)
SET IDENTITY_INSERT [dbo].[departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[documentacion] ON 

INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (1, N'facilisis vitae, orci.', N'a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed', N'http://ebay.com/fr', 10, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (2, N'dignissim magna a', N'lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium', N'http://naver.com/sub/cars', 33, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (3, N'nisi. Mauris nulla.', N'lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna,', N'https://wikipedia.org/en-us', 33, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (4, N'Sed malesuada augue', N'mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.', N'https://guardian.co.uk/user/110', 43, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (5, N'a mi fringilla', N'nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam.', N'http://netflix.com/user/110', 20, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (6, N'erat volutpat. Nulla', N'hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', N'https://pinterest.com/fr', 29, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (7, N'libero. Donec consectetuer', N'Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui.', N'http://ebay.com/settings', 17, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (8, N'augue porttitor interdum.', N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna', N'https://netflix.com/one', 17, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (9, N'Aliquam erat volutpat.', N'diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.', N'http://twitter.com/en-ca', 19, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (10, N'elementum sem, vitae', N'ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec', N'https://pinterest.com/user/110', 45, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (11, N'amet, dapibus id,', N'commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', N'http://pinterest.com/user/110', 50, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (12, N'hendrerit consectetuer, cursus', N'libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum', N'https://wikipedia.org/en-us', 9, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (13, N'imperdiet, erat nonummy', N'lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.', N'http://wikipedia.org/user/110', 33, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (14, N'venenatis a, magna.', N'enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,', N'http://yahoo.com/site', 8, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (15, N'montes, nascetur ridiculus', N'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.', N'https://reddit.com/one', 24, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (16, N'nec mauris blandit', N'ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet', N'http://reddit.com/user/110', 41, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (17, N'Aliquam ultrices iaculis', N'ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae', N'https://baidu.com/settings', 35, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (18, N'orci. Phasellus dapibus', N'dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in', N'http://guardian.co.uk/settings', 7, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (19, N'tempus risus. Donec', N'sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac', N'https://zoom.us/en-us', 39, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (20, N'pede nec ante', N'cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed', N'http://reddit.com/sub/cars', 39, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (21, N'sed, est. Nunc', N'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a', N'http://reddit.com/en-ca', 28, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (22, N'lobortis risus. In', N'Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel,', N'http://cnn.com/settings', 9, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (23, N'Maecenas libero est,', N'auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu,', N'https://netflix.com/en-us', 28, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (24, N'iaculis nec, eleifend', N'Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse', N'http://zoom.us/group/9', 10, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (25, N'hendrerit consectetuer, cursus', N'posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh', N'https://reddit.com/en-ca', 7, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (26, N'lacus, varius et,', N'netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam', N'http://whatsapp.com/fr', 47, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (27, N'Aliquam tincidunt, nunc', N'amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy', N'http://yahoo.com/one', 46, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (28, N'lobortis, nisi nibh', N'mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,', N'https://youtube.com/group/9', 30, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (29, N'Nulla semper tellus', N'Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas,', N'http://naver.com/sub/cars', 33, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (30, N'aliquam eros turpis', N'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed', N'https://naver.com/en-ca', 33, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (31, N'gravida. Aliquam tincidunt,', N'eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.', N'https://yahoo.com/en-ca', 34, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (32, N'vel, faucibus id,', N'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo', N'https://netflix.com/settings', 20, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (33, N'urna convallis erat,', N'Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc', N'https://google.com/sub/cars', 17, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (34, N'non, lobortis quis,', N'Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante', N'http://facebook.com/sub/cars', 28, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (35, N'sem eget massa.', N'sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales', N'http://facebook.com/sub', 12, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (36, N'Cum sociis natoque', N'purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis', N'http://wikipedia.org/group/9', 22, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (37, N'Aliquam gravida mauris', N'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing.', N'https://baidu.com/settings', 36, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (38, N'pellentesque. Sed dictum.', N'faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui.', N'https://guardian.co.uk/sub', 25, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (39, N'montes, nascetur ridiculus', N'amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam.', N'http://google.com/en-ca', 10, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (40, N'nibh. Phasellus nulla.', N'Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat', N'http://nytimes.com/fr', 10, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (41, N'eget, venenatis a,', N'a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit', N'https://baidu.com/group/9', 25, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (42, N'Phasellus dolor elit,', N'est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo', N'http://google.com/one', 47, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (43, N'in faucibus orci', N'mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat', N'https://google.com/group/9', 45, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (44, N'primis in faucibus', N'Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis', N'http://youtube.com/group/9', 24, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (45, N'interdum. Nunc sollicitudin', N'Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec', N'http://naver.com/en-ca', 41, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (46, N'neque. Nullam ut', N'nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.', N'http://twitter.com/settings', 36, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (47, N'lectus. Cum sociis', N'semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi', N'https://naver.com/user/110', 37, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (48, N'in, dolor. Fusce', N'gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a,', N'http://instagram.com/sub', 49, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (49, N'Suspendisse non leo.', N'dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.', N'https://zoom.us/en-us', 28, NULL, NULL)
INSERT [dbo].[documentacion] ([id_documento], [nombre], [descripcion], [direccion_url], [id_cliente], [created_at], [updated_at]) VALUES (50, N'quam. Pellentesque habitant', N'risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum.', N'https://netflix.com/sub', 31, NULL, NULL)
SET IDENTITY_INSERT [dbo].[documentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (1, N'lorem,', N'79178691', N'NGL33XNI7ZK', N'enim.diam@hotmail.com', N'Whitney Deleon', N'agente', N'1-679-754-1281', N'1-517-342-5584', CAST(26014.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (2, N'Phasellus', N'7878502', N'ZCK07CPE1PM', N'diam.proin.dolor@outlook.com', N'Jamalia Lara', N'agente', N'(134) 854-5991', N'1-899-317-6396', CAST(27477.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (3, N'viverra.', N'94263953', N'PSU11SRT6VG', N'aliquam.auctor@yahoo.edu', N'Cassidy Townsend', N'secretaria', N'(619) 856-4961', N'1-863-767-8927', CAST(43075.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (4, N'Praesent', N'88407942', N'ZCK57TCH8IJ', N'facilisis.suspendisse@protonmail.net', N'Robert Bolton', N'agente', N'(356) 568-9295', N'(154) 771-7118', CAST(28048.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (5, N'vel,', N'65464100', N'BXG64NTG4SG', N'euismod.et@yahoo.ca', N'Scott Buckner', N'cajera', N'(266) 323-1446', N'1-387-226-6172', CAST(27931.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (6, N'nec', N'18210256', N'DLK71IND7HJ', N'aliquet.diam@aol.com', N'Dacey Stewart', N'marketing', N'1-261-277-3606', N'1-606-606-4274', CAST(26526.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (7, N'ipsum.', N'72444890', N'EPN23CAW0ED', N'mi@hotmail.couk', N'Astra Edwards', N'cajera', N'(816) 115-1559', N'(253) 278-4249', CAST(43704.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (8, N'pede.', N'57457839', N'IXK36CED4KT', N'vulputate@aol.couk', N'Alika O''connor', N'cajera', N'1-824-549-7744', N'1-852-328-2473', CAST(27520.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (9, N'justo', N'47024636', N'DYC95OEB2IB', N'vulputate.mauris@aol.com', N'Gemma Cardenas', N'secretaria', N'1-440-333-6448', N'(459) 878-3512', CAST(5778.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (10, N'mattis.', N'3347879', N'UAQ04OQA2PS', N'et.magnis.dis@icloud.org', N'Phelan Velazquez', N'marketing', N'(752) 612-6844', N'1-396-674-7233', CAST(30674.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (11, N'varius.', N'95658986', N'BXH34DFE2IK', N'quam@outlook.org', N'Wanda Mcfarland', N'marketing', N'(593) 629-1022', N'1-305-989-2633', CAST(19975.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (12, N'dolor.', N'20910806', N'KME36EUD8KB', N'a.mi@yahoo.ca', N'Gannon Irwin', N'agente', N'1-677-323-5773', N'1-578-263-3360', CAST(19134.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (13, N'auctor', N'32944705', N'GAQ26JQU7GD', N'venenatis.vel@protonmail.net', N'Davis Jordan', N'marketing', N'1-520-867-7083', N'(465) 646-0315', CAST(5993.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (14, N'parturient', N'99135740', N'ZFO77IFD4XE', N'nulla.facilisis.suspendisse@aol.com', N'Zenaida Mcknight', N'marketing', N'1-455-258-3571', N'(987) 332-1461', CAST(19942.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (15, N'et', N'40991518', N'BUL77UXN3BB', N'in@aol.net', N'Channing Lopez', N'secretaria', N'(311) 446-4727', N'1-684-721-5004', CAST(49496.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (16, N'non,', N'57028305', N'FYT98QJE1EW', N'odio.semper.cursus@outlook.couk', N'Lysandra Henderson', N'agente', N'1-608-441-5924', N'(658) 384-6428', CAST(23699.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (17, N'laoreet,', N'28381451', N'KCJ91DUF6IB', N'laoreet.ipsum@icloud.com', N'Alma Daniel', N'cajera', N'1-865-148-4255', N'1-687-285-1244', CAST(11177.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (18, N'ut', N'99332827', N'NSS38MVL8DF', N'aliquam.erat@outlook.com', N'Dolan Hess', N'marketing', N'1-574-440-7177', N'(252) 377-7184', CAST(32274.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (19, N'purus', N'25441541', N'XJG76OQG5KB', N'luctus.aliquet@google.net', N'Lucius Gill', N'marketing', N'(314) 812-8186', N'1-930-545-6352', CAST(47791.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (20, N'sed', N'98172357', N'IPQ88DCJ6AF', N'et.lacinia@aol.couk', N'Aidan Palmer', N'cajera', N'1-443-481-4336', N'1-285-312-3135', CAST(35501.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (21, N'elementum', N'72382627', N'LVJ75CBC3DM', N'etiam.bibendum@hotmail.com', N'Dennis Mcmahon', N'agente', N'(399) 228-5951', N'(211) 468-5886', CAST(9151.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (22, N'Cum', N'84153478', N'KBH55KDC5VL', N'amet@aol.org', N'Heather Mcbride', N'marketing', N'(853) 782-4424', N'(244) 833-8156', CAST(43360.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (23, N'Quisque', N'39266770', N'SMO44YQW3TE', N'ornare.facilisis@aol.net', N'Ignatius Gallagher', N'agente', N'1-614-166-1400', N'1-542-757-1604', CAST(31785.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (24, N'Donec', N'81341280', N'OSH63VRT9EW', N'fusce.mi@aol.org', N'Clarke Middleton', N'agente', N'(662) 867-3718', N'1-703-836-7511', CAST(24574.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (25, N'Fusce', N'55263211', N'CAM36JDA7OB', N'in.sodales@google.net', N'Jenette Patton', N'agente', N'1-974-449-1978', N'1-723-373-2511', CAST(24508.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (26, N'ac', N'34236463', N'KKG58VBV6IC', N'luctus.felis@aol.net', N'Alika Conley', N'marketing', N'(314) 102-4368', N'(668) 525-9831', CAST(30976.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (27, N'enim.', N'69690006', N'ASJ86TJT2RL', N'magna@yahoo.ca', N'Melissa Allen', N'agente', N'(461) 161-9248', N'1-704-641-7576', CAST(46923.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (28, N'tincidunt,', N'99218125', N'GVJ34HIX6ZR', N'aliquam@hotmail.edu', N'Nash Benton', N'marketing', N'(941) 934-7431', N'(961) 289-5283', CAST(47652.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (29, N'mollis', N'23949303', N'ELY43OUX8LH', N'faucibus@google.couk', N'Scarlet Rodriquez', N'marketing', N'(686) 668-5396', N'1-549-824-2688', CAST(8248.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (30, N'tellus.', N'99358126', N'HJU72HGE4RK', N'duis@hotmail.couk', N'Ali Bond', N'marketing', N'1-220-807-7857', N'1-486-938-7071', CAST(20261.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (31, N'hendrerit', N'15565', N'IMR19PAE7QK', N'suscipit@hotmail.org', N'Brooke Newton', N'agente', N'(721) 812-9215', N'1-663-659-9928', CAST(38259.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (32, N'Cras', N'86595753', N'XHI64ASB9SI', N'eros.nam.consequat@aol.org', N'Kim Mckinney', N'secretaria', N'1-773-744-3456', N'(124) 530-8529', CAST(16188.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (33, N'gravida', N'38715813', N'YCI86VZP7AE', N'porta.elit.a@icloud.ca', N'Henry Hahn', N'cajera', N'1-775-774-6438', N'1-670-833-9266', CAST(16831.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (34, N'quis', N'85027574', N'REN64WQD6PG', N'enim.suspendisse@hotmail.com', N'Uriah Stark', N'marketing', N'(646) 756-3724', N'1-587-687-1376', CAST(20503.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (35, N'convallis,', N'89826993', N'DIE55HWM1KN', N'elit.erat@google.ca', N'Solomon Morton', N'agente', N'(773) 845-8655', N'1-341-652-2543', CAST(48227.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (36, N'enim.', N'4641057', N'JBI24DEI4MX', N'nec@aol.org', N'Violet Walsh', N'agente', N'(296) 712-3168', N'(580) 744-2747', CAST(35405.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (37, N'eu', N'89326014', N'PSV16VOD4LE', N'dolor.dolor@hotmail.edu', N'Rowan Rowland', N'cajera', N'1-566-515-6137', N'(562) 448-7153', CAST(9442.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (38, N'sit', N'93888426', N'CDD57XWV3NC', N'risus@icloud.com', N'Upton Pace', N'marketing', N'(248) 163-8882', N'1-454-925-2016', CAST(9212.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (39, N'orci.', N'74131683', N'LOR57YRK6WS', N'in.faucibus.orci@google.couk', N'Sonia Woodard', N'secretaria', N'(330) 721-7177', N'1-290-335-3826', CAST(45571.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (40, N'ultrices', N'80536777', N'XFS82FFL8VP', N'aliquet.molestie@hotmail.couk', N'Jarrod Sparks', N'agente', N'1-542-311-2675', N'(221) 484-8113', CAST(37835.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (41, N'Mauris', N'6681626', N'DPV71GBF6WY', N'nunc.quisque@protonmail.edu', N'Kerry Key', N'cajera', N'(615) 516-3411', N'1-262-402-1553', CAST(5597.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (42, N'nibh', N'25646869', N'FRT48IDR7ND', N'ac@hotmail.edu', N'Kareem House', N'marketing', N'1-639-222-7911', N'1-893-265-2433', CAST(38181.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (43, N'eu', N'14493881', N'PBH77RPN4WT', N'nonummy@yahoo.edu', N'Ebony Jimenez', N'marketing', N'(570) 636-0311', N'(737) 295-1683', CAST(15086.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (44, N'elit', N'9992659', N'CPB46DEH1JT', N'adipiscing.elit@google.org', N'Reuben Gomez', N'secretaria', N'(894) 538-9103', N'(153) 872-8667', CAST(19369.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (45, N'Donec', N'30254412', N'PSV05UEA1UF', N'semper.tellus@outlook.edu', N'Belle Maldonado', N'agente', N'1-460-837-1626', N'(474) 364-7886', CAST(39635.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (46, N'risus.', N'96729415', N'BTP74NVZ2OL', N'ullamcorper.viverra@icloud.com', N'Grady Gregory', N'secretaria', N'(552) 407-2860', N'(359) 421-8821', CAST(39480.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (47, N'fringilla,', N'72049063', N'HAC55JQT6SN', N'tempus.risus.donec@icloud.edu', N'Scarlett Cotton', N'agente', N'(667) 558-4612', N'1-716-463-5082', CAST(46295.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (48, N'massa.', N'45723857', N'YZH56BBF1WO', N'neque.nullam@outlook.edu', N'Gavin Shields', N'cajera', N'(678) 574-8833', N'1-347-784-7586', CAST(12954.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (49, N'elit.', N'1104359', N'HIM03YEJ5ML', N'at@hotmail.net', N'Rebecca Bruce', N'cajera', N'(255) 562-3373', N'(185) 752-6960', CAST(11890.00 AS Decimal(8, 2)), NULL, NULL, NULL)
INSERT [dbo].[empleado] ([legajo], [nombre_usuario], [dni], [contrasenia], [email], [nombre_apellido], [puesto_trabajo], [telefono_contacto], [telefono_alternativo], [sueldo], [created_at], [updated_at], [id_area]) VALUES (50, N'odio.', N'75294218', N'FUP26VTF4ZH', N'tellus@yahoo.org', N'Jordan Bennett', N'cajera', N'1-132-346-2394', N'(278) 455-9380', CAST(18586.00 AS Decimal(8, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[factura] ON 

INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (1, N'22-36527484-4', N'Enim Consequat Institute', CAST(N'2023-06-13' AS Date), 2, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (2, N'46-44712217-5', N'Felis Purus Ac Ltd', CAST(N'2022-02-25' AS Date), 3, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (3, N'32-36826863-6', N'Sed Incorporated', CAST(N'2022-04-14' AS Date), 4, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (4, N'55-93248741-6', N'Mauris Ipsum Porta PC', CAST(N'2022-06-27' AS Date), 5, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (5, N'36-84463421-2', N'Id Magna Et LLC', CAST(N'2021-12-19' AS Date), 8, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (6, N'38-15968478-2', N'Eget Ipsum Suspendisse LLC', CAST(N'2023-02-01' AS Date), 6, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (7, N'36-79925773-4', N'Sem Elit LLC', CAST(N'2022-08-27' AS Date), 8, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (8, N'53-86317836-8', N'Adipiscing Fringilla Porttitor Associates', CAST(N'2022-12-19' AS Date), 7, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (9, N'27-36752487-8', N'Nonummy Ultricies Inc.', CAST(N'2023-06-03' AS Date), 9, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (10, N'65-26887743-8', N'Mi Eleifend Egestas Inc.', CAST(N'2023-11-06' AS Date), 4, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (11, N'62-49615848-8', N'Mauris Erat Eget LLC', CAST(N'2023-09-12' AS Date), 10, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (12, N'74-22465581-8', N'Nibh Consulting', CAST(N'2023-09-21' AS Date), 11, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (13, N'22-57249434-7', N'Lacinia Orci LLP', CAST(N'2022-02-01' AS Date), 12, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (14, N'17-68464898-5', N'Nec Luctus Corporation', CAST(N'2023-11-09' AS Date), 13, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (15, N'94-82362422-6', N'Aliquam Corp.', CAST(N'2022-07-14' AS Date), 14, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (16, N'76-53944265-2', N'Ut Semper Pretium LLP', CAST(N'2023-05-02' AS Date), 16, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (17, N'82-84155625-6', N'Fringilla Euismod Consulting', CAST(N'2023-07-23' AS Date), 18, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (18, N'27-89758576-2', N'Nunc Sed Consulting', CAST(N'2023-03-19' AS Date), 19, NULL, NULL)
INSERT [dbo].[factura] ([numero], [cuit_inmobiliaria], [razon_social_inmobiliaria], [fecha_emision], [id_operacion], [created_at], [updated_at]) VALUES (19, N'69-52342931-1', N'Nisi Sem Limited', CAST(N'2022-12-05' AS Date), 20, NULL, NULL)
SET IDENTITY_INSERT [dbo].[factura] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 

INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (1, N'Dutse', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (2, N'Flushing', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (3, N'Gyeongsan', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (4, N'Villahermosa', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (5, N'Kawerau', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (6, N'Guadalupe', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (7, N'Altach', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (8, N'Sevsk', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (9, N'Kirov', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (10, N'Khyber Agency', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (11, N'Pontevedra', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (12, N'Topeka', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (13, N'H?i Phòng', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (14, N'Mo i Rana', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (15, N'Avignon', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (16, N'Cork', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (17, N'Kollam', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (18, N'Cagayan de Oro', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (19, N'H? Chí Minh City', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (20, N'Sungai Penuh', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (21, N'Sasolburg', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (22, N'Middelburg', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (23, N'Moffat', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (24, N'Koszalin', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (25, N'Abbeville', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (26, N'Veere', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (27, N'Ceuta', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (28, N'Canora', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (29, N'Mérida', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (30, N'Canberra', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (31, N'Boo', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (32, N'Uribia', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (33, N'Cork', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (34, N'Florenville', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (35, N'Belfast', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (36, N'Tomaszów Mazowiecki', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (37, N'Przemysl', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (38, N'Macau', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (39, N'Isabela City', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (40, N'Nuevo Laredo', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (41, N'Parys', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (42, N'Drohobych', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (43, N'Oldenzaal', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (44, N'Goiânia', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (45, N'Buckley', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (46, N'Cumbernauld', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (47, N'Ovalle', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (48, N'Kungälv', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (49, N'Hartford', NULL, NULL)
INSERT [dbo].[localidad] ([id_localidad], [nombre], [created_at], [updated_at]) VALUES (50, N'Cartago', NULL, NULL)
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (1, N'2019_12_14_000001_create_personal_access_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (2, N'2022_11_11_200404_create_empleado_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (3, N'2022_11_11_200941_create_localidad_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (4, N'2022_11_11_200957_create_provincia_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (5, N'2022_11_11_201108_create_tipo_propiedad_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (6, N'2022_11_11_201638_create_movimiento_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (7, N'2022_11_11_203132_create_cliente_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (8, N'2022_11_11_203204_create_operacion_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (9, N'2022_11_11_205143_create_operacion_movimiento_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (10, N'2022_11_12_200507_create_documentacion_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (11, N'2022_11_12_201839_create_factura_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (12, N'2022_11_13_174757_create_departamento_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (13, N'2022_11_13_181242_create_alquiler_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (14, N'2022_11_13_183621_create_venta_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (15, N'2022_11_20_175827_create_actividad_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (16, N'2022_12_11_212058_create_propiedad_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (17, N'2022_12_12_213711_create_propiedad_foto_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (18, N'2022_12_13_175420_create_cita_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (19, N'2022_12_13_201024_create_ambiente_table', 1)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
SET IDENTITY_INSERT [dbo].[movimiento] ON 

INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (1, N'Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec', CAST(259868.00 AS Decimal(8, 2)), CAST(N'2021-12-16' AS Date), 11, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (2, N'augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi', CAST(175246.00 AS Decimal(8, 2)), CAST(N'2023-06-28' AS Date), 1, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (3, N'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque', CAST(237226.00 AS Decimal(8, 2)), CAST(N'2023-08-29' AS Date), 16, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (4, N'rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,', CAST(294926.00 AS Decimal(8, 2)), CAST(N'2023-07-18' AS Date), 46, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (5, N'sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse', CAST(62310.00 AS Decimal(8, 2)), CAST(N'2022-05-22' AS Date), 25, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (6, N'fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et', CAST(171945.00 AS Decimal(8, 2)), CAST(N'2022-08-24' AS Date), 21, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (7, N'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum', CAST(146318.00 AS Decimal(8, 2)), CAST(N'2022-03-08' AS Date), 2, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (8, N'nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis', CAST(141453.00 AS Decimal(8, 2)), CAST(N'2023-11-16' AS Date), 47, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (9, N'rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit', CAST(232005.00 AS Decimal(8, 2)), CAST(N'2022-01-19' AS Date), 43, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (10, N'pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo', CAST(285788.00 AS Decimal(8, 2)), CAST(N'2023-04-27' AS Date), 17, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (11, N'odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer', CAST(43893.00 AS Decimal(8, 2)), CAST(N'2022-05-23' AS Date), 26, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (12, N'ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit', CAST(118935.00 AS Decimal(8, 2)), CAST(N'2022-08-19' AS Date), 34, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (13, N'luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis', CAST(111478.00 AS Decimal(8, 2)), CAST(N'2022-07-04' AS Date), 36, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (14, N'augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus', CAST(65120.00 AS Decimal(8, 2)), CAST(N'2022-02-18' AS Date), 17, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (15, N'iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit', CAST(191083.00 AS Decimal(8, 2)), CAST(N'2023-02-16' AS Date), 34, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (16, N'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor', CAST(83173.00 AS Decimal(8, 2)), CAST(N'2022-02-06' AS Date), 11, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (17, N'nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede', CAST(213703.00 AS Decimal(8, 2)), CAST(N'2022-02-24' AS Date), 27, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (18, N'nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.', CAST(49834.00 AS Decimal(8, 2)), CAST(N'2022-02-27' AS Date), 47, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (19, N'purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada', CAST(213633.00 AS Decimal(8, 2)), CAST(N'2022-03-21' AS Date), 24, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (20, N'convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper', CAST(265132.00 AS Decimal(8, 2)), CAST(N'2022-08-30' AS Date), 23, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (21, N'pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac', CAST(209750.00 AS Decimal(8, 2)), CAST(N'2021-12-24' AS Date), 39, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (22, N'Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus.', CAST(176849.00 AS Decimal(8, 2)), CAST(N'2022-11-23' AS Date), 44, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (23, N'ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem', CAST(151164.00 AS Decimal(8, 2)), CAST(N'2022-09-05' AS Date), 27, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (24, N'varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin', CAST(140632.00 AS Decimal(8, 2)), CAST(N'2022-03-08' AS Date), 17, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (25, N'odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,', CAST(74217.00 AS Decimal(8, 2)), CAST(N'2023-07-04' AS Date), 3, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (26, N'pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis', CAST(108049.00 AS Decimal(8, 2)), CAST(N'2022-03-30' AS Date), 10, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (27, N'aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.', CAST(100147.00 AS Decimal(8, 2)), CAST(N'2022-03-08' AS Date), 6, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (28, N'leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.', CAST(190537.00 AS Decimal(8, 2)), CAST(N'2022-07-18' AS Date), 27, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (29, N'mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit', CAST(161858.00 AS Decimal(8, 2)), CAST(N'2023-01-12' AS Date), 21, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (30, N'nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem', CAST(188895.00 AS Decimal(8, 2)), CAST(N'2022-01-23' AS Date), 47, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (31, N'dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis', CAST(103345.00 AS Decimal(8, 2)), CAST(N'2021-12-30' AS Date), 15, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (32, N'eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero.', CAST(53835.00 AS Decimal(8, 2)), CAST(N'2023-08-07' AS Date), 26, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (33, N'Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc.', CAST(185432.00 AS Decimal(8, 2)), CAST(N'2023-06-22' AS Date), 10, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (34, N'ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer', CAST(30976.00 AS Decimal(8, 2)), CAST(N'2022-09-03' AS Date), 38, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (35, N'sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,', CAST(137112.00 AS Decimal(8, 2)), CAST(N'2022-12-04' AS Date), 42, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (36, N'Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis', CAST(282782.00 AS Decimal(8, 2)), CAST(N'2022-09-25' AS Date), 43, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (37, N'dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique', CAST(257874.00 AS Decimal(8, 2)), CAST(N'2023-10-20' AS Date), 31, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (38, N'nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.', CAST(171947.00 AS Decimal(8, 2)), CAST(N'2023-10-24' AS Date), 9, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (39, N'nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed', CAST(198182.00 AS Decimal(8, 2)), CAST(N'2023-01-27' AS Date), 31, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (40, N'ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.', CAST(109474.00 AS Decimal(8, 2)), CAST(N'2022-07-07' AS Date), 1, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (41, N'vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla', CAST(118348.00 AS Decimal(8, 2)), CAST(N'2022-07-05' AS Date), 2, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (42, N'arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin', CAST(114836.00 AS Decimal(8, 2)), CAST(N'2023-04-09' AS Date), 19, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (43, N'quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue', CAST(194047.00 AS Decimal(8, 2)), CAST(N'2023-10-13' AS Date), 46, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (44, N'at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac', CAST(117540.00 AS Decimal(8, 2)), CAST(N'2022-07-24' AS Date), 20, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (45, N'malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum.', CAST(30798.00 AS Decimal(8, 2)), CAST(N'2023-02-14' AS Date), 1, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (46, N'ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat', CAST(147913.00 AS Decimal(8, 2)), CAST(N'2022-07-24' AS Date), 46, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (47, N'lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci', CAST(162043.00 AS Decimal(8, 2)), CAST(N'2023-08-14' AS Date), 16, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (48, N'non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(49539.00 AS Decimal(8, 2)), CAST(N'2022-04-29' AS Date), 39, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (49, N'et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam', CAST(35950.00 AS Decimal(8, 2)), CAST(N'2022-03-18' AS Date), 36, NULL, NULL)
INSERT [dbo].[movimiento] ([id_movimiento], [concepto], [monto], [fecha], [legajo_cajera], [created_at], [updated_at]) VALUES (50, N'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue', CAST(127446.00 AS Decimal(8, 2)), CAST(N'2022-03-25' AS Date), 46, NULL, NULL)
SET IDENTITY_INSERT [dbo].[movimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[operacion] ON 

INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (1, CAST(N'2022-11-14' AS Date), N'transferencia', N'venta', N'https://twitter.com/group/9', N'pen', CAST(177703.00 AS Decimal(8, 2)), CAST(68.00 AS Decimal(8, 2)), 36, 40, 14, NULL, NULL, 7)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (2, CAST(N'2022-10-16' AS Date), N'transferencia', N'venta', N'https://guardian.co.uk/fr', N'usdt', CAST(384719.00 AS Decimal(8, 2)), CAST(28.00 AS Decimal(8, 2)), 45, 34, 29, NULL, NULL, 28)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (3, CAST(N'2022-09-06' AS Date), N'transferencia', N'venta', N'http://baidu.com/en-us', N'usdt', CAST(494714.00 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 23, 44, 33, NULL, NULL, 12)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (4, CAST(N'2022-06-28' AS Date), N'transferencia', N'movimiento', N'https://facebook.com/sub', N'usd', CAST(899729.00 AS Decimal(8, 2)), CAST(69.00 AS Decimal(8, 2)), 50, 35, 1, NULL, NULL, 12)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (5, CAST(N'2021-12-05' AS Date), N'transferencia', N'movimiento', N'https://facebook.com/sub', N'aud', CAST(76724.00 AS Decimal(8, 2)), CAST(43.00 AS Decimal(8, 2)), 6, 33, 9, NULL, NULL, 34)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (6, CAST(N'2023-02-22' AS Date), N'cheque', N'venta', N'http://whatsapp.com/en-ca', N'ars', CAST(83885.00 AS Decimal(8, 2)), CAST(53.00 AS Decimal(8, 2)), 26, 43, 2, NULL, NULL, 30)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (7, CAST(N'2023-07-02' AS Date), N'cheque', N'venta', N'https://zoom.us/fr', N'ars', CAST(627355.00 AS Decimal(8, 2)), CAST(39.00 AS Decimal(8, 2)), 20, 3, 10, NULL, NULL, 5)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (8, CAST(N'2022-10-21' AS Date), N'cheque', N'venta', N'https://ebay.com/one', N'cad', CAST(439724.00 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), 14, 13, 19, NULL, NULL, 21)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (9, CAST(N'2022-01-05' AS Date), N'transferencia', N'alquiler', N'http://instagram.com/site', N'ars', CAST(442850.00 AS Decimal(8, 2)), CAST(94.00 AS Decimal(8, 2)), 36, 5, 47, NULL, NULL, 26)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (10, CAST(N'2022-02-16' AS Date), N'cheque', N'movimiento', N'http://twitter.com/en-ca', N'usdt', CAST(572408.00 AS Decimal(8, 2)), CAST(32.00 AS Decimal(8, 2)), 21, 6, 10, NULL, NULL, 7)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (11, CAST(N'2023-05-24' AS Date), N'cheque', N'movimiento', N'https://twitter.com/en-us', N'ars', CAST(855130.00 AS Decimal(8, 2)), CAST(22.00 AS Decimal(8, 2)), 10, 22, 11, NULL, NULL, 18)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (12, CAST(N'2022-08-24' AS Date), N'efectivo', N'movimiento', N'https://yahoo.com/site', N'cad', CAST(573009.00 AS Decimal(8, 2)), CAST(29.00 AS Decimal(8, 2)), 44, 31, 7, NULL, NULL, 26)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (13, CAST(N'2023-03-06' AS Date), N'efectivo', N'movimiento', N'https://whatsapp.com/fr', N'ars', CAST(50119.00 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), 44, 32, 18, NULL, NULL, 20)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (14, CAST(N'2022-09-08' AS Date), N'transferencia', N'alquiler', N'https://naver.com/sub', N'pen', CAST(687409.00 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 29, 24, 27, NULL, NULL, 24)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (15, CAST(N'2023-07-15' AS Date), N'cheque', N'movimiento', N'https://baidu.com/en-ca', N'aud', CAST(784885.00 AS Decimal(8, 2)), CAST(79.00 AS Decimal(8, 2)), 34, 10, 15, NULL, NULL, 23)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (16, CAST(N'2022-09-24' AS Date), N'cheque', N'movimiento', N'http://guardian.co.uk/one', N'aud', CAST(852786.00 AS Decimal(8, 2)), CAST(38.00 AS Decimal(8, 2)), 23, 47, 15, NULL, NULL, 18)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (17, CAST(N'2022-02-09' AS Date), N'efectivo', N'movimiento', N'https://pinterest.com/group/9', N'aud', CAST(577865.00 AS Decimal(8, 2)), CAST(48.00 AS Decimal(8, 2)), 25, 24, 9, NULL, NULL, 20)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (18, CAST(N'2021-12-17' AS Date), N'efectivo', N'venta', N'https://instagram.com/en-us', N'usd', CAST(333377.00 AS Decimal(8, 2)), CAST(71.00 AS Decimal(8, 2)), 50, 35, 21, NULL, NULL, 25)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (19, CAST(N'2021-12-30' AS Date), N'transferencia', N'movimiento', N'http://instagram.com/fr', N'btc', CAST(377496.00 AS Decimal(8, 2)), CAST(61.00 AS Decimal(8, 2)), 22, 8, 28, NULL, NULL, 16)
INSERT [dbo].[operacion] ([id_operacion], [fecha], [forma_pago], [tipo], [archivo], [moneda_cotizacion], [monto], [comision_agente], [legajo_cajera], [legajo_agente], [id_cliente], [created_at], [updated_at], [codigo_propiedad]) VALUES (20, CAST(N'2023-03-17' AS Date), N'transferencia', N'venta', N'http://wikipedia.org/sub/cars', N'pen', CAST(466938.00 AS Decimal(8, 2)), CAST(23.00 AS Decimal(8, 2)), 23, 26, 9, NULL, NULL, 15)
SET IDENTITY_INSERT [dbo].[operacion] OFF
GO
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (1, 2, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (2, 9, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (3, 3, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (3, 6, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (4, 3, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (5, 23, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (7, 6, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (8, 9, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (9, 19, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (10, 8, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (11, 20, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (12, 5, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (13, 20, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (14, 4, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (15, 16, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (16, 14, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (17, 18, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (18, 20, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (19, 9, NULL, NULL)
INSERT [dbo].[operacion_movimiento] ([id_operacion], [id_movimiento], [created_at], [updated_at]) VALUES (20, 20, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[propiedad] ON 

INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (1, N'830-7087 Nunc Avenue', N'529', 0, N'iaculis odio. Nam interdum enim non nisi. Aenean eget metus.', CAST(46894.00 AS Decimal(8, 2)), CAST(54.00 AS Decimal(8, 2)), CAST(224.00 AS Decimal(8, 2)), 0, 1, 0, 0, 2, 197, CAST(N'2018-09-07' AS Date), 28, 27, 33, 13, 3, 10, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (2, N'Ap #845-8072 Consectetuer, St.', N'132', 1, N'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam', CAST(53379.00 AS Decimal(8, 2)), CAST(246.00 AS Decimal(8, 2)), CAST(405.00 AS Decimal(8, 2)), 1, 1, 0, 1, 3, 111, CAST(N'1994-05-07' AS Date), 6, 21, 5, 33, 1, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (3, N'1361 Donec Road', N'245', 0, N'erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla', CAST(56334.00 AS Decimal(8, 2)), CAST(95.00 AS Decimal(8, 2)), CAST(106.00 AS Decimal(8, 2)), 1, 1, 0, 1, 4, 115, CAST(N'2009-09-09' AS Date), 95, 34, 8, 10, 1, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (4, N'986 Pharetra St.', N'37', 0, N'a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros', CAST(72399.00 AS Decimal(8, 2)), CAST(79.00 AS Decimal(8, 2)), CAST(37.00 AS Decimal(8, 2)), 1, 1, 1, 0, 3, 157, CAST(N'2006-10-04' AS Date), 97, 12, 18, 34, 2, 3, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (5, N'325-1287 Ante Avenue', N'827', 0, N'rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed', CAST(49059.00 AS Decimal(8, 2)), CAST(370.00 AS Decimal(8, 2)), CAST(253.00 AS Decimal(8, 2)), 1, 0, 0, 1, 7, 124, CAST(N'1993-01-16' AS Date), 78, 17, 8, 41, 1, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (6, N'P.O. Box 754, 8473 Neque Rd.', N'588', 0, N'fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada', CAST(61048.00 AS Decimal(8, 2)), CAST(121.00 AS Decimal(8, 2)), CAST(94.00 AS Decimal(8, 2)), 1, 1, 0, 0, 3, 96, CAST(N'2016-05-14' AS Date), 78, 27, 41, 5, 2, 7, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (7, N'339-6093 Sed Street', N'295', 0, N'egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum', CAST(63449.00 AS Decimal(8, 2)), CAST(215.00 AS Decimal(8, 2)), CAST(113.00 AS Decimal(8, 2)), 1, 0, 0, 0, 1, 194, CAST(N'2006-06-03' AS Date), 25, 28, 3, 12, 3, 3, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (8, N'198-4295 Ipsum. St.', N'304', 1, N'turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.', CAST(72577.00 AS Decimal(8, 2)), CAST(149.00 AS Decimal(8, 2)), CAST(453.00 AS Decimal(8, 2)), 1, 1, 1, 0, 2, 72, CAST(N'2002-11-02' AS Date), 31, 14, 7, 42, 4, 7, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (9, N'551-6312 Natoque Street', N'763', 0, N'eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean', CAST(66697.00 AS Decimal(8, 2)), CAST(195.00 AS Decimal(8, 2)), CAST(92.00 AS Decimal(8, 2)), 0, 1, 1, 0, 9, 126, CAST(N'1992-08-16' AS Date), 86, 34, 20, 35, 1, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (10, N'532-7475 Donec Ave', N'109', 0, N'sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a', CAST(86322.00 AS Decimal(8, 2)), CAST(349.00 AS Decimal(8, 2)), CAST(100.00 AS Decimal(8, 2)), 0, 1, 0, 0, 7, 23, CAST(N'2010-12-18' AS Date), 69, 42, 48, 14, 4, 7, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (11, N'3235 Curabitur Road', N'325', 1, N'Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', CAST(39939.00 AS Decimal(8, 2)), CAST(174.00 AS Decimal(8, 2)), CAST(496.00 AS Decimal(8, 2)), 1, 0, 1, 1, 9, 193, CAST(N'2016-07-22' AS Date), 2, 13, 38, 10, 1, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (12, N'509-4290 Dui. Rd.', N'219', 0, N'dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes,', CAST(94805.00 AS Decimal(8, 2)), CAST(376.00 AS Decimal(8, 2)), CAST(303.00 AS Decimal(8, 2)), 0, 0, 0, 1, 5, 92, CAST(N'2008-09-04' AS Date), 79, 22, 35, 45, 4, 7, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (13, N'Ap #498-5337 Nunc Street', N'568', 1, N'Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,', CAST(32109.00 AS Decimal(8, 2)), CAST(373.00 AS Decimal(8, 2)), CAST(489.00 AS Decimal(8, 2)), 1, 0, 1, 0, 6, 18, CAST(N'1995-05-22' AS Date), 54, 42, 35, 24, 2, 1, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (14, N'Ap #804-2496 Aliquam St.', N'300', 0, N'fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio', CAST(88469.00 AS Decimal(8, 2)), CAST(210.00 AS Decimal(8, 2)), CAST(60.00 AS Decimal(8, 2)), 0, 1, 0, 1, 1, 17, CAST(N'2003-10-02' AS Date), 12, 35, 23, 22, 2, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (15, N'461-7470 Ac Ave', N'735', 1, N'litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.', CAST(61859.00 AS Decimal(8, 2)), CAST(221.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), 1, 0, 1, 1, 0, 75, CAST(N'2005-09-16' AS Date), 87, 46, 33, 36, 3, 3, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (16, N'Ap #157-743 Ultrices Rd.', N'126', 0, N'elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna', CAST(20030.00 AS Decimal(8, 2)), CAST(76.00 AS Decimal(8, 2)), CAST(233.00 AS Decimal(8, 2)), 1, 0, 1, 1, 5, 66, CAST(N'2022-04-07' AS Date), 59, 42, 31, 41, 3, 7, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (17, N'889-3807 Adipiscing St.', N'434', 0, N'Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et', CAST(65672.00 AS Decimal(8, 2)), CAST(209.00 AS Decimal(8, 2)), CAST(106.00 AS Decimal(8, 2)), 1, 1, 0, 1, 9, 165, CAST(N'1993-07-25' AS Date), 74, 21, 23, 3, 3, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (18, N'400-1381 Vel, Rd.', N'930', 0, N'Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit', CAST(30687.00 AS Decimal(8, 2)), CAST(130.00 AS Decimal(8, 2)), CAST(381.00 AS Decimal(8, 2)), 0, 0, 0, 0, 9, 136, CAST(N'1997-08-18' AS Date), 88, 20, 28, 28, 1, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (19, N'P.O. Box 345, 7396 Sit Road', N'832', 1, N'non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim', CAST(84506.00 AS Decimal(8, 2)), CAST(392.00 AS Decimal(8, 2)), CAST(319.00 AS Decimal(8, 2)), 0, 1, 1, 0, 0, 32, CAST(N'2014-06-26' AS Date), 3, 9, 13, 47, 2, 4, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (20, N'6347 Id, Street', N'550', 0, N'iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla.', CAST(16352.00 AS Decimal(8, 2)), CAST(245.00 AS Decimal(8, 2)), CAST(47.00 AS Decimal(8, 2)), 0, 0, 0, 0, 1, 14, CAST(N'2000-10-13' AS Date), 51, 15, 20, 35, 4, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (21, N'3083 Torquent Rd.', N'329', 1, N'Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante', CAST(43926.00 AS Decimal(8, 2)), CAST(101.00 AS Decimal(8, 2)), CAST(205.00 AS Decimal(8, 2)), 0, 1, 1, 1, 5, 123, CAST(N'2012-01-14' AS Date), 95, 17, 37, 36, 2, 8, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (22, N'Ap #264-9456 Amet St.', N'266', 0, N'consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id', CAST(89835.00 AS Decimal(8, 2)), CAST(376.00 AS Decimal(8, 2)), CAST(282.00 AS Decimal(8, 2)), 0, 1, 1, 1, 2, 135, CAST(N'1992-08-28' AS Date), 57, 27, 5, 12, 3, 4, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (23, N'Ap #546-2914 Mauris Rd.', N'510', 1, N'et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id,', CAST(93535.00 AS Decimal(8, 2)), CAST(290.00 AS Decimal(8, 2)), CAST(78.00 AS Decimal(8, 2)), 0, 0, 1, 0, 3, 31, CAST(N'2016-11-02' AS Date), 5, 6, 25, 8, 2, 2, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (24, N'Ap #436-8091 Pretium Avenue', N'77', 1, N'sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum', CAST(71796.00 AS Decimal(8, 2)), CAST(369.00 AS Decimal(8, 2)), CAST(129.00 AS Decimal(8, 2)), 1, 1, 1, 0, 10, 3, CAST(N'2004-03-27' AS Date), 49, 35, 27, 30, 3, 2, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (25, N'P.O. Box 534, 9802 Tempus Ave', N'35', 1, N'velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi', CAST(21093.00 AS Decimal(8, 2)), CAST(291.00 AS Decimal(8, 2)), CAST(492.00 AS Decimal(8, 2)), 0, 1, 1, 1, 3, 99, CAST(N'2011-05-14' AS Date), 4, 2, 38, 21, 3, 8, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (26, N'894-5623 Ut Ave', N'187', 0, N'lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla', CAST(16054.00 AS Decimal(8, 2)), CAST(68.00 AS Decimal(8, 2)), CAST(151.00 AS Decimal(8, 2)), 1, 0, 0, 0, 10, 40, CAST(N'2008-01-14' AS Date), 50, 39, 20, 14, 1, 8, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (27, N'9858 Ante Rd.', N'24', 0, N'sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec', CAST(50607.00 AS Decimal(8, 2)), CAST(92.00 AS Decimal(8, 2)), CAST(186.00 AS Decimal(8, 2)), 1, 0, 1, 0, 7, 105, CAST(N'2017-06-04' AS Date), 31, 16, 11, 36, 2, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (28, N'Ap #519-4799 Dolor, Rd.', N'105', 1, N'nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum', CAST(27554.00 AS Decimal(8, 2)), CAST(242.00 AS Decimal(8, 2)), CAST(88.00 AS Decimal(8, 2)), 0, 1, 0, 1, 9, 119, CAST(N'2014-12-12' AS Date), 72, 45, 13, 44, 3, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (29, N'Ap #921-7254 Urna. St.', N'724', 0, N'Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue.', CAST(25284.00 AS Decimal(8, 2)), CAST(266.00 AS Decimal(8, 2)), CAST(141.00 AS Decimal(8, 2)), 1, 0, 0, 1, 8, 125, CAST(N'2006-06-14' AS Date), 85, 47, 42, 35, 3, 5, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (30, N'Ap #914-398 Euismod Ave', N'644', 1, N'consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque', CAST(46137.00 AS Decimal(8, 2)), CAST(289.00 AS Decimal(8, 2)), CAST(384.00 AS Decimal(8, 2)), 0, 1, 0, 1, 2, 47, CAST(N'2007-11-21' AS Date), 36, 25, 39, 19, 2, 6, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (31, N'Ap #499-7746 Velit Road', N'911', 1, N'Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla', CAST(53400.00 AS Decimal(8, 2)), CAST(206.00 AS Decimal(8, 2)), CAST(456.00 AS Decimal(8, 2)), 1, 1, 1, 0, 3, 86, CAST(N'2020-07-11' AS Date), 7, 3, 40, 7, 1, 2, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (32, N'P.O. Box 672, 1578 Quisque St.', N'397', 1, N'Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.', CAST(60922.00 AS Decimal(8, 2)), CAST(466.00 AS Decimal(8, 2)), CAST(368.00 AS Decimal(8, 2)), 0, 0, 1, 0, 6, 192, CAST(N'1999-03-27' AS Date), 9, 40, 19, 23, 3, 4, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (33, N'304-9620 Et, Street', N'979', 1, N'ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas', CAST(63467.00 AS Decimal(8, 2)), CAST(406.00 AS Decimal(8, 2)), CAST(442.00 AS Decimal(8, 2)), 1, 0, 0, 1, 3, 80, CAST(N'2000-06-12' AS Date), 53, 11, 7, 46, 2, 8, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (34, N'650-2091 Facilisis. Av.', N'359', 0, N'Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique', CAST(76246.00 AS Decimal(8, 2)), CAST(166.00 AS Decimal(8, 2)), CAST(342.00 AS Decimal(8, 2)), 1, 1, 0, 1, 4, 86, CAST(N'1992-08-18' AS Date), 94, 24, 9, 42, 2, 9, NULL, NULL)
INSERT [dbo].[propiedad] ([codigo_propiedad], [calle], [altura], [disponibilidad], [descripcion], [precio_inmueble], [superficie_total], [superficie_cubierta], [servicio_internet], [servicio_agua], [servicio_gas], [servicio_electricidad], [piso_dpto], [numero_dpto], [fecha_construccion], [cant_artefactos], [id_cliente_propietario], [id_provincia], [id_localidad], [id_tipo_propiedad], [legajo_marketing], [created_at], [updated_at]) VALUES (35, N'3106 Posuere St.', N'291', 1, N'tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus', CAST(84937.00 AS Decimal(8, 2)), CAST(105.00 AS Decimal(8, 2)), CAST(411.00 AS Decimal(8, 2)), 1, 0, 0, 0, 2, 71, CAST(N'2014-11-01' AS Date), 19, 47, 25, 1, 1, 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[propiedad] OFF
GO
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (2, N'https://wikipedia.org/settings', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (3, N'https://bbc.co.uk/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (6, N'http://netflix.com/en-ca', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (8, N'ftp://domus.br/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (8, N'ftp://ebay.com/sub', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (8, N'https://youtube.com/image', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (9, N'ftp://wikipedia.org/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (9, N'http://domus.br/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (9, N'https://domus.com/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (9, N'https://google.com/user/110', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (11, N'ftp://pinterest.com/en-ca', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (12, N'https://domus.ar/user/110', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (12, N'https://reddit.com/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (13, N'http://google.com/sub/cars', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (13, N'https://wikipedia.org/en-us', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (14, N'ftp://nytimes.com/fr', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (14, N'ftp://reddit.com/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (14, N'https://twitter.com/sub', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (18, N'ftp://domus.br/site', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (20, N'ftp://baidu.com/sub/cars', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (23, N'ftp://facebook.com/group/9', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (23, N'http://instagram.com/image/property', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (24, N'https://cnn.com/sub', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (27, N'ftp://walmart.com/user/110', NULL, NULL)
INSERT [dbo].[propiedad_foto] ([codigo_propiedad], [foto], [created_at], [updated_at]) VALUES (30, N'https://netflix.com/image', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 

INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (1, N'Konya', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (2, N'Montgomeryshire', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (3, N'Querétaro', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (4, N'East Kalimantan', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (5, N'Slaskie', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (6, N'Montana', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (7, N'Cheshire', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (8, N'Guerrero', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (9, N'Ivano-Frankivsk oblast', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (10, N'Phú Yên', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (11, N'Vestland', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (12, N'Huábei', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (13, N'Western Cape', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (14, N'San Luis Potosí', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (15, N'Puno', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (16, N'Madrid', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (17, N'Guanajuato', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (18, N'Gauteng', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (19, N'Huádong', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (20, N'Malopolskie', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (21, N'KwaZulu-Natal', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (22, N'Vienna', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (23, N'Alajuela', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (24, N'Ceará', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (25, N'Balochistan', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (26, N'Wiltshire', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (27, N'Maule', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (28, N'North Island', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (29, N'Overijssel', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (30, N'Leinster', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (31, N'Kayseri', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (32, N'North-East Region', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (33, N'Central Region', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (34, N'Bretagne', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (35, N'Northern Cape', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (36, N'North Island', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (37, N'Heredia', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (38, N'Zhytomyr oblast', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (39, N'Izmir', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (40, N'Free State', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (41, N'Cagayan Valley', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (42, N'Ceará', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (43, N'Cajamarca', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (44, N'Long An', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (45, N'Samara Oblast', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (46, N'Extremadura', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (47, N'Podkarpackie', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (48, N'Niger', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (49, N'Córdoba', NULL, NULL)
INSERT [dbo].[provincia] ([id_provincia], [nombre], [created_at], [updated_at]) VALUES (50, N'Los Ríos', NULL, NULL)
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_propiedad] ON 

INSERT [dbo].[tipo_propiedad] ([id_tipo_propiedad], [name], [created_at], [updated_at]) VALUES (1, N'departamento', NULL, NULL)
INSERT [dbo].[tipo_propiedad] ([id_tipo_propiedad], [name], [created_at], [updated_at]) VALUES (2, N'quincho', NULL, NULL)
INSERT [dbo].[tipo_propiedad] ([id_tipo_propiedad], [name], [created_at], [updated_at]) VALUES (3, N'casa', NULL, NULL)
INSERT [dbo].[tipo_propiedad] ([id_tipo_propiedad], [name], [created_at], [updated_at]) VALUES (4, N'chalet', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tipo_propiedad] OFF
GO
INSERT [dbo].[venta] ([id_operacion], [tipo_venta], [comision_agente], [created_at], [updated_at]) VALUES (11, N'total', CAST(13.00 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[venta] ([id_operacion], [tipo_venta], [comision_agente], [created_at], [updated_at]) VALUES (12, N'financiada', CAST(78.00 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[venta] ([id_operacion], [tipo_venta], [comision_agente], [created_at], [updated_at]) VALUES (14, N'financiada', CAST(3.00 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[venta] ([id_operacion], [tipo_venta], [comision_agente], [created_at], [updated_at]) VALUES (15, N'total', CAST(20.00 AS Decimal(8, 2)), NULL, NULL)
INSERT [dbo].[venta] ([id_operacion], [tipo_venta], [comision_agente], [created_at], [updated_at]) VALUES (19, N'total', CAST(12.00 AS Decimal(8, 2)), NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [cliente_correo_electronico_unique]    Script Date: 21/11/2022 14:51:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [cliente_correo_electronico_unique] ON [dbo].[cliente]
(
	[correo_electronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [empleado_email_unique]    Script Date: 21/11/2022 14:51:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [empleado_email_unique] ON [dbo].[empleado]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_token_unique]    Script Date: 21/11/2022 14:51:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique] ON [dbo].[personal_access_tokens]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_type_tokenable_id_index]    Script Date: 21/11/2022 14:51:55 ******/
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_type_tokenable_id_index] ON [dbo].[personal_access_tokens]
(
	[tokenable_type] ASC,
	[tokenable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[propiedad] ADD  DEFAULT ('1') FOR [disponibilidad]
GO
ALTER TABLE [dbo].[propiedad] ADD  DEFAULT ('0') FOR [servicio_internet]
GO
ALTER TABLE [dbo].[propiedad] ADD  DEFAULT ('0') FOR [servicio_agua]
GO
ALTER TABLE [dbo].[propiedad] ADD  DEFAULT ('0') FOR [servicio_gas]
GO
ALTER TABLE [dbo].[propiedad] ADD  DEFAULT ('0') FOR [servicio_electricidad]
GO
ALTER TABLE [dbo].[alquiler]  WITH CHECK ADD  CONSTRAINT [alquiler_id_operacion_foreign] FOREIGN KEY([id_operacion])
REFERENCES [dbo].[operacion] ([id_operacion])
GO
ALTER TABLE [dbo].[alquiler] CHECK CONSTRAINT [alquiler_id_operacion_foreign]
GO
ALTER TABLE [dbo].[ambiente]  WITH CHECK ADD  CONSTRAINT [ambiente_codigo_propiedad_foreign] FOREIGN KEY([codigo_propiedad])
REFERENCES [dbo].[propiedad] ([codigo_propiedad])
GO
ALTER TABLE [dbo].[ambiente] CHECK CONSTRAINT [ambiente_codigo_propiedad_foreign]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [cita_codigo_inmueble_foreign] FOREIGN KEY([codigo_inmueble])
REFERENCES [dbo].[propiedad] ([codigo_propiedad])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [cita_codigo_inmueble_foreign]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [cita_id_cliente_foreign] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [cita_id_cliente_foreign]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [cita_legajo_agente_foreign] FOREIGN KEY([legajo_agente])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [cita_legajo_agente_foreign]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [cita_legajo_secretaria_foreign] FOREIGN KEY([legajo_secretaria])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [cita_legajo_secretaria_foreign]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [cliente_legajo_secretaria_foreign] FOREIGN KEY([legajo_secretaria])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [cliente_legajo_secretaria_foreign]
GO
ALTER TABLE [dbo].[departamento]  WITH CHECK ADD  CONSTRAINT [departamento_legajo_director_foreign] FOREIGN KEY([legajo_director])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[departamento] CHECK CONSTRAINT [departamento_legajo_director_foreign]
GO
ALTER TABLE [dbo].[documentacion]  WITH CHECK ADD  CONSTRAINT [documentacion_id_cliente_foreign] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[documentacion] CHECK CONSTRAINT [documentacion_id_cliente_foreign]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [empleado_id_area_foreign] FOREIGN KEY([id_area])
REFERENCES [dbo].[departamento] ([id_area])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [empleado_id_area_foreign]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [factura_id_operacion_foreign] FOREIGN KEY([id_operacion])
REFERENCES [dbo].[operacion] ([id_operacion])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [factura_id_operacion_foreign]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [movimiento_legajo_cajera_foreign] FOREIGN KEY([legajo_cajera])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [movimiento_legajo_cajera_foreign]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [operacion_codigo_propiedad_foreign] FOREIGN KEY([codigo_propiedad])
REFERENCES [dbo].[propiedad] ([codigo_propiedad])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [operacion_codigo_propiedad_foreign]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [operacion_id_cliente_foreign] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [operacion_id_cliente_foreign]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [operacion_legajo_agente_foreign] FOREIGN KEY([legajo_agente])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [operacion_legajo_agente_foreign]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [operacion_legajo_cajera_foreign] FOREIGN KEY([legajo_cajera])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [operacion_legajo_cajera_foreign]
GO
ALTER TABLE [dbo].[operacion_movimiento]  WITH CHECK ADD  CONSTRAINT [operacion_movimiento_id_movimiento_foreign] FOREIGN KEY([id_movimiento])
REFERENCES [dbo].[movimiento] ([id_movimiento])
GO
ALTER TABLE [dbo].[operacion_movimiento] CHECK CONSTRAINT [operacion_movimiento_id_movimiento_foreign]
GO
ALTER TABLE [dbo].[operacion_movimiento]  WITH CHECK ADD  CONSTRAINT [operacion_movimiento_id_operacion_foreign] FOREIGN KEY([id_operacion])
REFERENCES [dbo].[operacion] ([id_operacion])
GO
ALTER TABLE [dbo].[operacion_movimiento] CHECK CONSTRAINT [operacion_movimiento_id_operacion_foreign]
GO
ALTER TABLE [dbo].[propiedad]  WITH CHECK ADD  CONSTRAINT [propiedad_id_cliente_propietario_foreign] FOREIGN KEY([id_cliente_propietario])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[propiedad] CHECK CONSTRAINT [propiedad_id_cliente_propietario_foreign]
GO
ALTER TABLE [dbo].[propiedad]  WITH CHECK ADD  CONSTRAINT [propiedad_id_localidad_foreign] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id_localidad])
GO
ALTER TABLE [dbo].[propiedad] CHECK CONSTRAINT [propiedad_id_localidad_foreign]
GO
ALTER TABLE [dbo].[propiedad]  WITH CHECK ADD  CONSTRAINT [propiedad_id_provincia_foreign] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
ALTER TABLE [dbo].[propiedad] CHECK CONSTRAINT [propiedad_id_provincia_foreign]
GO
ALTER TABLE [dbo].[propiedad]  WITH CHECK ADD  CONSTRAINT [propiedad_id_tipo_propiedad_foreign] FOREIGN KEY([id_tipo_propiedad])
REFERENCES [dbo].[tipo_propiedad] ([id_tipo_propiedad])
GO
ALTER TABLE [dbo].[propiedad] CHECK CONSTRAINT [propiedad_id_tipo_propiedad_foreign]
GO
ALTER TABLE [dbo].[propiedad]  WITH CHECK ADD  CONSTRAINT [propiedad_legajo_marketing_foreign] FOREIGN KEY([legajo_marketing])
REFERENCES [dbo].[empleado] ([legajo])
GO
ALTER TABLE [dbo].[propiedad] CHECK CONSTRAINT [propiedad_legajo_marketing_foreign]
GO
ALTER TABLE [dbo].[propiedad_foto]  WITH CHECK ADD  CONSTRAINT [propiedad_foto_codigo_propiedad_foreign] FOREIGN KEY([codigo_propiedad])
REFERENCES [dbo].[propiedad] ([codigo_propiedad])
GO
ALTER TABLE [dbo].[propiedad_foto] CHECK CONSTRAINT [propiedad_foto_codigo_propiedad_foreign]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [venta_id_operacion_foreign] FOREIGN KEY([id_operacion])
REFERENCES [dbo].[operacion] ([id_operacion])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [venta_id_operacion_foreign]
GO
USE [master]
GO
ALTER DATABASE [Domus] SET  READ_WRITE 
GO
