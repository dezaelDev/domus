import { getAppointments } from '../models/appointment';
import { getCustomers } from '../models/customer';
import { getRealEstatesId } from '../models/realestate';
import { getEmployeesAgent } from '../models/employee';
import { getActivities } from '../models/motive';

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
	res.render('partials/appointment/secretaria_agendarCita', {
		realestates: await getRealEstatesId(),
		agents: await getEmployeesAgent(),
		customers: await getCustomers(),
		motives: await getActivities(),
	});
};

export const storeAppointment = async (req, res) => {};
