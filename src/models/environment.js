import { connection } from '../database/connection';

const tableName = '[Domus].[dbo].[ambiente]';

export const getEnvironments = async (fields) => {
	const pool = await connection();
	const result = await pool.request().query(`SELECT * FROM ${tableName}`);

	return result.recordset;
};
