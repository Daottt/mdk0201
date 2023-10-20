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
	country_id integer not null,
	foreign key (country_id) references Country(id)
);

create table Library(
	id integer primary key autoincrement,
	name varchar(100) not null,
	location_id integer not null,
	foreign key (location_id) references Location(id)
);

create table Job(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Book(
	id integer primary key autoincrement,
	name varchar(100) not null,
	genre_id integer not null,
	library_id integer not null,
	author_id integer not null,
	foreign key (genre_id) references Genre(id),
	foreign key (library_id) references Author(id),
	foreign key (author_id) references Library(id)
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
	job_id integer not null,
	foreign key (job_id) references Job(id)
);

create table BorrowedRecord(
	id integer primary key autoincrement,
	user_id integer not null,
	personal_id integer not null,
	book_id integer not null,
	issue_date Date not null,
	return_date Date not null,
	isReturned bool not null,
	foreign key (user_id) references Users(id),
	foreign key (personal_id) references Personal(id),
	foreign key (book_id) references Book(id)
);
