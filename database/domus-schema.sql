USE [master]
GO
/****** Object:  Database [Domus]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[actividad]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[alquiler]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[ambiente]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[cita]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[cliente]    Script Date: 21/11/2022 15:57:55 ******/
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
	[razon_social] [nvarchar](255) NULL,
	[tipo_cliente] [nvarchar](255) NOT NULL,
	[legajo_secretaria] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[documentacion]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[empleado]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[factura]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[localidad]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[migrations]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[movimiento]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[operacion]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[operacion_movimiento]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[propiedad]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[propiedad_foto]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[provincia]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[tipo_propiedad]    Script Date: 21/11/2022 15:57:55 ******/
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
/****** Object:  Table [dbo].[venta]    Script Date: 21/11/2022 15:57:55 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [cliente_correo_electronico_unique]    Script Date: 21/11/2022 15:57:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [cliente_correo_electronico_unique] ON [dbo].[cliente]
(
	[correo_electronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [empleado_email_unique]    Script Date: 21/11/2022 15:57:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [empleado_email_unique] ON [dbo].[empleado]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_token_unique]    Script Date: 21/11/2022 15:57:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique] ON [dbo].[personal_access_tokens]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_type_tokenable_id_index]    Script Date: 21/11/2022 15:57:55 ******/
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
