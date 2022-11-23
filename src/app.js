import express from 'express';
import morgan from 'morgan';

import config from './config';
import path from 'path';
import customerRoutes from './routes/customer';
import testRoutes from './routes/test';

const app = express();

const port = config.port;

app.set('port', port);

//MIDDLEWARES
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(morgan('dev'));

app.use(express.static(path.join(__dirname + '/public')));
app.set('views', path.join(__dirname + '/views'));

//VIEW ENGINE
app.set('view engine', 'ejs');

app.use('/customers', customerRoutes);
app.use('/test', testRoutes);

export default app;
