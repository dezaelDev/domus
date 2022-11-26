import { connection } from '../database/connection';
import { getAppointments } from '../models/appointment';
const moment = require('moment');

export const getAgentActivities = async (req, res) => {
	res.render('partials/appointment/agente_actividades', {
		appointments: await getAppointments(
			req.params.fecha,
			req.params.agente
		),
	});
};

export const getSecretaryActivities = async (req, res) => {
	res.render('partials/appointment/secretaria_actividades', {
		appointments: await getAppointments(
			req.params.fecha,
			req.params.agente
		),
		moment: moment,
	});
};

export const createAppointment = async (req, res) => {
	res.render('partials/appointment/secretaria_agendarCita');
};
