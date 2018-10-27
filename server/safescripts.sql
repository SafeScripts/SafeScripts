CREATE TABLE prescription (
	id SERIAL PRIMARY KEY,
	name VARCHAR(500),
	description VARCHAR(500),
	whentotake TIME,
	frequency TEXT,
	active BOOLEAN,
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
