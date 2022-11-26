import express from 'express';
import morgan from 'morgan';
var engine = require('ejs-layout');
import cors from 'cors';

import config from './config';
import path from 'path';
import customerRoutes from './routes/customer';
import realestateRoutes from './routes/realestate';
import testRoutes from './routes/test';
import adminRoutes from './routes/admin';
import appointmentRoutes from './routes/appointment';
import dbRoutes from './routes/db';
const app = express();

const port = config.port;

app.set('port', port);

//MIDDLEWARES
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(morgan('dev'));
app.use(cors());
app.use(express.static(path.join(__dirname + '/public')));
app.set('views', path.join(__dirname + '/views'));

//VIEW ENGINE
app.set('view engine', 'ejs');
app.engine('ejs', engine.__express);

//ROUTES
app.get('/', (req, res) => {
	res.send('VERSION 1.0.0');
});
app.use('/customers', customerRoutes);

app.use('/test', testRoutes);

app.use('/admin', adminRoutes);

app.use('/appointments', appointmentRoutes);

app.use('/realestates', realestateRoutes);

app.use('/db', dbRoutes);

export default app;
