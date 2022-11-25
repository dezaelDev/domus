import { Router } from 'express'
import { viewCreateUser } from '../controllers/admin';

const router = Router();

//FORMULARIO DE ALTA DE USUARIO
router.get('/create-user', viewCreateUser)

export default router;
