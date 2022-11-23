import { Router } from 'express';

const router = Router();

//OBTENER TODOS LOS PROPIEDADS
router.get('/');

//CARGAR UNA PROPIEDAD
router.post('/');

//ACTUALIZAR UNA PROPIEDAD
router.put('/:id');

//BORRAR UNA PROPIEDAD
router.delete('/:id');

//OBTENER UNAA PROPIEDAD
router.get('/:id');
