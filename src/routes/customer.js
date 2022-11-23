import { Router } from 'express';
import { getCustomers } from '../controllers/customer';

const router = Router();

//OBTENER TODOS LOS CLIENTES
router.get('/', getCustomers);

//CARGAR UN CLIENTE
router.post('/');

//ACTUALIZAR UN CLIENTE
router.put('/:id');

//BORRAR UN CLIENTE
router.delete('/:id');

//OBTENER UN CLIENTE
router.get('/:id');

export default router;
