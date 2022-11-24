const Validator = require('Validator');
import { getCustomers } from '../models/customer';
import { getProvinces } from '../models/province';
import { getCities } from '../models/city';

export const createRealEstates = async (req, res, fields) => {
	res.render('partials/realestate/create', {
		customers: await getCustomers(),
		provinces: await getProvinces(),
		cities: await getCities(),
	});
};
