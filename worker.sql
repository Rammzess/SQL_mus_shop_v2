CREATE TABLE IF NOT EXISTS Department(
	id serial PRIMARY KEY,
	DepartmentName varchar(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Worker(
	id serial PRIMARY KEY,
	Name varchar(40) NOT NULL,
	IsDirector integer REFERENCES Worker(id),
	DepartmentID integer REFERENCES Department(id)
);
