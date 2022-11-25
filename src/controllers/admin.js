import { connection } from '../database/connection';

export const viewCreateUser = async (req, res) => {
  res.render('partials/admin/createUser')
}
