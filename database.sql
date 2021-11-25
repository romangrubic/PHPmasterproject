drop database if exists shop;
create database shop character set utf8;
use shop;

create table customer(
    id int not null primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(255) not null,
    phonenumber varchar(15),
    street varchar(255),
    city varchar(50),
    postalnumber char(5),
    datecreated datetime
);

create table category(
    id int not null primary key auto_increment,
    name varchar(50) not null,
    description varchar(255)
);

create table product(
    id int not null primary key auto_increment,
    name varchar(255) not null,
    description text,
    category int not null,
    price decimal(18,2),
    dateadded datetime
);

create table productimage(
    id int not null primary key auto_increment,
    product int not null,
    imageurl varchar(255),
    dateadded datetime
);

create table cart(
    id int not null primary key auto_increment,
    customer int not null,
    totalprice decimal(18,2),
    dateadded datetime
);

create table cart_product(
    id int not null primary key auto_increment,
    cart int not null,
    product int not null,
    price decimal(18,2),
    quantity int not null,
    dateadded datetime
);


alter table product add foreign key (category) references category(id);

alter table productimage add foreign key (product) references product(id);

alter table cart add foreign key (customer) references customer(id);

alter table cart_product add foreign key (cart) references cart(id);
alter table cart_product add foreign key (product) references product(id);
