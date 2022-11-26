import {
	connection,
	sql,
	generateParamsByValues,
} from '../database/connection';

export const getAppointments = async (fecha = null, agente = null) => {
	try {
		let dateQuery;
		if (fecha !== null) {
			dateQuery = `C.fecha_hs = CAST('${fecha.toString()}' AS DATE)`;
			console.log(dateQuery);
		} else {
			dateQuery = 'C.fecha_hs >= GETDATE()';
		}

		const pool = await connection();

		const result = await pool.request().query(`SELECT
  C.id_cita,
  C.id_cliente,
  EA.nombre_apellido as agente,
  CL.razon_social,
  CL.nombre_apellido AS nombre_apellido_cliente,
  CL.telefono,
  PR.nombre + ', ' + L.nombre AS ubicacion,
  P.calle + ', ' + P.altura AS direccion,
  A.motivo,
  C.descripcion,
  C.estado,
  C.fecha_hs
FROM
  [Domus].[dbo].cita AS C JOIN
  [Domus].[dbo].empleado AS EA ON
  C.legajo_agente = EA.legajo JOIN
  [Domus].[dbo].cliente AS CL ON
  C.id_cliente = CL.id_cliente JOIN
  [Domus].[dbo].propiedad AS P ON
  C.codigo_inmueble = P.codigo_propiedad JOIN
  [Domus].[dbo].provincia AS PR ON
  P.id_provincia = PR.id_provincia JOIN
  [Domus].[dbo].localidad AS L ON
  P.id_localidad = L.id_localidad JOIN
  [Domus].[dbo].actividad AS A ON
  C.id_actividad = A.id_actividad
            WHERE ${dateQuery}
            
            `);

		console.log(result.recordset);
		return result.recordset;
	} catch (error) {
		console.log(error);
	}
};
