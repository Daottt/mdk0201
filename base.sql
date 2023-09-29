
create table Users(
	id integer PRIMARY KEY autoincrement,
    login varchar(16) not null unique,
    password varchar(16) not null
);

create table Personal(
	id integer primary key autoincrement,
	login varchar(16) not null unique,
	password varchar(16) not null,
	jobId integer not null
	foreign key (jobId) references Job(id),
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

create table Genre(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Author(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Library(
	id integer primary key autoincrement,
	name varchar(100) not null,
	locationId integer not null,
	foreign key (locationId) references Location(id)
);

create table Location(
	id integer primary key autoincrement,
	address varchar(100) not null,
	postal_code varchar(100) not null,
	countryId integer not null,
	foreign key (countryId) references Country(id)
);

create table Country(
	id integer primary key autoincrement,
	name varchar(100) not null
);

create table Job(
	id integer primary key autoincrement,
	name varchar(100) not null
);

insert into Country (name)
	values ("Country1"), ("Country2");

insert into Location (address, postal_code, countryId)
	values ("address1", "11111",1), ("address2", "22222",2);

insert into Library(name, locationId)
	values ("Library1",1), ("Library2",2);

insert into Users (login, password)
	values ("UsersName1", "1234"), ("UsersName2", "1234");

insert into Job (name)
	values ("jobName1"), ("jobName2");

insert into Personal (login, password, jobId) 
	values ('PresonalName1' , '1234', 1), ('PresonalName2' , '1234', 2);

insert into Genre (name)
	values ("Genre1"), ("Genre2");

insert into Author (name)
	values ("Author1"), ("Author2");

insert into Book (name, genreId, authorId, libraryId)
	values ("Book1",1,1,1), ("Author2",2,2,2);

insert into Borrowed_Record (UsersId, presonalId, bookId, issue_date, return_date, isReturned)
	values (1,1,1,"01.01.2000","01.02.2000",False), (2,2,2,"01.01.2000","01.07.2000",True);