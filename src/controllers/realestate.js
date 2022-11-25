const Validator = require('Validator');
import { getCustomers } from '../models/customer';
import { getProvinces } from '../models/province';
import { getCities } from '../models/city';
import { getTypes } from '../models/realestate_types';
import { getEnvironments } from '../models/environment';
import { createRealEstate } from '../models/realestate';

export const createRealEstates = async (req, res, fields) => {
	res.render('partials/realestate/create', {
		customers: await getCustomers(),
		provinces: await getProvinces(),
		cities: await getCities(),
		realestates_types: await getTypes(),
	});
};

export const storeRealEstates = async (req, res) => {
	await createRealEstate(req.body);

	res.send(req.body);
};
