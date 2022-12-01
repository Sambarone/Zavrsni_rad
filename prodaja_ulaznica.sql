# ljestve (hash) je komentar i on se ne izvodi
# Izvođenje naredbi na serveru
# Otvoriti CMD
# Zaljepiti sljedeću naredbu bez prvog hash znaka
#naredba ispod označava postavke kodriranja
# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  <C:\Users\Samba\Documents\GitHub\vjezbanje\Zavrsni_rad\prodaja_ulaznica.sql



drop database if exists aplikacija;
create database aplikacija default charset utf8;
use aplikacija;




create table događaj (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	datum_događaja date not null,
	lokacija int not null,
	kategorija int not null,
	cijena decimal (18,2) not null
	
);

create table ulaznica (
	sifra int not null primary key auto_increment,
	račun int not null,
	događaj int not null,
	količina int not null
	
);

create table račun (
	sifra int not null primary key auto_increment,
	kupac int not null,
	datum_kupnje date not null,
	nacin_plačanja varchar (50)

);

create table kupac (
	sifra int not null primary key auto_increment,
	ime varchar (50) not null,
	prezime varchar (50) not null,
	datum_rođenja date,
	e_mail varchar (50) not null

);

create table lokacija (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	adresa varchar(50) not null,
	država varchar (50)
	
);
create table kategorija (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null
);

alter table događaj add foreign key (lokacija) references lokacija (sifra); 
alter table događaj add foreign key (kategorija) references kategorija (sifra); 

alter table ulaznica add foreign key (događaj) references događaj(sifra);
alter table ulaznica add foreign key (račun) references račun (sifra);

alter table račun add foreign key (kupac) references kupac (sifra);


