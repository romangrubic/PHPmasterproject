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

