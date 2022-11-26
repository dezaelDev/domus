import { connection } from '../database/connection';

const $tableName = '[Domus].[dbo].[empleado]';

export const getEmployeesAgent = async (req, res, fields) => {
	try {
		const pool = await connection();

		const result = await pool
			.request()
			.query(
				`SELECT legajo, nombre_apellido, puesto_trabajo FROM ${$tableName} WHERE puesto_trabajo='agente' `
			);

		return result.recordset;
	} catch (error) {}
};
