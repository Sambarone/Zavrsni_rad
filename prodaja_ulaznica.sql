# ljestve (hash) je komentar i on se ne izvodi
# Izvođenje naredbi na serveru
# Otvoriti CMD
# Zaljepiti sljedeću naredbu bez prvog hash znaka
#naredba ispod označava postavke kodriranja
# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  <C:\Users\Samba\Documents\GitHub\vjezbanje\Zavrsni_rad\prodaja_ulaznica.sql



drop database if exists aplikacija;
create database aplikacija default charset utf8;
use aplikacija;




create table dogadaj (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	datum_događaja date ,
	lokacija int ,
	kategorija int ,
	cijena decimal (18,2) 
	
);

create table ulaznica (
	sifra int not null primary key auto_increment,
	racun int,
	dogadaj int ,
	količina int
	
);

create table racun (
	sifra int not null primary key auto_increment,
	kupac int ,
	datum_kupnje date ,
	nacin_plačanja varchar (50)

);

create table kupac (
	sifra int not null primary key auto_increment,
	ime varchar (50) ,
	prezime varchar (50) ,
	datum_rođenja date,
	e_mail varchar (50) 

);

create table lokacija (
	sifra int not null primary key auto_increment,
	naziv varchar (50),
	adresa varchar(50),
	država varchar (50)
	
);
create table kategorija (
	sifra int not null primary key auto_increment,
	naziv varchar (50) 
);

alter table dogadaj add foreign key (lokacija) references lokacija (sifra); 
alter table dogadaj add foreign key (kategorija) references kategorija (sifra); 

alter table ulaznica add foreign key (dogadaj) references dogadaj(sifra);
alter table ulaznica add foreign key (racun) references racun (sifra);

alter table racun add foreign key (kupac) references kupac (sifra);


