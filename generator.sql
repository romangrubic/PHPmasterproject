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


------------------------------------------------------------------------
-- Na random izabere jedan od gradova u tablici city

drop function if exists randomcity;
DELIMITER $$
create function randomcity() returns varchar(20)
begin
    return (select city from city order by rand() limit 1);
end;
$$
DELIMITER ;


------------------------------------------------------------------------
-- Procedura: za svako ime pravimo petlju da dobije svako prezime iz tablice s prezimenima (jedno ime s deset razlicith prezimena),
--  koristimo emailfunction za njihov email i randomcity da im dodijelimo grad

drop procedure if exists customercreation;
DELIMITER $$
create procedure customercreation()
begin

    declare _firstname varchar(20);
    declare _lastname varchar(20);

    declare firstname_kraj int default 0;

    declare firstname_cursor cursor for select firstname from firstname order by id;    
    declare continue handler for not found set firstname_kraj = 1;
    

    open firstname_cursor;

    firstloop: loop

        fetch firstname_cursor into _firstname;

        if firstname_kraj=1 then leave firstloop;
        end if;


        BLOCK1: begin
        declare lastname_kraj int default 0;
        declare lastname_cursor cursor for select lastname from lastname order by id;
        declare continue handler for not found set lastname_kraj = 1;

        open lastname_cursor;

        secondloop: loop

            fetch lastname_cursor into _lastname;

            if lastname_kraj=1 then leave secondloop;
            end if;

            insert into customer(id,firstname,lastname,email,city,datecreated) values
            (null,_firstname,_lastname,emailfunction(_firstname,_lastname),randomcity(),now());

        end loop secondloop;
        set lastname_kraj=0;
        end BLOCK1;        
    
    end loop firstloop;

end;
$$
DELIMITER ;

call customercreation();

------------------------------------------------------------------------
-- Nakon svega toga, cistimo databazu od tablica firstname,lastname,city i brisemo funkcije i procedure

drop table firstname;
drop table lastname;
drop table city;

drop function emailfunction;
drop function randomcity;

drop procedure procedura1;