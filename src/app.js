import express from 'express';
import morgan from 'morgan';
var engine = require('ejs-layout');

import config from './config';
import path from 'path';
import customerRoutes from './routes/customer';
import realestateRoutes from './routes/realestate';
import testRoutes from './routes/test';
import adminRoutes from './routes/admin';
import appointmentRoutes from './routes/appointment';

const app = express();

const port = config.port;

app.set('port', port);

//MIDDLEWARES
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(morgan('dev'));

app.use(express.static(path.join(__dirname + '/public')));
app.use('/realestates', express.static(path.join(__dirname + '/public')));
app.set('views', path.join(__dirname + '/views'));

//VIEW ENGINE
app.set('view engine', 'ejs');
app.engine('ejs', engine.__express);

//ROUTES
app.use('/customers', customerRoutes)
app.use('/customers', express.static(path.join(__dirname + '/public')))
app.use('/test', testRoutes)
app.use('/test', express.static(path.join(__dirname + '/public')))
app.use('/admin', adminRoutes)
app.use('/admin', express.static(path.join(__dirname + '/public')))
app.use('/appointment', appointmentRoutes)
app.use('/appointment', express.static(path.join(__dirname + '/public')))
app.use('/realestates', realestateRoutes)

export default app;
