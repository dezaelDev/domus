import { connection } from '../database/connection';

const $tableName = '[Domus].[dbo].[provincia]';

export const getProvinces = async () => {
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM ${$tableName}`);

	return result.recordset;
};
