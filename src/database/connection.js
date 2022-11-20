import sql from 'mssql';

const config = {
	server: process.env.DB_SERVER,
	port: process.env.DB_PORT,
	user: process.env.DB_USER,
	password: process.env.DB_PASS,

	// dialect: 'mssql',
	// dialectOptions: {
	// 	instanceName: 'SQLEXPRESS',
	// },
	// options: {
	// 	encrypt: true,
	// 	trustSeverCertificate: true,
	// },
};

connect();

async function connect() {
	try {
		const pool = await sql.connect({
			server: process.env.DB_SERVER,
			port: 1433,
			user: process.env.DB_USER,
			password: process.env.DB_PASS,
			options: {
				encrypt: true,
				trustServerCertificate: true,
			},
		});

		return pool;
	} catch (error) {
		console.log(error);
	}
}
