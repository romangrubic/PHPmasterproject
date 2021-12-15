-- TEST: 1
--------------------------------------------------------------------
-- Kreiranje generator baze da bi simulirao unos customera u bazu gdje imam zadana imena, prezimena i gradove.

drop database if exists generator;
create database generator;
use generator;

create table firstname(
    id int not null primary key auto_increment, 
    firstname varchar(20) not null
);

create table lastname(
    id int not null primary key auto_increment,
    lastname varchar(20) not null
);

create table city(
    id int not null primary key auto_increment,
    city varchar(20)
);

create table customer(
    id int not null primary key auto_increment,
    firstname varchar(20) not null,
    lastname varchar(20) not null,
    email varchar(255) not null,
    phonenumber varchar(15),
    street varchar(255),
    city varchar(20),
    postalnumber char(5),
    datecreated datetime not null
);

-------------------------------------------------------------------
-- Punimo tablicu s imenima
insert into firstname(firstname) values
('Roman'),
('Ivan'),
('Matija'),
('Dario'),
('Dunja'),
('Mirna'),
('Saša'),
('Lana'),
('Ljupka'),
('Vjera');

-- Punimo tablicu s prezimenima
insert into lastname(lastname) values
('Knežević'),
('Horvat'),
('Kovačević'),
('Pavlović'),
('Blažević'),
('Božić'),
('Lovrić'),
('Babić'),
('Marković'),
('Bošnjak');

-- Punimo tablicu s gradovima. Stavljamo 3x Osijek jer je veliki grad
insert into city(city) values
('Osijek'),
('Osijek'),
('Osijek'),
('Valpovo'),
('Beli Manastir'),
('Đakovo'),
('Belišće'),
('Donji Miholjac'),
('Našice');


-----------------------------------------------------------------------
-- Funkcija koja pravi email od imena i prezime @mojatrgovina.com bez dijakritike

drop function if exists emailfunction;
DELIMITER $$
create function emailfunction(firstname varchar(20), lastname varchar(20)) returns varchar(255)
begin
    return concat(left(lower(firstname),1),'.', lower(replace(replace(replace(replace(replace(replace(upper(lastname),' ',''),'Č','C'),'Ć','C'),'Ž','Z'),'Š','S'),'Đ','D')), '@mojatrgovina.com');
end;
$$
DELIMITER ;


