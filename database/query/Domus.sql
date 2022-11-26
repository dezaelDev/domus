-- Catalogo

SELECT
  P.codigo_propiedad,
  P.descripcion_breve,
  P.disponibilidad,
  TP.[nombre] AS tipo,
  P.tipo_oferta,
  P.precio_inmueble,
  PR.nombre + ', ' + L.nombre AS ubicacion,
  P.calle + ', ' + P.altura AS direccion,
  P.piso_dpto,
  P.numero_dpto,
  P.fecha_construccion,
  P.superficie_total,
  P.superficie_cubierta,
  P.servicio_electricidad,
  P.servicio_agua,
  P.servicio_gas,
  P.servicio_internet,
  P.cant_artefactos,
  P.descripcion_detallada,
  P.fecha_publicacion,
FROM
  dbo.propiedad AS P JOIN
  dbo.tipo_propiedad AS TP ON
  P.id_tipo_propiedad = TP.id_tipo_propiedad JOIN
  dbo.provincia AS PR ON
  P.id_provincia = PR.id_provincia JOIN
  dbo.localidad AS L ON
  P.id_localidad = L.id_localidad;


-- Catalogo, obtener ambientes de una propiedad

SELECT
  A.nombre,
  A.superficie
FROM
  dbo.ambiente AS A
WHERE
  A.codigo_propiedad = ${};


-- Agenda secretaria

SELECT
  C.id_cita,
  C.legajo_agente,
  EA.nombre_apellido AS nombre_apellido_agente,
  C.id_cliente,
  CL.nombre_apellido AS nombre_apellido_cliente,
  CL.razon_social,
  CL.telefono,
  PR.nombre + ', ' + L.nombre AS ubicacion,
  P.calle + ', ' + P.altura AS direccion,
  A.motivo,
  C.descripcion,
  C.estado,
  C.fecha_hs
FROM
  dbo.cita AS C JOIN
  dbo.empleado AS EA ON
  C.legajo_agente = EA.legajo JOIN
  dbo.cliente AS CL ON
  C.id_cliente = CL.id_cliente JOIN
  dbo.propiedad AS P ON
  C.codigo_inmueble = P.codigo_propiedad JOIN
  dbo.provincia AS PR ON
  P.id_provincia = PR.id_provincia JOIN
  dbo.localidad AS L ON
  P.id_localidad = L.id_localidad JOIN
  dbo.actividad AS A ON
  C.id_actividad = A.id_actividad
WHERE
  C.fecha_hs = '${}';


  
-- Agenda agente

SELECT
  C.id_cita,
  C.id_cliente,
  CL.nombre_apellido AS nombre_apellido_cliente,
  CL.telefono,
  PR.nombre + ', ' + L.nombre AS ubicacion,
  P.calle + ', ' + P.altura AS direccion,
  A.motivo,
  C.descripcion,
  C.estado,
  C.fecha_hs
FROM
  dbo.cita AS C JOIN
  dbo.empleado AS EA ON
  C.legajo_agente = EA.legajo JOIN
  dbo.cliente AS CL ON
  C.id_cliente = CL.id_cliente JOIN
  dbo.propiedad AS P ON
  C.codigo_inmueble = P.codigo_propiedad JOIN
  dbo.provincia AS PR ON
  P.id_provincia = PR.id_provincia JOIN
  dbo.localidad AS L ON
  P.id_localidad = L.id_localidad JOIN
  dbo.actividad AS A ON
  C.id_actividad = A.id_actividad
WHERE
  C.legajo_agente = ${} AND
  C.fecha_hs = GETDATE();


-- Actualizar estado de propiedad

UPDATE 
  dbo.propiedad
SET
  estado = NOT ${}
WHERE
  codigo_propiedad = ${};
