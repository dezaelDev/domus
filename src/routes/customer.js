import { Router } from 'express'
import {
  getCustomers,
  viewCreateCorporateCustomer,
  viewCreatePrivateCustomer,
  viewLogin,
} from '../controllers/customer'

const router = Router();

//FORMULARIO DE LOGIN
router.get('/login', viewLogin)

//OBTENER TODOS LOS CLIENTES
router.get('/', getCustomers)

//FORMULARIO NUEVO CLIENTE PARTICULAR
router.get('/create-private', viewCreatePrivateCustomer)

//FORMULARIO NUEVO CLIENTE CORPORATIVO
router.get('/create-corporate', viewCreateCorporateCustomer)

//CARGAR UN CLIENTE
router.post('/');

//ACTUALIZAR UN CLIENTE
router.put('/:id');

//BORRAR UN CLIENTE
router.delete('/:id');

//OBTENER UN CLIENTE
router.get('/:id');

export default router;
