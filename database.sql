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
    imageurl varchar(255) not null,
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

-- INSERT
insert into customer(id,firstname,lastname,email,phonenumber,street,city,postalnumber,datecreated) values
(null,'Matija','Bling-blong','blingblong@gmail.com',null,null,'Osijek','31000','2021-11-25 17:15'),
(null,'Darija','Kupus-Bupus','kupusnjaca@gmail.com',null,null,'Valpovo','31550','2021-11-26 09:23:45'),
(null,'Tata','Mata','tata.mata@gmail.com',null,null,'Osijek','31000','2021-11-26 11:56:02');

insert into category(id,name,description) values
(null,'Tipkovnica','Membranska,mehanička,žičana,bežična'),
(null,'Miš','Žičani,bežični,ergonomski,standardni'),
(null,'Monitor','LCD,TFT,ravni,zakrivljeni');

insert into product(id,name,description,category,price,dateadded) values
(null,'REDRAGON K530 PRO RGB',null,1,479.99,'2021-11-25 09:05:32'),
(null,'LOGITECH MX Master 3',null,2,750.99,'2021-11-25 09:06:21'),
(null,'GIGABYTE M27F-EK',null,3,1799.99,'2021-11-25 09:06:59');

insert into productimage(id,product,imageurl,dateadded) values
(null,1,'https://www.links.hr/content/images/thumbs/009/0096739_tipkovnica-redragon-draconic-k530-rgb-mehanicka-bezicna-usb-us-layout-crna-101200626.png','2021-11-26 13:05'),
(null,3,'https://www.links.hr/content/images/thumbs/010/0104932_monitor-27-gigabyte-m27f-ek-kvm-gaming-monitor-ips-144hz-1ms-300cd-m2-1000-1-crni-100300841.png','2021-11-26 13:49'),
(null,2,'https://www.links.hr/content/images/thumbs/006/0068425_mis-logitech-mx-master-3-laserski-bezicni-bt-unifying-receiver-usb-graphite.jpg','2021-11-26 13:49');

