create table if not exists Musician(
	id serial primary key,
	MusName varchar(40) not null
);

create table if not exists Genre(
	id serial primary key,
	GenreName varchar(80) unique not null
);

create table if not exists MusicianGenre(
	id serial primary key,
	MusicianID integer references Musician(id),
	GenreID integer references Genre(id)
);

create table if not exists Album(
	id serial primary key,
	AlbumName varchar(40) not null,
	ReleaseYear integer not null check(ReleaseYear > 0)
);

create table if not exists MusicianAlbum(
	id serial primary key,
	MusicianID integer references Musician(id),
	AlbumID integer references Album(id)
);

create table if not exists Tracks(
	id serial primary key references Album(id),
	TrackName varchar(40) not null,
	TrackDuration numeric(2,2) not null check(TrackDuration > 0)
);

create table if not exists MusSets(
	id serial primary key,
	SetName varchar(60) not null,
	ReleaseYear integer check(ReleaseYear > 0) 
);

create table if not exists TrackMusSets(
	id serial primary key,
	TrackID integer references Tracks(id),
	SetID integer references MusSets(id)
);