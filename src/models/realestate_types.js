import { connection } from '../database/connection';

const tableName = '[Domus].[dbo].[tipo_propiedad]';

export const getTypes = async (fields) => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(`SELECT * FROM ${tableName}`);

		return result.recordset;
	} catch (error) {}
};
