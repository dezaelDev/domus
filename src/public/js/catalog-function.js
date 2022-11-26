function setState(id, state) {
	let _datos = {
		id: id,
		state: state,
	};
	fetch(`http://localhost:3000/db/realestates/state`, {
		method: 'POST',
		headers: { 'Content-type': 'application/json;charset=UTF-8' },
		body: JSON.stringify(_datos),
	}).then((res) => {
		location.reload();
	});
}
