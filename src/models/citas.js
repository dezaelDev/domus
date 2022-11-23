import { connection } from '../database/connection';

const $tableName = '[Domus].[dbo].[cliente]';

export const getCitas = async (req, res, fields) => {
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM [dbo].[citas]`);

	return result.recordset;
};
