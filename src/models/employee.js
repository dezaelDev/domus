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

export const save = async (body) => {
    try {
        const pool = await connection();

        const result = await pool
            .request()
            .input('param1', body.nombre_apellido)
            .input('param2', body.dni)
            .input('param3', body.contrasenia)
            .input('param4', body.email)
            .input('param5', body.nombre_apellido)
            .input('param6', body.puesto_trabajo)
            .input('param7', body.telefono_contacto)
            .input('param8', body.telefono_alternativo)
            .input('param9', 0)
            .input('param10', 1)
      		.query(`INSERT INTO [dbo].[empleado] (
						nombre_usuario,
						dni,
						contrasenia,
						email,
						nombre_apellido,
						puesto_trabajo,
						telefono_contacto,
						telefono_alternativo,
						sueldo,
						id_area
					)
					VALUES (
						@param1,
						@param2,
						@param3,
						@param4,
						@param5,
						@param6,
						@param7,
						@param8,
						@param9,
						@param10
					)`);
    } catch (error) {}
};
