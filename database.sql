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
    datecreated datetime not null
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
    inventoryquantity int not null,
    dateadded datetime not null
);

create table productimage(
    id int not null primary key auto_increment,
    product int not null,
    imageurl varchar(255) not null,
    dateadded datetime not null
);

create table shoppingorder(
    id int not null primary key auto_increment,
    customer int not null,
    dateadded datetime not null
);

create table cart(
    id int not null primary key auto_increment,
    shoppingorder int not null,
    product int not null,
    price decimal(18,2),
    quantity int not null,
    dateadded datetime not null
);


alter table product add foreign key (category) references category(id);
alter table productimage add foreign key (product) references product(id);
alter table shoppingorder add foreign key (customer) references customer(id);
alter table cart add foreign key (shoppingorder) references shoppingorder(id);
alter table cart add foreign key (product) references product(id);

-- INSERT
insert into customer(id,firstname,lastname,email,phonenumber,street,city,postalnumber,datecreated) values
(null,'Matija','Bling-blong','blingblong@gmail.com',null,null,'Osijek','31000','2021-11-25 17:15'),
(null,'Darija','Kupus-Bupus','kupusnjaca@gmail.com',null,null,'Valpovo','31550','2021-11-26 09:23:45'),
(null,'Kata','Kupus-Bupus','kata.bata@gmail.com',null,null,'Valpovo','31550',now()),
(null,'Tata','Mata','tata.mata@gmail.com',null,null,'Osijek','31000',now()),
(null,'Dalibor','Zipok','dalzop@gmail.com',null,null,'Osijek','31000',now()),
(null,'Aleksa','Kizo','akizo@gmail.com',null,null,'Osijek','31000',now()),
(null,'Jon','Filipov','jonfilipov@gmail.com',null,null,'Vinkovci','32100',now()),
(null,'Jana','Katarina','janakatarina@gmail.com',null,null,'??akovo','31400',now()),
(null,'Branko','Ivanov','bivanov@gmail.com',null,null,'Osijek','31000',now()),
(null,'Ivana','Kusik','ikus@gmail.com',null,null,'Beli Manastir','31300',now());

insert into category(id,name,description) values
(null,'Tipkovnica','Membranska,mehani??ka,??i??ana,be??i??na'),
(null,'Mi??','??i??ani,be??i??ni,ergonomski,standardni'),
(null,'Ku??i??te','sva ku??i??ta'),
(null,'Mati??na plo??a','Maticne ploce svi tipovi'),
(null,'Monitor','LCD,TFT,ravni,zakrivljeni'),
(null,'Ventilatori i hladnjaci','Ventilatori i ostali tipovi hla??enja'),
(null,'HDD i SSD','Tipovi diskova'),
(null,'Napajanje za kompjuter','Vrste napajanja'),
(null,'Memorija za ra??unala','RAM'),
(null,'Procesor','Rzyen i Intel');

insert into product(id,name,description,category,price,inventoryquantity,dateadded) values
(null,'REDRAGON K530 PRO RGB',null,1,479.99,5,now()),
(null,'LOGITECH MX Master 3',null,2,750.99,5,now()),
(null,'MS Industrial ARMOR V700 gaming',null,3,429.99,5,now()),
(null,'GIGABYTE B450 Gaming X',null,4,669.99,5,now()),
(null,'GIGABYTE M27F-EK',null,5,1799.99,5,now()),
(null,'Xilence 40??40??10mm',null,6,14.99,5,now()),
(null,'Hikvision C100, 2.5"',null,7,299.99,5,now()),
(null,'Akyga AK-B1-500',null,8,299.99,5,now()),
(null,'Kingston KCP426NS6/4',null,9,179.99,5,now()),
(null,'Intel Core i3-10100F',null,10,749.99,5,now());

insert into productimage(id,product,imageurl,dateadded) values
(null,1,'https://www.links.hr/content/images/thumbs/009/0096739_tipkovnica-redragon-draconic-k530-rgb-mehanicka-bezicna-usb-us-layout-crna-101200626.png','2021-11-26 13:05'),
(null,5,'https://www.links.hr/content/images/thumbs/010/0104932_monitor-27-gigabyte-m27f-ek-kvm-gaming-monitor-ips-144hz-1ms-300cd-m2-1000-1-crni-100300841.png','2021-11-26 13:49'),
(null,2,'https://www.links.hr/content/images/thumbs/006/0068425_mis-logitech-mx-master-3-laserski-bezicni-bt-unifying-receiver-usb-graphite.jpg','2021-11-26 13:49'),
(null,3,'https://www.links.hr/content/images/thumbs/011/0112952_kuciste-ms-industrial-armor-v700-gaming-midi-atx-window-crno-bez-napajanja.jpg',now()),
(null,4,'https://www.links.hr/content/images/thumbs/007/0076249_maticna-ploca-gigabyte-b450-gaming-x-amd-b450-ddr4-atx-s-am4-050300477.jpg',now()),
(null,6,'https://www.instar-informatika.hr/slike/velike/ventilator-za-kuciste-xilence-40x40x10mm-35960_1.jpg',now()),
(null,7,'https://www.instar-informatika.hr/slike/velike/ssd-hikvision-c100-240gb-25-sata-3-6gb-s-hks-ssd-c100-240g_1.jpg',now()),
(null,8,'https://www.instar-informatika.hr/slike/velike/akb1500.jpg',now()),
(null,9,'https://www.instar-informatika.hr/slike/velike/memorija-kingston-ddr4-2666mhz-4gb-brand-king-kcp426ns6-4gb_1.jpg',now()),
(null,10,'https://www.instar-informatika.hr/slike/velike/procesor-intel-core-i3-10100f-36ghz-6mb--inp-000151_1.jpg',now());
-- 
---------------------------------------------------------------------------------
-- Procedure to create 100 rows in shoppingorder
-- Kreiraj 100 narudzbi gdje su id kupaca random izmedu 1-10
-- napravi insert 10 kupaca prije ove procedure
-- uvjet: moras imati 10kupaca s id 1-10 !!!! 
drop procedure if exists create_shoppingorder;
delimiter $$
create procedure create_shoppingorder()
begin
	
	DECLARE kraj INT default 0;
	
petlja: loop
	IF kraj=100 then leave petlja;
	end if;	
	insert into shoppingorder(id,customer,dateadded) 
	values (null,floor(rand()*10+1), now());

	set kraj=kraj+1;
end loop petlja;	
end;
$$
delimiter ;

call create_shoppingorder();
-- 
---------------------------------------------------------------------------
-- Kreiraj 500 cart redaka 
-- fiksirano na 100 prvih shoppingorder i na prvih 10 proizvoda i kolicina max 5
-- napravi kreiraj_shoppingorder prije ovoga
-- moras imati shopping ordere s id 1-100 !!!!
-- insert 10 proizvoda prije procedure.
-- moras imati proizvoda s id 1-10 !!!!
drop procedure if exists create_cart;
delimiter $$
create procedure create_cart()
begin
	
	DECLARE kraj INT default 0;
	
petlja: loop
	IF kraj=500 then leave petlja;
	end if;	
	insert into cart(id,shoppingorder,product,quantity,dateadded) 
	values (null,floor(rand()*100+1),floor(rand()*10+1), floor(rand()*5+1), now());

	set kraj=kraj+1;
end loop petlja;	
end;
$$
delimiter ;

call create_cart();
-- 
------------------------------------------------------------------------------
-- Zbraja product.price i cart.quantity iz carta i puni vrijednost za cart.price
-- moras imati inserte u cartu da ih moze zbrojit
-- ide red po red kroz cart i zbraja
drop procedure if exists cart_price;
delimiter $$
create procedure cart_price()
begin
DECLARE kraj INT default 0;
DECLARE _id INT;
DECLARE cart_kursor cursor for select id from cart order by id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET kraj = 1;
       
open cart_kursor;

petlja: loop
fetch cart_kursor into _id;

IF kraj=1 
then leave petlja;
end if;

   update cart set cart.price=(select a.quantity*b.price
             from cart a
             inner join product b on a.product=b.id
            where a.id= _id)
	where id= _id;
  
end loop petlja;

close cart_kursor;

END;
$$
delimiter ;


call cart_price();
-- 
----------------------------------------------------------------------------------
-- Kraj sql file-a