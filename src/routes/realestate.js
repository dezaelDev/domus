import { Router } from 'express';
import { createRealEstates, getRealestates, storeRealEstates } from '../controllers/realestate';

const router = Router();

//OBTENER TODAS LAS PROPIEDADS
router.get('/catalogue', getRealestates);

//CARGAR UNA PROPIEDAD
router.post('/create', storeRealEstates);

//FORMULARIO NUEVA PROPIEDAD
router.get('/create', createRealEstates);

//ACTUALIZAR UNA PROPIEDAD
router.put('/:id');

//BORRAR UNA PROPIEDAD
router.delete('/:id');

//OBTENER UNA PROPIEDAD
router.get('/:id');

export default router;
