import { connection } from '../database/connection';
const Validator = require('Validator');

const $tableName = '[Domus].[dbo].[propiedad]';

export const getRealEstates = async () => {
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM ${$tableName}`);

	return result.recordset;
};

export const createRealEstate = async (body) => {
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM ${$tableName}`);

	return result.recordset;
};
