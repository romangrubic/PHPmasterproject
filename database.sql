drop database if exists trgovina;
create database trgovina character set utf8;
use trgovina;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(255) not null,
    brojtelefona varchar(15),
    lokacija int
);

create table lokacija(
    sifra int not null primary key auto_increment,
    ulica varchar(255),
    kucnibroj varchar(10),
    grad varchar(50),
    postanskibroj char(5)
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(255)
);

create table podkategorija(
    sifra int not null primary key auto_increment,
    kategorija int not null,
    naziv varchar(50) not null,
    opis varchar(255)
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(255) not null,
    opis text,
    kategorija int not null,
    podkategorija int not null,
    cijena decimal(18,2),
    osoba int not null
);

alter table osoba add foreign key (lokacija) references lokacija(sifra);

alter table podkategorija add foreign key (kategorija) references kategorija(sifra);

alter table proizvod add foreign key (kategorija) references kategorija(sifra);
alter table proizvod add foreign key (podkategorija) references podkategorija(sifra);
alter table proizvod add foreign key (osoba) references osoba(sifra);