CREATE TABLE IF NOT EXISTS Musician(
	id serial PRIMARY KEY,
	MusName varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre(
	id serial PRIMARY KEY,
	GenreName varchar(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicianGenre(
	id serial PRIMARY KEY,
	MusicianID integer REFERENCES Musician(id),
	GenreID integer REFERENCES Genre(id)
);

CREATE TABLE IF NOT EXISTS Album(
	id serial PRIMARY KEY,
	AlbumName varchar(40) NOT NULL,
	ReleaseYear integer NOT NULL CHECK(ReleaseYear > 0)
);

CREATE TABLE IF NOT EXISTS MusicianAlbum(
	id serial PRIMARY KEY,
	MusicianID integer REFERENCES Musician(id),
	AlbumID integer REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Tracks(
	id serial PRIMARY KEY,
	AlbumID integer REFERENCES Album(id),
	TrackName varchar(40) NOT NULL,
	TrackDuration numeric(5,2) NOT NULL CHECK(TrackDuration > 0)
);

CREATE TABLE IF NOT EXISTS MusSets(
	id serial PRIMARY KEY,
	SetName varchar(60) NOT NULL,
	ReleaseYear integer CHECK(ReleaseYear > 0)
);

CREATE TABLE IF NOT EXISTS TrackMusSets(
	id serial PRIMARY KEY,
	TrackID integer REFERENCES Tracks(id),
	SetID integer REFERENCES MusSets(id)
);