import { connection } from '../database/connection';

const tableName = '[Domus].[dbo].[actividad]';

export const getActivities = async (req, res, fields) => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(`SELECT * FROM ${tableName}`);

		return result.recordset;
	} catch (error) {
		console.error(error);
	}
};
