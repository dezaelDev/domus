import { connection, generateParamsByValues } from '../database/connection';

const tableName = '[Domus].[dbo].[ambiente]';

const fillable = ['superficie', 'nombre', 'codigo_propiedad'];

export const getEnvironments = async (fields) => {
	const pool = await connection();
	const result = await pool.request().query(`SELECT * FROM ${tableName}`);

	return result.recordset;
};

export const createEnvironments = async (body) => {
	try {
		const data = generateQuery(body);
		console.log('save data');
		console.log(data);

		// const pool = await connection();

		// // let params = data.values.map((_, i) => `@param_${i}`); //FUNCTION generateParamsByValues

		// const params = generateParamsByValues(data.values);

		// let sqlquery;
		// let request = pool.request();
		// for (let i = 0; i < data.values.length; i++) {
		// 	request.input(`param_${i}`, data.values[i]);
		// }

		// sqlquery = `INSERT INTO ${tableName}(${data.fields}) values (${params})`;

		// console.log(sqlquery);

		// const result = await request.query(sqlquery);

		// return result.rowsAffected;
	} catch (error) {}
};

const generateQuery = (body) => {
	let fields = [];
	let values = [];

	for (var key in body) {
		console.log(key);
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

	console.log(values[0][1]);
	j = 0;
	for (let i = 0; i < values[0].length; i++) {
		console.log(values[i][j]);
		j++;
	}

	return { fields: fields, values: values };
};
