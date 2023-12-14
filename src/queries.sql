-- UC1
-- creating new database for address books
create database address_book_service;
show databases;

-- output to the above query
-- address_book_service
-- information_schema
-- mysql
-- payroll_service
-- performance_schema
-- sys

-- UC2
-- using the created database
use address_book_service;

-- creating an address book table
create table address_book_1 (
    first_name varchar(50) not null,
    last_name varchar(50),
    address varchar(100),
    city varchar(20),
    state varchar(20),
    zip varchar(10),
    phone varchar(20), 
    email varchar(320)
);

-- UC3
-- creating new contacts in address book
insert into address_book_1 (first_name, last_name, address, city, state, zip, phone, email) values
	("Srinidhi", "Pasunuri", "xyz", "Hyderabad", "Telangana", "360005", "91 9313402393", "srinidhi@gmail.com"),
    ("Rashi", "Sharma", "abc", "Mumbai", "Maharashtra", "456002", "91 5446123345", "rashi@gmail.com"),
    ("Kushi", "Shah", "pqr", "Ahmedabad", "Gujarat", "380001", "91 945612345", "kushi@gmail.com");
select * from address_book_1;

-- output to the above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com
-- Rashi	Sharma	abc	Mumbai	Maharashtra	456002	91 5446123345	rashi@gmail.com
-- Kushi	Shah	pqr	Ahmedabad	Gujarat	380001	91 945612345	kushi@gmail.com

-- UC4
-- editing the contact using first name
update address_book_1 set address = "pqr-201" where first_name = "Kushi";
select * from address_book_1;

-- output to the above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com
-- Rashi	Sharma	abc	Mumbai	Maharashtra	456002	91 5446123345	rashi@gmail.com
-- Kushi	Shah	pqr-201	Ahmedabad	Gujarat	380001	91 945612345	kushi@gmail.com

-- UC5
-- deleting a contact using first_name
delete from address_book_1 where first_name = "Kushi";
select * from address_book_1;

-- output to the above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com
-- Rashi	Sharma	abc	Mumbai	Maharashtra	456002	91 5446123345	rahul@gmail.com

-- adding more data to table
insert into address_book_1 (first_name, last_name, address, city, state, zip, phone, email) values
	("Hema", "Kulkarni", "addr-101", "Rajkot", "Gujarat", "360001", "91 546513151", "hema@gmail.com"),
    ("Aditi", "Das", "addr-405", "Pune", "Maharashtra", "456110", "91 78823345", "aditi@gmail.com"),
    ("Kushi", "Shah", "addr-201", "Ahmedabad", "Gujarat", "380001", "91 945612345", "kushi@gmail.com");

-- UC6
-- retrieving people belonging to city
select * from address_book_1 where city = "Hyderabad";

-- output to the above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com


-- retrieving people belonging to state
select * from address_book_1 where state = "Maharashtra";

-- output to the above query
-- Rashi	Sharma	abc	Mumbai	Maharashtra	456002	91 5446123345	rahul@gmail.com
-- Aditi	Das	addr-405	Pune	Maharashtra	456110	91 78823345	aditya@gmail.com

-- UC7
-- getting number of contacts by each city
select city, count(city) from address_book_1 group by city;

-- output to above query
-- Hyderabad 1
-- Rajkot	1
-- Mumbai	1
-- Pune	1
-- Ahmedabad	1

-- getting number of contacts by every state
select state, count(state) from address_book_1 group by state;

-- output to above query
-- Gujarat	3
-- Maharashtra	2
--Hyderabad  1

-- UC8
-- retrieve entries sorted by name for particular city
select * from address_book_1 where city = "Hyderabad" order by first_name asc;

-- output to above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com


-- UC 9
-- adding name and type to address book
alter table address_book_1 add column type varchar(20), add column name varchar(50);

-- adding name and type to all contacts
update address_book_1 set name = "book1";
update address_book_1 set type = "friends" where first_name in ("Hema", "Kushi");
update address_book_1 set type = "family" where first_name in ("Srinidhi", "Rashi", "Aditi");
select * from address_book_1;

-- output to above query
-- Srinidhi	Pasunuri	xyz	Hyderabad	Telangana	360005	91 9313402393	srinidhi@gmail.com
-- Rashi	Sharma	abc	Mumbai	Maharashtra	456002	91 5446123345	rashi@gmail.com	family	book1
-- Hema	Kulkarni	addr-101	Rajkot	Gujarat	360001	91 546513151	hema@gmail.com	friends	book1
-- Aditi	Das	addr-405	Pune	Maharashtra	456110	91 78823345	aditi@gmail.com	family	book1
-- Kushi	Shah	addr-201	Ahmedabad	Gujarat	380001	91 945612345	kushi@gmail.com	friends	book1


-- UC10
-- get number of contacts by type
select type, count(type) from address_book_1 group by type;

-- output to above query
-- family	3
-- friends	2
