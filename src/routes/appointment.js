import { Router } from 'express'
import { getAgentActivities, getSecretaryActivities } from '../controllers/appointment';

const router = Router();

//ACTIVIDADES DEL AGENTE INMOBILIARIO
router.get('/agent-activities', getAgentActivities)

//ACTIVIDADES DE LA SECRETARIA
router.get('/secretary-activities', getSecretaryActivities)

export default router;
