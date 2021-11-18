drop database if exists trgovina;
create database trgovina character set utf8;
use trgovina;


create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(255) not null,
    brojtelefona varchar(15)
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(255)
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(255) not null,
    opis text,
    kategorija int not null,
    cijena decimal(18,2),
    osoba int not null
);

alter table proizvod add foreign key (kategorija) references kategorija(sifra);
alter table proizvod add foreign key (osoba) references osoba(sifra);