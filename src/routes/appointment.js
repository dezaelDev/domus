import { Router } from 'express';
import {
	createAppointment,
	getAgentActivities,
	getSecretaryActivities,
} from '../controllers/appointment';

const router = Router();

//ACTIVIDADES DEL AGENTE INMOBILIARIO
router.get('/agent-activities/:fecha?/:agente?', getAgentActivities);

//ACTIVIDADES DE LA SECRETARIA
router.get('/secretary-activities', getSecretaryActivities);

//FORMULARIO PARA AGENDAR UNA CITA
router.get('/create', createAppointment);

export default router;
