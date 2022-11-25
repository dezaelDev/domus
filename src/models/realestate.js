import { connection } from '../database/connection';
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
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM ${tableName}`);

	return result.recordset;
};

export const createRealEstate = async (body) => {
	try {
		const data = generateQuery(body);

		// console.log(
		// 	`INSERT INTO ${tableName} (${data.fields}) VALUES (${new Array(
		// 		data.fields.length
		// 	).fill('?')})`,
		// 	data.values
		// );

		const pool = await connection();

		// const result = await pool
		// 	.request()
		// 	.query(
		// 		`INSERT INTO ${tableName} (${
		// 			data.fields
		// 		}) VALUES (${new Array(data.fields.length).fill('?')})`,
		// 		data.values
		// 	);

		let params = data.values.map((_, i) => `@param_${i}`);

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
			fields.push(key);
			values.push(body[key]);
		}
	}

	return { fields: fields, values: values };
};
