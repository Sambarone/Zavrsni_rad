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
	datum_dogadaja date not null,
	lokacija int not null,
	kategorija int not null,
	cijena decimal (18,2) 
	
);

create table ulaznica (
	sifra int not null primary key auto_increment,
	racun int not null,
	dogadaj int not null,
	količina int not null
	
);

create table racun (
	sifra int not null primary key auto_increment,
	kupac int not null,
	datum_kupnje date not null,
	nacin_placanja varchar (50) not null

);

create table kupac (
	sifra int not null primary key auto_increment,
	ime varchar (50) not null,
	prezime varchar (50) not null,
	datum_rodenja date,
	e_mail varchar (50) not null,
	lozinka varchar(50) not null

);

create table lokacija (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	adresa varchar(50),
	kapacitet int not null
	
);
create table kategorija (
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null
);

alter table dogadaj add foreign key (lokacija) references lokacija (sifra); 
alter table dogadaj add foreign key (kategorija) references kategorija (sifra); 

alter table ulaznica add foreign key (dogadaj) references dogadaj(sifra);
alter table ulaznica add foreign key (racun) references racun (sifra);

alter table racun add foreign key (kupac) references kupac (sifra);

insert into kupac (sifra,ime,prezime,datum_rodenja,e_mail,lozinka)
values(null,'Marija','Sambol','1994-04-14','msambol@gmail.com','Puska123'),
(null,'Karlo','Primorac','1995-05-10','kprimorac@gmail.com','Nogomet22'),
(null,'Ana','Medaković','1998-08-01','amedakovic@gmail.com','tuba88'),
(null,'Goran','Kolarek','1985-11-23','gkolarek@gmail.com','dance1'),
(null,'Adrian','Beli','2000-05-29','abeli@gmail.com','Puska123'),
(null,'Mirko','Vucinic','1987-10-12','mvucinic@gmail.com','lecce18');

insert into kategorija (sifra,naziv)
values (null,'Sport'),(null,'Glazba'),
(null,'Kazalište'), (null,'Obitelj'), (null,'Kultura'),
(null,'Ostalo');


insert into lokacija(sifra,naziv,adresa,kapacitet)
values(null,'Gradski vrt','Osijek, M. Marulića 11',30000),
(null,'Gradsko kazalište Joze Ivakića','Vinkovci, M.A. Reljkovića bb',500),
(null,'Dovrana Gradski vrt','Osijek, M. Marulića 10',5000),
(null,'Stadion Maksimir','Zagreb, Maksimirska 12',40000), 
(null,'Dom kulture','Vukovar, Blage Zadre 19',350),
(null,'Dom sportova','Zagreb, Slavonska 58',3500);


insert into dogadaj(sifra,naziv,datum_dogadaja,lokacija,kategorija,cijena)
values (null,'Hrvatska_Brazil, nogometna utkamica','2022-11-12',4,1,100),
(null,'Zuhra i Sedlar, stan up komedija','2023-01-12',2,3,50),
(null,'Prljavo kazalište - 35 godina','2023-05-13',4,2,70),
(null,'Jean Miro - izložba','2023-03-25',5,5,150),
(null,'Jozo_Bozo - dječja predstava','2023-03-02',2,4,45);

insert into racun(sifra,kupac,datum_kupnje,nacin_placanja)
values(null,1,'2022-10-10','kartično'),
(null,2,'2022-05-15','gotovina'),
(null,5,'2022-12-18','gotovina'),
(null,4,'2022-12-05','kartično'),
(null,2,'2022-08-23','kartično');

insert into ulaznica(sifra,racun,dogadaj,količina)
values(null,1,1,4),
(null,2,3,3),
(null,1,5,2),
(null,3,2,3),
(null,4,5,4),
(null,3,4,4);

