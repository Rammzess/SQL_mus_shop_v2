create table if not exists Department(
	id serial primary key,
	DepartmentName varchar(60) not null unique
);

create table if not exists Worker(
	id serial primary key,
	Name varchar(40) not null,
	IsDirector integer references Worker(id),
	DepartmentID integer references Department(id)
);
