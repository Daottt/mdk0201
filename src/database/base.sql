create table Genre(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Author(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Country(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Location(
	id integer primary key autoincrement,
	address varchar(100) not null,
	postal_code varchar(100) not null,
	countryId integer not null,
	foreign key (countryId) references Country(id)
);

create table Library(
	id integer primary key autoincrement,
	name varchar(100) not null,
	locationId integer not null,
	foreign key (locationId) references Location(id)
);

create table Job(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Book(
	id integer primary key autoincrement,
	name varchar(100) not null,
	genreId integer not null,
	libraryId integer not null,
	authorId integer not null,
	foreign key (genreId) references Genre(id),
	foreign key (authorId) references Author(id),
	foreign key (libraryId) references Library(id)
);

create table Users(
	id integer PRIMARY KEY autoincrement,
    login varchar(16) not null unique,
    password varchar(16) not null
);

create table Personal(
	id integer primary key autoincrement,
	login varchar(16) not null unique,
	password varchar(16) not null,
	jobId integer not null,
	foreign key (jobId) references Job(id)
);

create table Borrowed_Record(
	id integer primary key autoincrement,
	UsersId integer not null,
	presonalId integer not null,
	bookId integer not null,
	issue_date Date not null,
	return_date Date not null,
	isReturned bool not null,
	foreign key (UsersId) references Users(id),
	foreign key (presonalId) references Personal(id),
	foreign key (bookId) references Book(id)
);