import { Router } from 'express';
import { setState } from '../controllers/realestate';

const router = Router();

router.post('/realestates/state', setState);

export default router;
