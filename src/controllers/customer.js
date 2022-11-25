import { connection } from '../database/connection';
const Validator = require('Validator');

const $tableName = '[Domus].[dbo].[cliente]';

export const viewLogin = async (req, res) => {
  res.render('partials/customer/login')
}

export const getCustomers = async (req, res, fields) => {
	const pool = await connection();

	const result = await pool.request().query(`SELECT * FROM ${$tableName}`);

  res.render('partials/customer/index', {
    customers: result.recordset,
    error: null,
    success: null,
  })
}

export const viewCreatePrivateCustomer = async (req, res) => {
  res.render('partials/customer/secretaria_nuevoClienteParticular')
}

export const viewCreateCorporateCustomer = async (req, res) => {
  res.render('partials/customer/secretaria_nuevoClienteCorporativo')
}

export const createCustomer = async (req, res) => {};

export const updateCustomer = async (req, res) => {};

export const deleteCustomer = async (req, res) => {};

export const getCustomerById = async (req, res) => {};
