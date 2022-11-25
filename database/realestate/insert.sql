USE [Domus]
GO

INSERT INTO [dbo].[propiedad]
           ([calle]
           ,[altura]
           ,[disponibilidad]
           ,[descripcion_breve]
           ,[descripcion_detallada]
           ,[precio_inmueble]
           ,[superficie_total]
           ,[superficie_cubierta]
           ,[servicio_internet]
           ,[servicio_agua]
           ,[servicio_gas]
           ,[servicio_electricidad]
           ,[piso_dpto]
           ,[numero_dpto]
           ,[fecha_construccion]
           ,[cant_artefactos]
           ,[id_cliente_propietario]
           ,[id_provincia]
           ,[id_localidad]
           ,[id_tipo_propiedad]
           ,[legajo_marketing]
           ,[fecha_publicacion]
           ,[tipo_oferta])
     VALUES
           (<calle, nvarchar(255),>
           ,<altura, nvarchar(50),>
           ,<disponibilidad, bit,>
           ,<descripcion_breve, nvarchar(max),>
           ,<descripcion_detallada, nvarchar(max),>
           ,<precio_inmueble, decimal(8,2),>
           ,<superficie_total, decimal(8,2),>
           ,<superficie_cubierta, decimal(8,2),>
           ,<servicio_internet, bit,>
           ,<servicio_agua, bit,>
           ,<servicio_gas, bit,>
           ,<servicio_electricidad, bit,>
           ,<piso_dpto, int,>
           ,<numero_dpto, int,>
           ,<fecha_construccion, date,>
           ,<cant_artefactos, int,>
           ,<id_cliente_propietario, bigint,>
           ,<id_provincia, bigint,>
           ,<id_localidad, bigint,>
           ,<id_tipo_propiedad, bigint,>
           ,<legajo_marketing, bigint,>
           ,<fecha_publicacion, date,>
           ,<tipo_oferta, nchar(50),>)
GO


