import { connection } from '../database/connection';

const $tableName = '[Domus].[dbo].[cliente]';

export const getCustomers = async (req, res, fields) => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(`SELECT * FROM ${$tableName}`);

		return result.recordset;
	} catch (error) {
		return error;
	}
};
