import { Router } from 'express';

const router = Router();

//OBTENER TODOS LOS EMPLEADOS
router.get('/');

//CARGAR UN EMPLEADO
router.post('/');

//ACTUALIZAR UN EMPLEADO
router.put('/:id');

//BORRAR UN EMPLEADO
router.delete('/:id');

//OBTENER UN EMPLEADO
router.get('/:id');
