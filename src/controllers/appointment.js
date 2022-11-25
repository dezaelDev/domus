import { connection } from '../database/connection';

export const getAgentActivities = async (req, res) => {
  res.render('partials/appointment/agente_actividades')
}

export const getSecretaryActivities = async (req, res) => {
    res.render('partials/appointment/secretaria_actividades')
  }
  