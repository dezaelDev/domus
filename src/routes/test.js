import { Router } from 'express';
import { getCustomers } from '../models/customer';
import { getProvinces } from '../models/province';
import { getCities } from '../models/city';

const router = Router();

router.get('/', async (req, res) => {
  res.render('partials/test/agente_nuevaPropiedad', {
    customers: await getCustomers(),
    provinces: await getProvinces(),
    cities: await getCities(),
	});
});

router.post('/', (req, res) => {
	res.send(req.body);
});

router.put('/:id');

router.delete('/:id');

export default router;
