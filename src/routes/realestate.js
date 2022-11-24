import { Router } from 'express';
import { createRealEstates } from '../controllers/realestate';

const router = Router();

//OBTENER TODOS LOS PROPIEDADS
router.get('/');

//formulario nueva propiedad
router.get('/crear', createRealEstates);

//CARGAR UNA PROPIEDAD
router.post('/');

//ACTUALIZAR UNA PROPIEDAD
router.put('/:id');

//BORRAR UNA PROPIEDAD
router.delete('/:id');

//OBTENER UNAA PROPIEDAD
router.get('/:id');

export default router;
