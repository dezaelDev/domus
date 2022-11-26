import {
	connection,
	sql,
	generateParamsByValues,
} from '../database/connection';

const fillable = [];

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

export const createRealEstate = async (body) => {
	try {
		const data = generateQuery(body);

		const pool = await connection();

		// let params = data.values.map((_, i) => `@param_${i}`); //FUNCTION generateParamsByValues

		const params = generateParamsByValues(data.values);

		let sqlquery;
		let request = pool.request();
		for (let i = 0; i < data.values.length; i++) {
			request.input(`param_${i}`, data.values[i]);
		}

		sqlquery = `INSERT INTO ${tableName}(${data.fields}) values (${params})`;

		const result = await request.query(sqlquery);

		return result.rowsAffected;
	} catch (error) {
		console.log(error);
	}
};

const generateQuery = (body) => {
	let fields = [];
	let values = [];

	for (var key in body) {
		if (!fillable.includes(key)) {
			delete body.key;
		} else {
			if (body[key] == '' || body[key] == null) {
				delete body.key;
			} else {
				fields.push(key);
				values.push(body[key]);
			}
		}
	}

	return { fields: fields, values: values };
};
