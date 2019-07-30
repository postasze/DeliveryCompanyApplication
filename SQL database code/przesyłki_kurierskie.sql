/*==============================================================*/
/* Baza danych przesylek kurierskich                            */
/*==============================================================*/
alter system set ddl_lock_timeout=1;
alter SESSION set NLS_DATE_FORMAT = 'DD-MM-YY HH:MI:SS'

/*==============================================================*/
/* usuwanie powiązań jeden do wielu                             */
/*==============================================================*/

alter table Paczki
   drop constraint FK_typ_paczki;
      
alter table Paczki
   drop constraint FK_zawarta_w_przesyłce;
 
alter table Paczki
   drop constraint FK_paczka_w_lokalizacji;      

alter table Przesyłki
   drop constraint FK_przesyłka_od_nadawcy;

alter table Przesyłki
   drop constraint FK_przesyłka_do_odbiorcy;

alter table Przesyłki
   drop constraint FK_przesyłka_poprzez_kuriera;

alter table Przesyłki
   drop constraint FK_typ_przesyłki;

alter table Przesyłki
   drop constraint FK_status_przesyłki;

alter table Przesyłki
   drop constraint FK_adres_początkowy;

alter table Przesyłki
   drop constraint FK_adres_końcowy;
   
alter table Przesyłki
   drop constraint FK_metoda_płatności;    

alter table Pojazdy_kurierskie
   drop constraint FK_typ_pojazdu;

alter table Pojazdy_kurierskie
   drop constraint FK_pojazd_w_lokalizacji;

alter table Lokalizacje
   drop constraint FK_typ_lokalizacji;
   
alter table Lokalizacje
   drop constraint FK_adres_lokalizacji;   

alter table Województwa
   drop constraint FK_województwo_w_państwie;     
      
alter table Miasta
   drop constraint FK_miasto_w_województwie; 

alter table Adresy
   drop constraint FK_państwo;
      
alter table Adresy
   drop constraint FK_województwo;
      
alter table Adresy
   drop constraint FK_miasto;      

alter table Pracownicy
   drop constraint FK_typ_pracownika;
      
alter table Pracownicy
   drop constraint FK_pracuje_w_lokalizacji;  
   
alter table Pracownicy
   drop constraint FK_adres_pracownika;   
      
alter table Nadawcy
   drop constraint FK_adres_nadawcy;       
      
alter table Odbiorcy
   drop constraint FK_adres_odbiorcy;       
      
alter table Konta
   drop constraint FK_typ_konta;       
      
alter table Płatności
   drop constraint FK_typ_płatności; 

alter table Szefowie_podwładni
   drop constraint FK_szef;
      
alter table Szefowie_podwładni
   drop constraint FK_podwładny;   

/*==============================================================*/
/* usuwanie powiązań wiele do wielu                             */
/*==============================================================*/

alter table Kurierzy_pojazdy
   drop constraint FK_kurier_prowadzący_pojazd;

alter table Kurierzy_pojazdy
   drop constraint FK_pojazd_uzyty_przez_kuriera;
      
/*==============================================================*/
/* usuwanie tabel                                               */
/*==============================================================*/


drop table Przesyłki cascade constraints;

drop table Paczki cascade constraints;

drop table Pojazdy_kurierskie cascade constraints;

drop table Adresy cascade constraints;

drop table Lokalizacje cascade constraints;

drop table Pracownicy cascade constraints;

drop table Nadawcy cascade constraints;

drop table Odbiorcy cascade constraints;

drop table Typy_pojazdów_kurierskich cascade constraints;

drop table Typy_lokalizacji cascade constraints;

drop table Typy_paczek cascade constraints;

drop table Typy_przesyłek cascade constraints;

drop table Typy_pracowników cascade constraints;

drop table Status_przesyłki cascade constraints;

drop table Płatności cascade constraints;

drop table Typy_płatności cascade constraints;

drop table Kurierzy_pojazdy cascade constraints;

drop table Konta cascade constraints;

drop table Typy_kont cascade constraints;

drop table Państwa cascade constraints;

drop table Województwa cascade constraints;

drop table Miasta cascade constraints;

drop table Szefowie_podwładni cascade constraints;

/*==============================================================*/
/* Tabela Przesyłki                                             */
/*==============================================================*/


create table Przesyłki
(
	id_przesyłki								INTEGER                      not null,
	id_nadawcy									INTEGER											 not null,
  id_odbiorcy									INTEGER											 not null,
	id_kuriera_dostarczającego	INTEGER											 not null,
	typ_przesyłki								INTEGER     								 not null,
	status_przesyłki 						INTEGER     								 not null,
	id_adresu_początkowego 			INTEGER											 not null, -- identyfikator adresu
	id_adresu_końcowego 				INTEGER											 not null, -- identyfikator adresu
  id_płatności                INTEGER                      not null,
	data_nadania_przesyłki			DATE												 not null,
	data_odebrania_przesyłki		DATE												 not null,
	koszt_przesyłki							REAL												 not null,
	constraint PK_PRZESYŁKA primary key (id_przesyłki)
);

/*==============================================================*/
/* Tabela Paczki                                                */
/*==============================================================*/


create table Paczki
(
	id_paczki						INTEGER                          not null,
  id_przesyłki				INTEGER                          not null,
  id_lokalizacji    	INTEGER                          not null, -- identyfikator lokalizacji
	typ_paczki					INTEGER     										 not null,
	masa_paczki				  REAL        										 not null,
	wymiary_paczki			REAL														 not null,
	constraint PK_PACZKA primary key (id_paczki)
);
/*==============================================================*/
/* Tabela Pojazdy kurierskie                                    */
/*==============================================================*/


create table Pojazdy_kurierskie
(
	id_pojazdu						      INTEGER                      not null,
  id_lokalizacji              INTEGER                      not null,
	typ_pojazdu						      INTEGER     								 not null,
	numer_rejestracyjny		      VARCHAR2(100)                        ,
	marka_pojazdu               VARCHAR2(100)                        ,
  data_następnego_przeglądu   DATE										     not null,
	constraint PK_POJAZD primary key (id_pojazdu)
);

/*==============================================================*/
/* Tabela Państwa			                                          */
/*==============================================================*/


create table Państwa
(
  id_Państwa        INTEGER                          not null,
	Państwo	 					VARCHAR2(100)										 not null,
	constraint PK_PAŃSTWO primary key (id_Państwa)
);

/*==============================================================*/
/* Tabela Województwa			                                      */
/*==============================================================*/


create table Województwa
(
  id_Województwa        INTEGER                          not null,
  Państwo    	 					INTEGER     										 not null,
	Województwo	 					VARCHAR2(100)										 not null,
	constraint PK_WOJEWÓDZTWO primary key (id_Województwa)
);


/*==============================================================*/
/* Tabela Miasta			                                          */
/*==============================================================*/


create table Miasta
(
  id_Miasta         INTEGER                          not null,
	Województwo	 		  INTEGER     										 not null,
	Miasto	 					VARCHAR2(100)										 not null,
	constraint PK_MIASTO primary key (id_Miasta)
);


/*==============================================================*/
/* Tabela Adresy			                                          */
/*==============================================================*/


create table Adresy
(
	id_adresu						INTEGER                          not null,
	ulica								VARCHAR2(100)										 not null,
	numer_domu					INTEGER													 not null,
	numer_mieszkania 	  INTEGER									 				 not null,
	kod_pocztowy				VARCHAR2(100)										 not null,
	Miasto        			INTEGER       									 not null,
	Województwo		    	INTEGER     										 not null,
	Państwo 					  INTEGER     										 not null,
	constraint PK_ADRES primary key (id_adresu)
);

/*==============================================================*/
/* Tabela Lokalizacje                                           */
/*==============================================================*/


create table Lokalizacje
(
	id_lokalizacji			INTEGER                          not null, 
	typ_lokalizacji			INTEGER       									 not null,
	adres_lokalizacji		INTEGER													 not null, -- identyfikator adresu
	constraint PK_LOKALIZACJA primary key (id_lokalizacji)
);

/*==============================================================*/
/* Tabela Pracownicy                                            */
/*==============================================================*/


create table Pracownicy  (
   id_pracownika   			 INTEGER                       not null,
   typ_pracownika        INTEGER                       not null,
   adres_zamieszkania    INTEGER                       not null, -- identyfikator adresu
   id_lokalizacji        INTEGER                       not null,
   id_konta              INTEGER                       not null,   
   pierwsze_imie         VARCHAR2(100)                 not null,
   drugie_imie           VARCHAR2(100)                         ,
   nazwisko              VARCHAR2(100)								 not null,   
   wynagrodzenie         REAL                          not null,
   constraint PK_PRACOWNIK primary key (id_pracownika)
);

/*==============================================================*/
/* Tabela Nadawcy                                               */
/*==============================================================*/


create table Nadawcy  (
   id_nadawcy          INTEGER                       not null,
   id_konta            INTEGER                       not null,
   adres_zamieszkania  INTEGER                       not null, -- identyfikator adresu   
   pierwsze_imie       VARCHAR2(100)                 not null,
   drugie_imie         VARCHAR2(100)                         ,
   nazwisko            VARCHAR2(100)								 not null,     
   constraint PK_NADAWCA primary key (id_nadawcy)
);

/*==============================================================*/
/* Tabela Odbiorcy                                              */
/*==============================================================*/


create table Odbiorcy  (
   id_odbiorcy         INTEGER                       not null,
   adres_zamieszkania  INTEGER                       not null, -- identyfikator adresu   
   pierwsze_imie       VARCHAR2(100)                 not null,
   drugie_imie         VARCHAR2(100)                         ,
   nazwisko            VARCHAR2(100)								 not null,     
   constraint PK_ODBIORCA primary key (id_odbiorcy)
);

/*==============================================================*/
/* Tabela Konta w bazie	                                        */
/*==============================================================*/


create table Konta  (
   id_konta           INTEGER                             not null,  
   nick               VARCHAR2(100)                       not null,
   typ_konta          INTEGER                             not null,
   hasło              VARCHAR2(100)                       not null,  
   mail               VARCHAR2(100)                       not null,
   constraint PK_KONTO primary key (id_konta)
);

/*==============================================================*/
/* Tabela Płatności	                                            */
/*==============================================================*/


create table Płatności  (
   id_płatności	      INTEGER                             not null,
   typ_płatności	    INTEGER                             not null,
   opis_płatności     VARCHAR2(100)                       not null,  
   constraint PK_PŁATNOŚĆ primary key (id_płatności)
);


/*==============================================================*/
/* Tabela Typy płatności                                        */
/*==============================================================*/


create table Typy_płatności  (
   id_typu               INTEGER                            not null,
   typ_płatności         VARCHAR2(100)                      not null,
   constraint PK_TYP_PŁATNOŚCI primary key (id_typu)
);

/*==============================================================*/
/* Tabela Typy kont                                             */
/*==============================================================*/


create table Typy_kont   (
   id_typu             INTEGER                            not null,
   typ_konta           VARCHAR2(100)                      not null,
   constraint PK_TYP_KONTA primary key (id_typu)
);

/*==============================================================*/
/* Tabela Typy pojazdów kurierskich                             */
/*==============================================================*/


create table Typy_pojazdów_kurierskich   (
   id_typu             INTEGER                          not null,
   typ_pojazdu			 	 VARCHAR2(100)              			not null,
   constraint PK_TYP_POJAZDU primary key (id_typu)
);

/*==============================================================*/
/* Tabela Typy paczek                                           */
/*==============================================================*/


create table Typy_paczek  (
   id_typu             INTEGER                          not null,
   typ_paczki          VARCHAR2(100)                    not null,
   constraint PK_TYP_PACZKI primary key (id_typu)
);


/*==============================================================*/
/* Tabela Typy przesyłek                                        */
/*==============================================================*/


create table Typy_przesyłek  (
   id_typu                INTEGER                          not null,
   typ_przesyłki          VARCHAR2(100)                    not null,
   constraint PK_TYP_PRZESYŁKI primary key (id_typu)
);

/*==============================================================*/
/* Tabela Typy pracowników                                      */
/*==============================================================*/


create table Typy_pracowników  (
   id_typu                 INTEGER                          not null,
   typ_pracownika          VARCHAR2(100)                    not null,
   constraint PK_TYP_PRACOWNIKA primary key (id_typu)
);

/*==============================================================*/
/* Tabela Typy lokalizacji		                                  */
/*==============================================================*/


create table Typy_lokalizacji   (
   id_typu             INTEGER                          not null,
   typ_lokalizacji     VARCHAR2(100)                    not null,
   constraint PK_TYP_LOKALIZACJI primary key (id_typu)
);

/*==============================================================*/
/* Tabela Status przesyłki                                      */
/*==============================================================*/


create table Status_przesyłki
(
	id_statusu_przesyłki		INTEGER                          not null,
	opis_statusu_przesyłki	VARCHAR2(100)										 not null,
	constraint PK_STATUS_PRZESYŁKI primary key (id_statusu_przesyłki)
);

/*==============================================================*/
/* Tabela łącząca szefów z podwładnymi                          */
/*==============================================================*/


create table Szefowie_podwładni
(
	id_szefa				  INTEGER                          not null,
	id_podwładnego 	  INTEGER                          not null,
	constraint PK_SZEFOWIE_PODWŁADNI primary key (id_szefa, id_podwładnego)
);


/*==============================================================*/
/* Tabele z powiązaniami wiele do wielu                         */
/*==============================================================*/

/*==============================================================*/
/* Tabela - różni kurierzy korzystający z różnych pojazdów      */
/*==============================================================*/


create table Kurierzy_pojazdy
(
	id_kuriera				  INTEGER                          not null,
	id_pojazdu					INTEGER                          not null,
	data_użycia					DATE                             not null,
	constraint PK_KURIERZY_POJAZDY primary key (id_kuriera, id_pojazdu, data_użycia)
);

/*==============================================================*/
/* Tworzenie powiązań jeden do wielu                            */
/*==============================================================*/

alter table Paczki
   add constraint FK_typ_paczki foreign key (typ_paczki)
      references Typy_paczek (id_typu);
      
alter table Paczki
   add constraint FK_zawarta_w_przesyłce foreign key (id_przesyłki)
      references Przesyłki (id_przesyłki);
 
alter table Paczki
   add constraint FK_paczka_w_lokalizacji foreign key (id_lokalizacji)
      references Lokalizacje (id_lokalizacji);      

alter table Przesyłki
   add constraint FK_przesyłka_od_nadawcy foreign key (id_nadawcy)
      references Nadawcy (id_nadawcy);

alter table Przesyłki
   add constraint FK_przesyłka_do_odbiorcy foreign key (id_odbiorcy)
      references Odbiorcy (id_odbiorcy);

alter table Przesyłki
   add constraint FK_przesyłka_poprzez_kuriera foreign key (id_kuriera_dostarczającego)
      references Pracownicy (id_pracownika);

alter table Przesyłki
   add constraint FK_typ_przesyłki foreign key (typ_przesyłki)
      references Typy_przesyłek (id_typu);

alter table Przesyłki
   add constraint FK_status_przesyłki foreign key (status_przesyłki)
      references Status_przesyłki (id_statusu_przesyłki);

alter table Przesyłki
   add constraint FK_adres_początkowy foreign key (id_adresu_początkowego)
      references Adresy (id_adresu);

alter table Przesyłki
   add constraint FK_adres_końcowy foreign key (id_adresu_końcowego)
      references Adresy (id_adresu);
      
alter table Przesyłki
   add constraint FK_metoda_płatności foreign key (id_płatności)
      references Płatności (id_płatności);      

alter table Pojazdy_kurierskie
   add constraint FK_typ_pojazdu foreign key (typ_pojazdu)
      references Typy_pojazdów_kurierskich (id_typu);

alter table Pojazdy_kurierskie
   add constraint FK_pojazd_w_lokalizacji foreign key (id_lokalizacji)
      references Lokalizacje (id_lokalizacji);

alter table Lokalizacje
   add constraint FK_typ_lokalizacji foreign key (typ_lokalizacji)
      references Typy_lokalizacji (id_typu);
      
alter table Lokalizacje
   add constraint FK_adres_lokalizacji foreign key (adres_lokalizacji)
      references Adresy (id_adresu);      
      
alter table Województwa
   add constraint FK_województwo_w_państwie foreign key (Państwo)
      references Państwa (id_Państwa);      
      
alter table Miasta
   add constraint FK_miasto_w_województwie foreign key (Województwo)
      references Województwa (id_Województwa);         

alter table Adresy
   add constraint FK_państwo foreign key (Państwo)
      references Państwa (id_Państwa);
      
alter table Adresy
   add constraint FK_województwo foreign key (Województwo)
      references Województwa (id_Województwa);
      
alter table Adresy
   add constraint FK_miasto foreign key (Miasto)
      references Miasta (id_Miasta);      

alter table Pracownicy
   add constraint FK_typ_pracownika foreign key (typ_pracownika)
      references Typy_pracowników (id_typu);
      
alter table Pracownicy
   add constraint FK_pracuje_w_lokalizacji foreign key (id_lokalizacji)
      references Lokalizacje (id_lokalizacji);   
   
alter table Pracownicy
   add constraint FK_adres_pracownika foreign key (adres_zamieszkania)
      references Adresy (id_adresu);   
      
alter table Pracownicy
   add constraint FK_konto_pracownika foreign key (id_konta)
      references Konta (id_konta);       
      
alter table Nadawcy
   add constraint FK_adres_nadawcy foreign key (adres_zamieszkania)
      references Adresy (id_adresu);       
      
alter table Nadawcy
   add constraint FK_konto_nadawcy foreign key (id_konta)
      references Konta (id_konta);       
      
alter table Odbiorcy
   add constraint FK_adres_odbiorcy foreign key (adres_zamieszkania)
      references Adresy (id_adresu);                  
      
alter table Konta
   add constraint FK_typ_konta foreign key (typ_konta)
      references Typy_kont (id_typu);         
      
alter table Płatności
   add constraint FK_typ_płatności foreign key (typ_płatności)
      references Typy_płatności (id_typu); 
              
alter table Szefowie_podwładni
   add constraint FK_szef foreign key (id_szefa)
      references Pracownicy (id_pracownika); 
      
alter table Szefowie_podwładni
   add constraint FK_podwładny foreign key (id_podwładnego)
      references Pracownicy (id_pracownika);              
              
/*==============================================================*/
/* Tworzenie powiązań wiele do wielu                            */
/*==============================================================*/

alter table Kurierzy_pojazdy
   add constraint FK_kurier_prowadzący_pojazd foreign key (id_kuriera)
      references Pracownicy (id_pracownika);

alter table Kurierzy_pojazdy
   add constraint FK_pojazd_uzyty_przez_kuriera foreign key (id_pojazdu)
      references Pojazdy_kurierskie (id_pojazdu);


/*==============================================================*/
/* Wstawianie podstawowych danych                               */
/*==============================================================*/

INSERT INTO Typy_paczek VALUES (1, 'Paczka o małym gabarycie');
INSERT INTO Typy_paczek VALUES (2, 'Paczka o średnim gabarycie');
INSERT INTO Typy_paczek VALUES (3, 'Paczka o dużym gabarycie');
INSERT INTO Typy_paczek VALUES (4, 'Paczka niestandardowa');

INSERT INTO Typy_przesyłek VALUES (1, 'Przesyłka priorytetowa');
INSERT INTO Typy_przesyłek VALUES (2, 'Przesyłka ekonomiczna');
INSERT INTO Typy_przesyłek VALUES (3, 'Przesyłka miejska');
INSERT INTO Typy_przesyłek VALUES (4, 'Przesyłka wewnątrzkrajowa');
INSERT INTO Typy_przesyłek VALUES (5, 'Przesyłka międzynarodowa');

INSERT INTO Status_przesyłki VALUES (1, 'Przesyłka została nadana przez nadawcę');
INSERT INTO Status_przesyłki VALUES (2, 'Przesyłka została odebrana przez odbiorcę');
INSERT INTO Status_przesyłki VALUES (3, 'Przesyłka znajduje się w punkcie przechowującym przesyłki');
INSERT INTO Status_przesyłki VALUES (4, 'Przesyłka została zwrócona do nadawcy po nieodebraniu przez odbiorcę');
INSERT INTO Status_przesyłki VALUES (5, 'Przesyłka została zatrzymana na granicy ze względu na niewaściwą zawartość');

INSERT INTO Typy_płatności VALUES (1, 'Płatność przelewem');
INSERT INTO Typy_płatności VALUES (2, 'Płatność gotówką');
INSERT INTO Typy_płatności VALUES (3, 'Płatność kartą');

INSERT INTO Typy_kont VALUES (1, 'Konto z prawami administratora');
INSERT INTO Typy_kont VALUES (2, 'Konto pracownika firmy kurierskiej');
INSERT INTO Typy_kont VALUES (3, 'Konto klienta korzystającego z firmy kurierskiej');

INSERT INTO Typy_lokalizacji VALUES (1, 'Siedziba firmy kurierskiej');
INSERT INTO Typy_lokalizacji VALUES (2, 'Oddział firmy kurierskiej');
INSERT INTO Typy_lokalizacji VALUES (3, 'Punkt z pojazdami kurierskimi');
INSERT INTO Typy_lokalizacji VALUES (4, 'Magazyn z paczkami');
INSERT INTO Typy_lokalizacji VALUES (5, 'Punkt przechowujący przesyłki');

INSERT INTO Typy_pojazdów_kurierskich VALUES (1, 'Samochód osobowy');
INSERT INTO Typy_pojazdów_kurierskich VALUES (2, 'Samochód ciężarowy');
INSERT INTO Typy_pojazdów_kurierskich VALUES (3, 'Tir');
INSERT INTO Typy_pojazdów_kurierskich VALUES (4, 'Rower');

INSERT INTO Typy_pracowników VALUES (1, 'Członek zarządu');
INSERT INTO Typy_pracowników VALUES (2, 'Informatyk');
INSERT INTO Typy_pracowników VALUES (3, 'Menadżer');
INSERT INTO Typy_pracowników VALUES (4, 'Kurier');
INSERT INTO Typy_pracowników VALUES (5, 'Pracownik biura');

INSERT INTO Państwa VALUES (1, 'Polska');
INSERT INTO Państwa VALUES (2, 'Niemcy');

INSERT INTO Województwa VALUES (1, 1, 'mazowieckie');
INSERT INTO Województwa VALUES (2, 1, 'śląskie');
INSERT INTO Województwa VALUES (3, 1, 'łódzkie');
INSERT INTO Województwa VALUES (4, 1, 'wielkopolskie');
INSERT INTO Województwa VALUES (5, 1, 'małopolskie');
INSERT INTO Województwa VALUES (6, 1, 'pomorskie');
INSERT INTO Województwa VALUES (7, 1, 'lubelskie');
INSERT INTO Województwa VALUES (8, 1, 'dolnośląskie');

INSERT INTO Województwa VALUES (9, 2, 'Bawaria');
INSERT INTO Województwa VALUES (10, 2, 'Saksonia');
INSERT INTO Województwa VALUES (11, 2, 'Brandenburgia');
INSERT INTO Województwa VALUES (12, 2, 'Turyngia');

INSERT INTO Miasta VALUES (1, 1, 'Warszawa');
INSERT INTO Miasta VALUES (2, 1, 'Ostrołęka');
INSERT INTO Miasta VALUES (3, 1, 'Radom');
INSERT INTO Miasta VALUES (4, 2, 'Katowice');
INSERT INTO Miasta VALUES (5, 3, 'Łódź');
INSERT INTO Miasta VALUES (6, 4, 'Poznań');
INSERT INTO Miasta VALUES (7, 5, 'Kraków');
INSERT INTO Miasta VALUES (8, 6, 'Gdańsk');
INSERT INTO Miasta VALUES (9, 6, 'Gdynia');
INSERT INTO Miasta VALUES (10, 6, 'Sopot');
INSERT INTO Miasta VALUES (11, 7, 'Lublin');
INSERT INTO Miasta VALUES (12, 7, 'Zamość');
INSERT INTO Miasta VALUES (13, 8, 'Wrocław');

INSERT INTO Miasta VALUES (14, 9, 'Monachium');
INSERT INTO Miasta VALUES (15, 10, 'Drezno');
INSERT INTO Miasta VALUES (16, 11, 'Poczdam');
INSERT INTO Miasta VALUES (17, 12, 'Erfurt');
commit;

/*==============================================================*/
/* Generowanie danych                                           */
/*==============================================================*/

exec generuj_adresy;
commit;
exec generuj_lokalizacje;
commit;
exec generuj_pojazdy;
commit;
exec generuj_konta;
commit;
exec generuj_pracowników;
commit;
exec generuj_nadawców;
commit;
exec generuj_odbiorców;
commit;
exec generuj_płatności;
commit;
exec generuj_przesyłki;
commit;
exec generuj_paczki;
commit;
exec generuj_szefowie_podwładni;
commit;
exec generuj_kurierzy_pojazdy;
commit;


/*==============================================================*/
/* Selecty                                                      */
/*==============================================================*/

select * from Typy_pracowników;
select * from Konta;
select * from Pracownicy;
select * from Kurierzy_pojazdy;
select * from Przesyłki;
select * from Paczki;
select * from Adresy;
select * from Szefowie_podwładni;
select * from Lokalizacje;
select * from Województwa;
select * from Typy_płatności;
select * from Płatności;

-- podwladni szefa o identyfikatorze rownym 1
select * 
from Szefowie_podwładni s join Pracownicy p
on s.id_podwładnego = p.id_pracownika
where s.id_szefa = 1; 

-- ilosc kurierow w bazie
select count (*) from Pracownicy p where p.typ_pracownika = 4; -- 4 to id typu pracownika "Kurier";

-- paczki znajdujace sie w magazynie o identyfikatorze = 12
select * 
from Lokalizacje l join Paczki p
on l.id_lokalizacji = p.id_lokalizacji
where l.id_lokalizacji = 12;

-- kto mieszka w Niemczech
select * 
from Adresy a 
join Państwa pa 
on a.Państwo = pa.id_Państwa 
join Pracownicy pr 
on pr.adres_zamieszkania = a.id_adresu 
where pa.Państwo = 'Niemcy'; 

-- jakimi pojazdami jezdzil kurier o id = 32
select * 
from Kurierzy_pojazdy k join Pracownicy p
on k.id_kuriera = p.id_pracownika
where p.id_pracownika = 32; 
