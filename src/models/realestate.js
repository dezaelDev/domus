import {
	connection,
	generateParamsByValues,
	sql,
} from '../database/connection';
const Validator = require('Validator');

const tableName = '[Domus].[dbo].[propiedad]';

const fillable = [
	'calle',
	'altura',
	'disponibilidad',
	'descripcion_breve',
	'descripcion_detallada',
	'precio_inmueble',
	'superficie_total',
	'superficie_cubierta',
	'servicio_internet',
	'servicio_agua',
	'servicio_gas',
	'servicio_electricidad',
	'piso_dpto',
	'numero_dpto',
	'fecha_construccion',
	'cant_artefactos',
	'id_cliente_propietario',
	'id_provincia',
	'id_localidad',
	'id_tipo_propiedad',
	'legajo_marketing',
	'fecha_publicacion',
	'tipo_oferta',
];

export const getRealEstates = async () => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(`SELECT * FROM ${tableName}`);

		return result.recordset;
	} catch (error) {}
};

/**
 *
 * @param object body contains fields and values of form
 *
 * @return int rowsAffected with amount of affected rows
 */

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

		console.log(sqlquery);

		const result = await request.query(sqlquery);

		return result.rowsAffected;
	} catch (error) {
		console.log(error);
	}
};

export const setStateById = async (id, state) => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(
				`UPDATE ${tableName} SET disponibilidad = ${state} WHERE codigo_propiedad = ${id}`
			);

		return result.recordset;
	} catch (error) {
		console.log(error);
	}
};

/**
 *
 * @param object body contains fields and values of form
 *
 * @return 	object containing an array of fields and an array of values
 * 			string object.fields
 * 			any object.values
 *
 */
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
