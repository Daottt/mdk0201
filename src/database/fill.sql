insert into Country (name)
	values ("Country1"), ("Country2");

insert into Location (address, postal_code, country_id)
	values ("address1", "11111",1), ("address2", "22222",2);

insert into Library(name, location_id)
	values ("Library1",1), ("Library2",2);

insert into Users (login, password)
	values ("UsersName1", "1234"), ("UsersName2", "1234");

insert into Job (name)
	values ("jobName1"), ("jobName2");

insert into Personal (login, password, job_id)
	values ('PresonalName1' , '1234', 1), ('PresonalName2' , '1234', 2);

insert into Genre (name)
	values ("Genre1"), ("Genre2");

insert into Author (name)
	values ("Author1"), ("Author2");

insert into Book (name, genre_id, author_id, library_id)
	values ("Book1",1,1,1), ("Author2",2,2,2);

insert into BorrowedRecord (user_id, personal_id, book_id, issue_date, return_date, isReturned)
	values (1,1,1,"01.01.2000","01.02.2000",False), (2,2,2,"01.01.2000","01.07.2000",True);