import app from './app';

app.listen(app.get('port'), (err) => {
	if (err) console.error(err);

	console.log('server on port 3000');
});
