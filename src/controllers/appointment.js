import { connection } from '../database/connection';
import { getAppointments } from '../models/appointment';

export const getAgentActivities = async (req, res) => {
	res.render('partials/appointment/agente_actividades', {
		appointments: await getAppointments(),
	});
};

export const getSecretaryActivities = async (req, res) => {
	res.render('partials/appointment/secretaria_actividades');
};

export const createAppointment = async (req, res) => {
	res.render('partials/appointment/secretaria_agendarCita');
};
