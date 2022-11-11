const sql = require('mssql');
const sqlConfig = {
	user: process.env.DB_USER,
	password: process.env.DB_PWD,
	database: process.env.DB_NAME,
	server: '127.0.0.1',
	pool: {
		max: 10,
		min: 0,
		idleTimeoutMillis: 30000,
	},
	options: {
		instancename: 'SQLEXPRESS',
	},
};

async () => {
	try {
		// make sure that any items are correctly URL encoded in the connection string
		await sql.connect(sqlConfig);
		const result =
			await sql.query`select * from mytable where id = ${value}`;
		console.dir(result);
	} catch (err) {
		// ... error checks
		console.error(err);
	}
};
