import { Router } from 'express';
import { createRealEstates, storeRealEstates } from '../controllers/realestate';

const router = Router();

//OBTENER TODOS LOS PROPIEDADS
router.get('/');

//CARGAR UNA PROPIEDAD
router.post('/create', storeRealEstates);

//FORMULARIO NUEVA PROPIEDAD
router.get('/create', createRealEstates);

//ACTUALIZAR UNA PROPIEDAD
router.put('/:id');

//BORRAR UNA PROPIEDAD
router.delete('/:id');

//OBTENER UNAA PROPIEDAD
router.get('/:id');

export default router;
