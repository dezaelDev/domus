const Validator = require('Validator');
import { getCustomers } from '../models/customer';
import { getProvinces } from '../models/province';
import { getCities } from '../models/city';
import { getTypes } from '../models/realestate_types';
import { getEnvironments } from '../models/environment';

export const createRealEstates = async (req, res, fields) => {
	res.render('partials/realestate/create', {
		customers: await getCustomers(),
		provinces: await getProvinces(),
		cities: await getCities(),
		realestates_types: await getTypes(),
	});
};

export const storeRealEstates = async (req, res) => {
	let fields = '';
	let values = '';

	Object.keys(req.body).map(function (key, index) {
		console.log(key);
	});

	res.send(req.body);
};
