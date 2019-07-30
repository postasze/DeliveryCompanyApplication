create or replace PROCEDURE generuj_przesyłki IS

    ilość_typów_przesyłek INTEGER;
    ilość_statusów_przesyłek INTEGER;
    ilość_nadawców INTEGER;
    ilość_odbiorców INTEGER;
    ilość_kurierów INTEGER;
    ilość_adresów INTEGER;

BEGIN

select count (*) into ilość_typów_przesyłek from Typy_przesyłek;
select count (*) into ilość_statusów_przesyłek from Status_przesyłki;
select count (*) into ilość_nadawców from Nadawcy;
select count (*) into ilość_odbiorców from Odbiorcy;
select count (*) into ilość_kurierów from Pracownicy p where p.typ_pracownika = 4; -- 4 to id typu pracownika "Kurier"
select count (*) into ilość_adresów from Adresy;

FOR i IN 1..100 LOOP

INSERT INTO Przesyłki VALUES (
    i,
    dbms_random.value(1, ilość_nadawców), 
    dbms_random.value(1, ilość_odbiorców), 
    dbms_random.value(21, 60),
    dbms_random.value(1, ilość_typów_przesyłek), 
    dbms_random.value(1, ilość_statusów_przesyłek), 
    dbms_random.value(1, ilość_adresów), 
    dbms_random.value(1, ilość_adresów), 
    i,
    TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'), TO_CHAR(DATE '2016-12-31','J'))),'J'),
    TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'), TO_CHAR(DATE '2016-12-31','J'))),'J'),   
    dbms_random.value(0.01, 10000));

END LOOP;
   
END;
/




create or replace PROCEDURE generuj_paczki IS

    ilość_typów_paczek INTEGER;
    ilość_lokalizacji INTEGER;
    ilość_przesyłek INTEGER;
    id INTEGER;

BEGIN

select count (*) into ilość_typów_paczek from Typy_paczek;
select count (*) into ilość_lokalizacji from Lokalizacje;
select count (*) into ilość_przesyłek from Przesyłki;

id := 1;

-- tutaj do kazdej przesylki dodajemy jedna paczke
FOR i IN 1..ilość_przesyłek LOOP

    INSERT INTO Paczki VALUES (id, i, 
        dbms_random.value(1, ilość_lokalizacji), 
        dbms_random.value(1, ilość_typów_paczek), 
        dbms_random.value(0.01, 20), dbms_random.value(0.01, 4)); -- masa w kg, rozmiar w m^3   

    id := id + 1;

END LOOP;
   
-- tutaj dorzucamy jeszcze trochę paczek, żeby było trochę przesyłek z wieloma paczkami   
FOR i IN 1..100 LOOP

    INSERT INTO Paczki VALUES (id, dbms_random.value(1, ilość_przesyłek), 
        dbms_random.value(1, ilość_lokalizacji), 
        dbms_random.value(1, ilość_typów_paczek), 
        dbms_random.value(0.01, 20), dbms_random.value(0.01, 4)); -- masa w kg, rozmiar w m^3

    id := id + 1;

END LOOP;   
   
END;
/



create or replace PROCEDURE generuj_płatności IS

TYPE TABSTR IS TABLE OF VARCHAR(100);
    opisy_płatności TABSTR;    
    ilość_typów_płatności INTEGER;
    ilość_opisów_płatności INTEGER;

BEGIN

opisy_płatności := TABSTR ('Płatność wykonana przed wysłaniem przesyłki', 
    'Płatność wykonana przy odbiorze przesyłki', 'Płatność wykonywana w ratach',
    'Płatność pokryta w całości jedną ratą');

ilość_opisów_płatności := opisy_płatności.count;
select count (*) into ilość_typów_płatności from Typy_płatności;

FOR i IN 1..100 LOOP

    INSERT INTO Płatności VALUES (i, dbms_random.value(1, ilość_typów_płatności), 
    opisy_płatności(dbms_random.value(1, ilość_opisów_płatności)));   

END LOOP;
   
END;
/




create or replace PROCEDURE generuj_adresy IS

TYPE TABSTR IS TABLE OF VARCHAR(100);
    ulice_polskie TABSTR;
    ulice_niemieckie TABSTR;     
    ilość_ulic_polskich INTEGER;    
    ilość_ulic_niemieckich INTEGER;    
    losowanie INTEGER;
    losowanie2 INTEGER;

BEGIN

  ulice_polskie := TABSTR ('ul.	23 Lutego', 'ul.	27 Grudnia', 'ul.	28 Czerwca 1956 r.', 'ul.	3 Maja', 'ul.	5 Stycznia', 'ul.	9 Maja', 'ul.	Romana Abrahama', 'ul.	Franciszka Adamanisa', 'ul.	Admiralska', 'ul.	Agatowa', 'ul.	Agrestowa', 'ul.	Kazimierza Ajdukiewicza', 'ul.	Ajschylosa', 'ul.	Akacjowa', 'ul.	Albańska', 'al.	Aleje Solidarności', 'ul.	Altanowa', 'ul.	Franciszka Altera', 'ul.	Alzacka', 'ul.	Ametystowa', 'ul.	Ananasowa', 'ul.	Andaluzyjska', 'pl.	Władysława Andersa', 'ul.	Christiana Andersena', 'ul.	Andrychowska', 'ul.	Antoniego Andrzejewskiego', 'ul.	św. Antoniego', 'wiadukt	Antoninek', 'ul.	Anyżowa', 'ul.	Aragońska', 'ul.	Architektów', 'ul.	Krzysztofa Arciszewskiego', 'ul.	Bohdana Arcta', 'ul.	Henryka Arctowskiego', 'ul.	Arkońska', 'ul.	Armeńska', 'os.	Armii Krajowej', 'ul.	Armii Ludowej', 'al.	Armii Poznań', 'ul.	Arnikowa', 'ul.	Aroniowa', 'ul.	Arystofanesa', 'pl.	Adama Asnyka', 'ul.	Adama Asnyka', 'ul.	Astrowa', 'ul.	Augustowska', 'ul.	Azaliowa', 'ul.	Babicka', 'ul.	Babimojska', 'ul.	Jana Baptysty Quadro', 'ul.	Krzysztofa Kamila Baczyńskiego', 'ul.	Jerzego Bajana', 'os.	Bajkowe', 'ul.	Stefana Balickiego', 'most	Lucjana Ballenstedta', 'ul.	Lucjana Ballenstedta', 'ul.	Balonowa', 'ul.	Honoriusza Balzaka', 'ul.	Bałtycka', 'ul.	Michała Bałuckiego', 'ul.	Bananowa', 'ul.	Barana', 'ul.	abpa Antoniego Baraniaka', 'ul.	Baranowska', 'ul.	św. Barbary', 'ul.	Barcińska', 'ul.	Barczewska', 'ul.	Barlinecka', 'ul.	Barska', 'ul.	Bartnicza', 'ul.	Bartoszycka');
  ulice_niemieckie := TABSTR ('Bachstraße', 'Dachsteig', 'Dieselstraße', 'Amselweg', 'Emilstraße', 'Blücherweg', 'Akademiestraße', 'Fabrikstraße', 'Fasanensteig', 'Hammelstall', 'Gutenbergstraße', 'Jessenstraße');
  
  ilość_ulic_polskich := ulice_polskie.count;    
  ilość_ulic_niemieckich := ulice_niemieckie.count;
  
FOR i IN 1..50 LOOP -- 50 polskich adresów

losowanie := dbms_random.value(1, 8);

IF losowanie = 1 THEN
    losowanie2 := dbms_random.value(1, 3);
ELSIF losowanie = 2 THEN
    losowanie2 := 4;
ELSIF losowanie = 3 THEN
    losowanie2 := 5;
ELSIF losowanie = 4 THEN
    losowanie2 := 6;
ELSIF losowanie = 5 THEN
    losowanie2 := 7;
ELSIF losowanie = 6 THEN
    losowanie2 := dbms_random.value(8, 10);
ELSIF losowanie = 7 THEN
    losowanie2 := dbms_random.value(11, 12);
ELSIF losowanie = 8 THEN
    losowanie2 := 13;
END IF;

    INSERT INTO Adresy VALUES (i, ulice_polskie(dbms_random.value(1, ilość_ulic_polskich)), 
    round(dbms_random.value(1, 100)), round(dbms_random.value(1, 100)),
    round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)) || '-' || round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)),
    losowanie2, losowanie, 1); -- odpowiednie identyfikatory

END LOOP;
   
FOR i IN 1..50 LOOP -- 50 niemieckich adresów

    losowanie := dbms_random.value(1, 4);

    INSERT INTO Adresy VALUES (i + 50, ulice_niemieckie(dbms_random.value(1, ilość_ulic_niemieckich)), 
    round(dbms_random.value(1, 100)), round(dbms_random.value(1, 100)),
    round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)) || '-' || round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)) || round(dbms_random.value(0, 9)),
    losowanie + 13, losowanie + 8, 2); -- odpowiednie identyfikatory
END LOOP;   
   
END;
/




create or replace PROCEDURE generuj_lokalizacje IS

    ilość_adresów INTEGER;
    typ_lokalizacji VARCHAR(100);

BEGIN

select count (*) into ilość_adresów from Adresy;

-- wstawiamy podstawowe lokalizacje
INSERT INTO Lokalizacje VALUES (1, 1, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (2, 2, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (3, 2, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (4, 2, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (5, 2, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (6, 2, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (7, 3, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (8, 3, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (9, 3, dbms_random.value(1, ilość_adresów));
INSERT INTO Lokalizacje VALUES (10, 3, dbms_random.value(1, ilość_adresów));

-- wstawiamy pozostale lokalizacje
FOR i IN 11..100 LOOP

IF dbms_random.value(0, 1) >= 0.5 THEN
    INSERT INTO Lokalizacje VALUES (i, 4, dbms_random.value(1, ilość_adresów)); 
ELSE
    INSERT INTO Lokalizacje VALUES (i, 5, dbms_random.value(1, ilość_adresów)); 
END IF;

END LOOP;
   
END;
/




create or replace PROCEDURE generuj_pracowników IS

TYPE TABSTR IS TABLE OF VARCHAR2(100);
    imiona_męskie TABSTR;
    imiona_żeńskie TABSTR;
    nazwiska_męskie TABSTR;
    nazwiska_żeńskie TABSTR;
    
    ilość_adresów INTEGER;
    ilość_imion_żeńskich INTEGER;    
    ilość_imion_męskich INTEGER;
    ilość_nazwisk_żeńskich INTEGER;
    ilość_nazwisk_męskich INTEGER;
    
    imie VARCHAR(100);
    drugie_imie VARCHAR(100);
    nazwisko VARCHAR(100);
    id_lokalizacji INTEGER;
    id_typu_pracownika INTEGER;

BEGIN
 	imiona_męskie := TABSTR ('Adam', 'Adrian', 'Albert', 'Aleksander', 'Aleksy', 'Alfred', 'Amadeusz', 'Andrzej', 'Antoni', 'Arkadiusz', 'Arnold', 'Artur', 'Bartłomiej', 'Bartosz', 'Benedykt', 'Beniamin', 'Bernard', 'Błażej', 'Bogdan', 'Bogumił', 'Bogusław', 'Bolesław', 'Borys', 'Bronisław', 'Cezary', 'Cyprian', 'Cyryl', 'Czesław', 'Damian', 'Daniel', 'Dariusz', 'Dawid', 'Dionizy', 'Dominik', 'Donald', 'Edward', 'Emanuel', 'Emil', 'Eryk', 'Eugeniusz', 'Fabian', 'Feliks', 'Ferdynand', 'Filip', 'Franciszek', 'Fryderyk', 'Gabriel', 'Gerard', 'Grzegorz', 'Gustaw', 'Henryk', 'Herbert', 'Hilary', 'Hubert', 'Ignacy', 'Igor', 'Ireneusz', 'Jacek', 'Jakub', 'Jan', 'Janusz', 'Jarosław', 'Jerzy', 'Joachim', 'Józef', 'Julian', 'Juliusz', 'Kacper', 'Kajetan', 'Kamil', 'Karol', 'Kazimierz', 'Klaudiusz', 'Konrad', 'Krystian', 'Krzysztof', 'Lech', 'Leon', 'Leszek', 'Lucjan', 'Ludwik', 'Łukasz', 'Maciej', 'Maksymilian', 'Marceli', 'Marcin', 'Marek', 'Marian', 'Mariusz', 'Mateusz', 'Michał', 'Mieczysław', 'Mikołaj', 'Miłosz', 'Mirosław', 'Nikodem', 'Norbert', 'Olaf', 'Olgierd', 'Oskar', 'Patryk', 'Paweł', 'Piotr', 'Przemysław', 'Radosław', 'Rafał', 'Remigiusz', 'Robert', 'Roman', 'Rudolf', 'Ryszard', 'Sebastian', 'Seweryn', 'Sławomir', 'Stanisław', 'Stefan', 'Sylwester', 'Szymon', 'Tadeusz', 'Teodor', 'Tomasz', 'Wacław', 'Waldemar', 'Wiesław', 'Wiktor', 'Witold', 'Władysław', 'Włodzimierz', 'Wojciech', 'Zbigniew', 'Zdzisław', 'Zenon', 'Zygmunt');
  imiona_żeńskie := TABSTR('Ada', 'Adela', 'Adelajda', 'Adrianna', 'Agata', 'Agnieszka', 'Aldona', 'Aleksandra', 'Alicja', 'Alina', 'Amanda', 'Amelia', 'Anastazja', 'Andżelika', 'Aneta', 'Anita', 'Anna', 'Antonina', 'Barbara', 'Beata', 'Berenika', 'Bernadeta', 'Blanka', 'Bogusława', 'Bożena', 'Cecylia', 'Celina', 'Czesława', 'Dagmara', 'Danuta', 'Daria', 'Diana', 'Dominika', 'Dorota', 'Edyta', 'Eliza', 'Elwira', 'Elżbieta', 'Emilia', 'Eugenia', 'Ewa', 'Ewelina', 'Felicja', 'Franciszka', 'Gabriela', 'Grażyna', 'Halina', 'Hanna', 'Helena', 'Iga', 'Ilona', 'Irena', 'Irmina', 'Iwona', 'Izabela', 'Jadwiga', 'Janina', 'Joanna', 'Jolanta', 'Jowita', 'Judyta', 'Julia', 'Julita', 'Justyna', 'Kamila', 'Karina', 'Karolina', 'Katarzyna', 'Kazimiera', 'Kinga', 'Klaudia', 'Kleopatra', 'Kornelia', 'Krystyna', 'Laura', 'Lena', 'Leokadia', 'Lidia', 'Liliana', 'Lucyna', 'Ludmiła', 'Luiza', 'Łucja', 'Magdalena', 'Maja', 'Malwina', 'Małgorzata', 'Marcelina', 'Maria', 'Marianna', 'Mariola', 'Marlena', 'Marta', 'Martyna', 'Marzanna', 'Marzena', 'Matylda', 'Melania', 'Michalina', 'Milena', 'Mirosława', 'Monika', 'Nadia', 'Natalia', 'Natasza', 'Nikola', 'Nina', 'Olga', 'Oliwia', 'Otylia', 'Pamela', 'Patrycja', 'Paula', 'Paulina', 'Regina', 'Renata', 'Roksana', 'Róża', 'Rozalia', 'Sabina', 'Sandra', 'Sara', 'Sonia', 'Stanisława', 'Stefania', 'Stella', 'Sylwia', 'Tamara', 'Tatiana', 'Teresa', 'Urszula', 'Weronika', 'Wiesława', 'Wiktoria', 'Wioletta', 'Zofia', 'Zuzanna', 'Zyta', 'Żaneta');
  nazwiska_męskie := TABSTR ('Nowak', 'Kowalski', 'Wiśniewski', 'Dąbrowski', 'Lewandowski', 'Wójcik', 'Kamiński', 'Kowalczyk', 'Zieliński', 'Szymański', 'Woźniak', 'Kozłowski', 'Jankowski', 'Wojciechowski', 'Kwiatkowski', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowski', 'Grabowski', 'Nowakowski', 'Pawłowski', 'Michalski', 'Nowicki', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłoński', 'Król', 'Majewski', 'Olszewski', 'Jaworski', 'Wróbel', 'Malinowski', 'Pawlak', 'Witkowski', 'Walczak', 'Stępień', 'Górski', 'Rutkowski', 'Michalak', 'Sikora', 'Ostrowski', 'Baran', 'Szewczyk', 'Tomaszewski', 'Pietrzak', 'Marciniak', 'Wróblewski', 'Zalewski', 'Jakubowski', 'Jasiński', 'Zawadzki', 'Sadowski', 'Bąk', 'Chmielewski', 'Włodarczyk', 'Borkowski', 'Czarnecki', 'Sawicki', 'Sokołowski', 'Urbański', 'Kubiak', 'Maciejewski', 'Szczepański', 'Kucharski', 'Wilk', 'Kalinowski', 'Lis', 'Mazurek', 'Wysocki', 'Adamski', 'Kaźmierczak', 'Wasilewski', 'Sobczak', 'Czerwiński', 'Andrzejewski', 'Cieślak', 'Głowacki', 'Zakrzewski', 'Kołodziej', 'Sikorski', 'Krajewski', 'Gajewski', 'Szymczak', 'Szulc', 'Baranowski', 'Laskowski', 'Brzeziński', 'Makowski', 'Ziółkowski', 'Przybylski', 'Domański', 'Nowacki', 'Borowski', 'Błaszczyk', 'Chojnacki', 'Ciesielski', 'Mróz', 'Szczepaniak', 'Wesołowski', 'Górecki', 'Krupa', 'Kaczmarczyk', 'Leszczyński', 'Lipiński', 'Kowalewski', 'Urbaniak', 'Kozak');
  nazwiska_żeńskie := TABSTR ('Nowak', 'Kowalska', 'Wiśniewska', 'Dąbrowska', 'Lewandowska', 'Wójcik', 'Kamińska', 'Kowalczyk', 'Zielińska', 'Szymańska', 'Woźniak', 'Kozłowska', 'Jankowska', 'Wojciechowska', 'Kwiatkowska', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowska', 'Grabowska', 'Nowakowska', 'Pawłowska', 'Michalska', 'Nowicka', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłońska', 'Król', 'Majewska', 'Olszewska', 'Jaworska', 'Wróbel', 'Malinowska', 'Pawlak', 'Witkowska', 'Walczak', 'Stępień', 'Górska', 'Rutkowska', 'Michalak', 'Sikora', 'Ostrowska', 'Baran', 'Szewczyk', 'Tomaszewska', 'Pietrzak', 'Marciniak', 'Wróblewska', 'Zalewska', 'Jakubowska', 'Jasińska', 'Zawadzki', 'Sadowska', 'Bąk', 'Chmielewska', 'Włodarczyk', 'Borkowska', 'Czarnecka', 'Sawicka', 'Sokołowska', 'Urbańska', 'Kubiak', 'Maciejewska', 'Szczepańska', 'Kucharska', 'Wilk', 'Kalinowska', 'Lis', 'Mazurek', 'Wysocka', 'Adamska', 'Kaźmierczak', 'Wasilewska', 'Sobczak', 'Czerwińska', 'Andrzejewska', 'Cieślak', 'Głowacka', 'Zakrzewska', 'Kołodziej', 'Sikorska', 'Krajewska', 'Gajewska', 'Szymczak', 'Szulc', 'Baranowska', 'Laskowska', 'Brzezińska', 'Makowska', 'Ziółkowska', 'Przybylska', 'Domańska', 'Nowacka', 'Borowska', 'Błaszczyk', 'Chojnacka', 'Ciesielska', 'Mróz', 'Szczepaniak', 'Wesołowska', 'Górecka', 'Krupa', 'Kaczmarczyk', 'Leszczyńska', 'Lipińska', 'Kowalewska', 'Urbaniak', 'Kozak');

  select count (*) into ilość_adresów from Adresy;
  ilość_imion_żeńskich := imiona_żeńskie.count; 
  ilość_imion_męskich := imiona_męskie.count;
  ilość_nazwisk_żeńskich := nazwiska_żeńskie.count;
  ilość_nazwisk_męskich := nazwiska_męskie.count;
  
  
FOR i IN 1..100 LOOP

IF dbms_random.value(0, 1) >= 0.5 THEN
    imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    drugie_imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    nazwisko := nazwiska_żeńskie(dbms_random.value(1, ilość_nazwisk_żeńskich));
ELSE
    imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    drugie_imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    nazwisko := nazwiska_męskie(dbms_random.value(1, ilość_nazwisk_męskich));
END IF;


IF 1 <= i AND i <= 5 THEN
    id_typu_pracownika := 1;
    id_lokalizacji := 1;
ELSIF 6 <= i AND i <= 10 THEN
    id_typu_pracownika := 2;
    id_lokalizacji := dbms_random.value(2, 6);
ELSIF 11 <= i AND i <= 20 THEN
    id_typu_pracownika := 3;
    id_lokalizacji := dbms_random.value(2, 6);
ELSIF 21 <= i AND i <= 60 THEN
    id_typu_pracownika := 4;
    id_lokalizacji := dbms_random.value(7, 10);
ELSIF 61 <= i AND i <= 100 THEN
    id_typu_pracownika := 5;
    id_lokalizacji := dbms_random.value(2, 6);
END IF;

    INSERT INTO Pracownicy VALUES (i, 
    id_typu_pracownika, dbms_random.value(1, ilość_adresów), id_lokalizacji, i, imie, 
    drugie_imie, nazwisko, dbms_random.value(2000, 20000));  

END LOOP;
   
END;
/






create or replace PROCEDURE generuj_nadawców IS

TYPE TABSTR IS TABLE OF VARCHAR2(100);
    imiona_męskie TABSTR;
    imiona_żeńskie TABSTR;
    nazwiska_męskie TABSTR;
    nazwiska_żeńskie TABSTR;
    ilość_imion_żeńskich INTEGER;    
    ilość_imion_męskich INTEGER;
    ilość_nazwisk_żeńskich INTEGER;
    ilość_nazwisk_męskich INTEGER;    
    ilość_adresów INTEGER;

imie VARCHAR(100);
drugie_imie VARCHAR(100);
nazwisko VARCHAR(100);

BEGIN
 	imiona_męskie := TABSTR ('Adam', 'Adrian', 'Albert', 'Aleksander', 'Aleksy', 'Alfred', 'Amadeusz', 'Andrzej', 'Antoni', 'Arkadiusz', 'Arnold', 'Artur', 'Bartłomiej', 'Bartosz', 'Benedykt', 'Beniamin', 'Bernard', 'Błażej', 'Bogdan', 'Bogumił', 'Bogusław', 'Bolesław', 'Borys', 'Bronisław', 'Cezary', 'Cyprian', 'Cyryl', 'Czesław', 'Damian', 'Daniel', 'Dariusz', 'Dawid', 'Dionizy', 'Dominik', 'Donald', 'Edward', 'Emanuel', 'Emil', 'Eryk', 'Eugeniusz', 'Fabian', 'Feliks', 'Ferdynand', 'Filip', 'Franciszek', 'Fryderyk', 'Gabriel', 'Gerard', 'Grzegorz', 'Gustaw', 'Henryk', 'Herbert', 'Hilary', 'Hubert', 'Ignacy', 'Igor', 'Ireneusz', 'Jacek', 'Jakub', 'Jan', 'Janusz', 'Jarosław', 'Jerzy', 'Joachim', 'Józef', 'Julian', 'Juliusz', 'Kacper', 'Kajetan', 'Kamil', 'Karol', 'Kazimierz', 'Klaudiusz', 'Konrad', 'Krystian', 'Krzysztof', 'Lech', 'Leon', 'Leszek', 'Lucjan', 'Ludwik', 'Łukasz', 'Maciej', 'Maksymilian', 'Marceli', 'Marcin', 'Marek', 'Marian', 'Mariusz', 'Mateusz', 'Michał', 'Mieczysław', 'Mikołaj', 'Miłosz', 'Mirosław', 'Nikodem', 'Norbert', 'Olaf', 'Olgierd', 'Oskar', 'Patryk', 'Paweł', 'Piotr', 'Przemysław', 'Radosław', 'Rafał', 'Remigiusz', 'Robert', 'Roman', 'Rudolf', 'Ryszard', 'Sebastian', 'Seweryn', 'Sławomir', 'Stanisław', 'Stefan', 'Sylwester', 'Szymon', 'Tadeusz', 'Teodor', 'Tomasz', 'Wacław', 'Waldemar', 'Wiesław', 'Wiktor', 'Witold', 'Władysław', 'Włodzimierz', 'Wojciech', 'Zbigniew', 'Zdzisław', 'Zenon', 'Zygmunt');
  imiona_żeńskie := TABSTR('Ada', 'Adela', 'Adelajda', 'Adrianna', 'Agata', 'Agnieszka', 'Aldona', 'Aleksandra', 'Alicja', 'Alina', 'Amanda', 'Amelia', 'Anastazja', 'Andżelika', 'Aneta', 'Anita', 'Anna', 'Antonina', 'Barbara', 'Beata', 'Berenika', 'Bernadeta', 'Blanka', 'Bogusława', 'Bożena', 'Cecylia', 'Celina', 'Czesława', 'Dagmara', 'Danuta', 'Daria', 'Diana', 'Dominika', 'Dorota', 'Edyta', 'Eliza', 'Elwira', 'Elżbieta', 'Emilia', 'Eugenia', 'Ewa', 'Ewelina', 'Felicja', 'Franciszka', 'Gabriela', 'Grażyna', 'Halina', 'Hanna', 'Helena', 'Iga', 'Ilona', 'Irena', 'Irmina', 'Iwona', 'Izabela', 'Jadwiga', 'Janina', 'Joanna', 'Jolanta', 'Jowita', 'Judyta', 'Julia', 'Julita', 'Justyna', 'Kamila', 'Karina', 'Karolina', 'Katarzyna', 'Kazimiera', 'Kinga', 'Klaudia', 'Kleopatra', 'Kornelia', 'Krystyna', 'Laura', 'Lena', 'Leokadia', 'Lidia', 'Liliana', 'Lucyna', 'Ludmiła', 'Luiza', 'Łucja', 'Magdalena', 'Maja', 'Malwina', 'Małgorzata', 'Marcelina', 'Maria', 'Marianna', 'Mariola', 'Marlena', 'Marta', 'Martyna', 'Marzanna', 'Marzena', 'Matylda', 'Melania', 'Michalina', 'Milena', 'Mirosława', 'Monika', 'Nadia', 'Natalia', 'Natasza', 'Nikola', 'Nina', 'Olga', 'Oliwia', 'Otylia', 'Pamela', 'Patrycja', 'Paula', 'Paulina', 'Regina', 'Renata', 'Roksana', 'Róża', 'Rozalia', 'Sabina', 'Sandra', 'Sara', 'Sonia', 'Stanisława', 'Stefania', 'Stella', 'Sylwia', 'Tamara', 'Tatiana', 'Teresa', 'Urszula', 'Weronika', 'Wiesława', 'Wiktoria', 'Wioletta', 'Zofia', 'Zuzanna', 'Zyta', 'Żaneta');
  nazwiska_męskie := TABSTR ('Nowak', 'Kowalski', 'Wiśniewski', 'Dąbrowski', 'Lewandowski', 'Wójcik', 'Kamiński', 'Kowalczyk', 'Zieliński', 'Szymański', 'Woźniak', 'Kozłowski', 'Jankowski', 'Wojciechowski', 'Kwiatkowski', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowski', 'Grabowski', 'Nowakowski', 'Pawłowski', 'Michalski', 'Nowicki', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłoński', 'Król', 'Majewski', 'Olszewski', 'Jaworski', 'Wróbel', 'Malinowski', 'Pawlak', 'Witkowski', 'Walczak', 'Stępień', 'Górski', 'Rutkowski', 'Michalak', 'Sikora', 'Ostrowski', 'Baran', 'Szewczyk', 'Tomaszewski', 'Pietrzak', 'Marciniak', 'Wróblewski', 'Zalewski', 'Jakubowski', 'Jasiński', 'Zawadzki', 'Sadowski', 'Bąk', 'Chmielewski', 'Włodarczyk', 'Borkowski', 'Czarnecki', 'Sawicki', 'Sokołowski', 'Urbański', 'Kubiak', 'Maciejewski', 'Szczepański', 'Kucharski', 'Wilk', 'Kalinowski', 'Lis', 'Mazurek', 'Wysocki', 'Adamski', 'Kaźmierczak', 'Wasilewski', 'Sobczak', 'Czerwiński', 'Andrzejewski', 'Cieślak', 'Głowacki', 'Zakrzewski', 'Kołodziej', 'Sikorski', 'Krajewski', 'Gajewski', 'Szymczak', 'Szulc', 'Baranowski', 'Laskowski', 'Brzeziński', 'Makowski', 'Ziółkowski', 'Przybylski', 'Domański', 'Nowacki', 'Borowski', 'Błaszczyk', 'Chojnacki', 'Ciesielski', 'Mróz', 'Szczepaniak', 'Wesołowski', 'Górecki', 'Krupa', 'Kaczmarczyk', 'Leszczyński', 'Lipiński', 'Kowalewski', 'Urbaniak', 'Kozak');
  nazwiska_żeńskie := TABSTR ('Nowak', 'Kowalska', 'Wiśniewska', 'Dąbrowska', 'Lewandowska', 'Wójcik', 'Kamińska', 'Kowalczyk', 'Zielińska', 'Szymańska', 'Woźniak', 'Kozłowska', 'Jankowska', 'Wojciechowska', 'Kwiatkowska', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowska', 'Grabowska', 'Nowakowska', 'Pawłowska', 'Michalska', 'Nowicka', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłońska', 'Król', 'Majewska', 'Olszewska', 'Jaworska', 'Wróbel', 'Malinowska', 'Pawlak', 'Witkowska', 'Walczak', 'Stępień', 'Górska', 'Rutkowska', 'Michalak', 'Sikora', 'Ostrowska', 'Baran', 'Szewczyk', 'Tomaszewska', 'Pietrzak', 'Marciniak', 'Wróblewska', 'Zalewska', 'Jakubowska', 'Jasińska', 'Zawadzki', 'Sadowska', 'Bąk', 'Chmielewska', 'Włodarczyk', 'Borkowska', 'Czarnecka', 'Sawicka', 'Sokołowska', 'Urbańska', 'Kubiak', 'Maciejewska', 'Szczepańska', 'Kucharska', 'Wilk', 'Kalinowska', 'Lis', 'Mazurek', 'Wysocka', 'Adamska', 'Kaźmierczak', 'Wasilewska', 'Sobczak', 'Czerwińska', 'Andrzejewska', 'Cieślak', 'Głowacka', 'Zakrzewska', 'Kołodziej', 'Sikorska', 'Krajewska', 'Gajewska', 'Szymczak', 'Szulc', 'Baranowska', 'Laskowska', 'Brzezińska', 'Makowska', 'Ziółkowska', 'Przybylska', 'Domańska', 'Nowacka', 'Borowska', 'Błaszczyk', 'Chojnacka', 'Ciesielska', 'Mróz', 'Szczepaniak', 'Wesołowska', 'Górecka', 'Krupa', 'Kaczmarczyk', 'Leszczyńska', 'Lipińska', 'Kowalewska', 'Urbaniak', 'Kozak');

  select count (*) into ilość_adresów from Adresy;
  ilość_imion_żeńskich := imiona_żeńskie.count; 
  ilość_imion_męskich := imiona_męskie.count;
  ilość_nazwisk_żeńskich := nazwiska_żeńskie.count;
  ilość_nazwisk_męskich := nazwiska_męskie.count;
  
FOR i IN 1..100 LOOP

IF dbms_random.value(0, 1) >= 0.5 THEN
    imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    drugie_imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    nazwisko := nazwiska_żeńskie(dbms_random.value(1, ilość_nazwisk_żeńskich));
ELSE
    imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    drugie_imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    nazwisko := nazwiska_męskie(dbms_random.value(1, ilość_nazwisk_męskich));
END IF;

    INSERT INTO Nadawcy VALUES (i, i + 100, 
    dbms_random.value(1, ilość_adresów), 
    imie, drugie_imie, nazwisko);  

END LOOP;
   
END;
/





create or replace PROCEDURE generuj_odbiorców IS

TYPE TABSTR IS TABLE OF VARCHAR2(100);
    imiona_męskie TABSTR;
    imiona_żeńskie TABSTR;
    nazwiska_męskie TABSTR;
    nazwiska_żeńskie TABSTR;
    ilość_imion_żeńskich INTEGER;    
    ilość_imion_męskich INTEGER;
    ilość_nazwisk_żeńskich INTEGER;
    ilość_nazwisk_męskich INTEGER;    
    ilość_adresów INTEGER;

    imie VARCHAR(100);
    drugie_imie VARCHAR(100);
    nazwisko VARCHAR(100);

BEGIN
 	imiona_męskie := TABSTR ('Adam', 'Adrian', 'Albert', 'Aleksander', 'Aleksy', 'Alfred', 'Amadeusz', 'Andrzej', 'Antoni', 'Arkadiusz', 'Arnold', 'Artur', 'Bartłomiej', 'Bartosz', 'Benedykt', 'Beniamin', 'Bernard', 'Błażej', 'Bogdan', 'Bogumił', 'Bogusław', 'Bolesław', 'Borys', 'Bronisław', 'Cezary', 'Cyprian', 'Cyryl', 'Czesław', 'Damian', 'Daniel', 'Dariusz', 'Dawid', 'Dionizy', 'Dominik', 'Donald', 'Edward', 'Emanuel', 'Emil', 'Eryk', 'Eugeniusz', 'Fabian', 'Feliks', 'Ferdynand', 'Filip', 'Franciszek', 'Fryderyk', 'Gabriel', 'Gerard', 'Grzegorz', 'Gustaw', 'Henryk', 'Herbert', 'Hilary', 'Hubert', 'Ignacy', 'Igor', 'Ireneusz', 'Jacek', 'Jakub', 'Jan', 'Janusz', 'Jarosław', 'Jerzy', 'Joachim', 'Józef', 'Julian', 'Juliusz', 'Kacper', 'Kajetan', 'Kamil', 'Karol', 'Kazimierz', 'Klaudiusz', 'Konrad', 'Krystian', 'Krzysztof', 'Lech', 'Leon', 'Leszek', 'Lucjan', 'Ludwik', 'Łukasz', 'Maciej', 'Maksymilian', 'Marceli', 'Marcin', 'Marek', 'Marian', 'Mariusz', 'Mateusz', 'Michał', 'Mieczysław', 'Mikołaj', 'Miłosz', 'Mirosław', 'Nikodem', 'Norbert', 'Olaf', 'Olgierd', 'Oskar', 'Patryk', 'Paweł', 'Piotr', 'Przemysław', 'Radosław', 'Rafał', 'Remigiusz', 'Robert', 'Roman', 'Rudolf', 'Ryszard', 'Sebastian', 'Seweryn', 'Sławomir', 'Stanisław', 'Stefan', 'Sylwester', 'Szymon', 'Tadeusz', 'Teodor', 'Tomasz', 'Wacław', 'Waldemar', 'Wiesław', 'Wiktor', 'Witold', 'Władysław', 'Włodzimierz', 'Wojciech', 'Zbigniew', 'Zdzisław', 'Zenon', 'Zygmunt');
  imiona_żeńskie := TABSTR('Ada', 'Adela', 'Adelajda', 'Adrianna', 'Agata', 'Agnieszka', 'Aldona', 'Aleksandra', 'Alicja', 'Alina', 'Amanda', 'Amelia', 'Anastazja', 'Andżelika', 'Aneta', 'Anita', 'Anna', 'Antonina', 'Barbara', 'Beata', 'Berenika', 'Bernadeta', 'Blanka', 'Bogusława', 'Bożena', 'Cecylia', 'Celina', 'Czesława', 'Dagmara', 'Danuta', 'Daria', 'Diana', 'Dominika', 'Dorota', 'Edyta', 'Eliza', 'Elwira', 'Elżbieta', 'Emilia', 'Eugenia', 'Ewa', 'Ewelina', 'Felicja', 'Franciszka', 'Gabriela', 'Grażyna', 'Halina', 'Hanna', 'Helena', 'Iga', 'Ilona', 'Irena', 'Irmina', 'Iwona', 'Izabela', 'Jadwiga', 'Janina', 'Joanna', 'Jolanta', 'Jowita', 'Judyta', 'Julia', 'Julita', 'Justyna', 'Kamila', 'Karina', 'Karolina', 'Katarzyna', 'Kazimiera', 'Kinga', 'Klaudia', 'Kleopatra', 'Kornelia', 'Krystyna', 'Laura', 'Lena', 'Leokadia', 'Lidia', 'Liliana', 'Lucyna', 'Ludmiła', 'Luiza', 'Łucja', 'Magdalena', 'Maja', 'Malwina', 'Małgorzata', 'Marcelina', 'Maria', 'Marianna', 'Mariola', 'Marlena', 'Marta', 'Martyna', 'Marzanna', 'Marzena', 'Matylda', 'Melania', 'Michalina', 'Milena', 'Mirosława', 'Monika', 'Nadia', 'Natalia', 'Natasza', 'Nikola', 'Nina', 'Olga', 'Oliwia', 'Otylia', 'Pamela', 'Patrycja', 'Paula', 'Paulina', 'Regina', 'Renata', 'Roksana', 'Róża', 'Rozalia', 'Sabina', 'Sandra', 'Sara', 'Sonia', 'Stanisława', 'Stefania', 'Stella', 'Sylwia', 'Tamara', 'Tatiana', 'Teresa', 'Urszula', 'Weronika', 'Wiesława', 'Wiktoria', 'Wioletta', 'Zofia', 'Zuzanna', 'Zyta', 'Żaneta');
  nazwiska_męskie := TABSTR ('Nowak', 'Kowalski', 'Wiśniewski', 'Dąbrowski', 'Lewandowski', 'Wójcik', 'Kamiński', 'Kowalczyk', 'Zieliński', 'Szymański', 'Woźniak', 'Kozłowski', 'Jankowski', 'Wojciechowski', 'Kwiatkowski', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowski', 'Grabowski', 'Nowakowski', 'Pawłowski', 'Michalski', 'Nowicki', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłoński', 'Król', 'Majewski', 'Olszewski', 'Jaworski', 'Wróbel', 'Malinowski', 'Pawlak', 'Witkowski', 'Walczak', 'Stępień', 'Górski', 'Rutkowski', 'Michalak', 'Sikora', 'Ostrowski', 'Baran', 'Szewczyk', 'Tomaszewski', 'Pietrzak', 'Marciniak', 'Wróblewski', 'Zalewski', 'Jakubowski', 'Jasiński', 'Zawadzki', 'Sadowski', 'Bąk', 'Chmielewski', 'Włodarczyk', 'Borkowski', 'Czarnecki', 'Sawicki', 'Sokołowski', 'Urbański', 'Kubiak', 'Maciejewski', 'Szczepański', 'Kucharski', 'Wilk', 'Kalinowski', 'Lis', 'Mazurek', 'Wysocki', 'Adamski', 'Kaźmierczak', 'Wasilewski', 'Sobczak', 'Czerwiński', 'Andrzejewski', 'Cieślak', 'Głowacki', 'Zakrzewski', 'Kołodziej', 'Sikorski', 'Krajewski', 'Gajewski', 'Szymczak', 'Szulc', 'Baranowski', 'Laskowski', 'Brzeziński', 'Makowski', 'Ziółkowski', 'Przybylski', 'Domański', 'Nowacki', 'Borowski', 'Błaszczyk', 'Chojnacki', 'Ciesielski', 'Mróz', 'Szczepaniak', 'Wesołowski', 'Górecki', 'Krupa', 'Kaczmarczyk', 'Leszczyński', 'Lipiński', 'Kowalewski', 'Urbaniak', 'Kozak');
  nazwiska_żeńskie := TABSTR ('Nowak', 'Kowalska', 'Wiśniewska', 'Dąbrowska', 'Lewandowska', 'Wójcik', 'Kamińska', 'Kowalczyk', 'Zielińska', 'Szymańska', 'Woźniak', 'Kozłowska', 'Jankowska', 'Wojciechowska', 'Kwiatkowska', 'Kaczmarek', 'Mazur', 'Krawczyk', 'Piotrowska', 'Grabowska', 'Nowakowska', 'Pawłowska', 'Michalska', 'Nowicka', 'Adamczyk', 'Dudek', 'Zając', 'Wieczorek', 'Jabłońska', 'Król', 'Majewska', 'Olszewska', 'Jaworska', 'Wróbel', 'Malinowska', 'Pawlak', 'Witkowska', 'Walczak', 'Stępień', 'Górska', 'Rutkowska', 'Michalak', 'Sikora', 'Ostrowska', 'Baran', 'Szewczyk', 'Tomaszewska', 'Pietrzak', 'Marciniak', 'Wróblewska', 'Zalewska', 'Jakubowska', 'Jasińska', 'Zawadzki', 'Sadowska', 'Bąk', 'Chmielewska', 'Włodarczyk', 'Borkowska', 'Czarnecka', 'Sawicka', 'Sokołowska', 'Urbańska', 'Kubiak', 'Maciejewska', 'Szczepańska', 'Kucharska', 'Wilk', 'Kalinowska', 'Lis', 'Mazurek', 'Wysocka', 'Adamska', 'Kaźmierczak', 'Wasilewska', 'Sobczak', 'Czerwińska', 'Andrzejewska', 'Cieślak', 'Głowacka', 'Zakrzewska', 'Kołodziej', 'Sikorska', 'Krajewska', 'Gajewska', 'Szymczak', 'Szulc', 'Baranowska', 'Laskowska', 'Brzezińska', 'Makowska', 'Ziółkowska', 'Przybylska', 'Domańska', 'Nowacka', 'Borowska', 'Błaszczyk', 'Chojnacka', 'Ciesielska', 'Mróz', 'Szczepaniak', 'Wesołowska', 'Górecka', 'Krupa', 'Kaczmarczyk', 'Leszczyńska', 'Lipińska', 'Kowalewska', 'Urbaniak', 'Kozak');

  ilość_imion_żeńskich := imiona_żeńskie.count; 
  ilość_imion_męskich := imiona_męskie.count;
  ilość_nazwisk_żeńskich := nazwiska_żeńskie.count;
  ilość_nazwisk_męskich := nazwiska_męskie.count;

  select count (*) into ilość_adresów from Adresy;

FOR i IN 1..100 LOOP

IF dbms_random.value(0, 1) >= 0.5 THEN
    imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    drugie_imie := imiona_żeńskie(dbms_random.value(1, ilość_imion_żeńskich));
    nazwisko := nazwiska_żeńskie(dbms_random.value(1, ilość_nazwisk_żeńskich));
ELSE
    imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    drugie_imie := imiona_męskie(dbms_random.value(1, ilość_imion_męskich));
    nazwisko := nazwiska_męskie(dbms_random.value(1, ilość_nazwisk_męskich));
END IF;

    INSERT INTO Odbiorcy VALUES (i, 
    dbms_random.value(1, ilość_adresów), 
    imie, drugie_imie, nazwisko);  

END LOOP;
   
END;
/



create or replace PROCEDURE generuj_konta IS
  
BEGIN
  
-- konta informatykow, członków zarządu i menadżerów
FOR i IN 1..20 LOOP

    INSERT INTO Konta VALUES (i, dbms_random.string('L', 10), 
    1, 
    dbms_random.string('P', 10),
    dbms_random.string('L', 10) || '@gmail.com');    

END LOOP;

-- konta pracownikow  
FOR i IN 21..100 LOOP

    INSERT INTO Konta VALUES (i, dbms_random.string('L', 10), 
    2, 
    dbms_random.string('P', 10),
    dbms_random.string('L', 10) || '@gmail.com');    

END LOOP;   
   
-- konta nadawców  
FOR i IN 101..200 LOOP

    INSERT INTO Konta VALUES (i, dbms_random.string('L', 10), 
    3, 
    dbms_random.string('P', 10),
    dbms_random.string('L', 10) || '@gmail.com');    

END LOOP;      
   
END;
/



create or replace PROCEDURE generuj_pojazdy IS

TYPE TABSTR IS TABLE OF VARCHAR(100);
    marki_pojazdów TABSTR;
    wylosowany_id_typu_pojadu INTEGER;
    ilość_marek INTEGER;
    ilość_typów_pojazdów INTEGER;

BEGIN
  marki_pojazdów := TABSTR ('BMW', 'Honda', 'Mercedes', 'Volksvagen', 'Audi', 'Renault', 'Ferrari', 'Hyundai', 'Skoda', 'Mazda', 'Volvo', 'Fiat', 'Chevrolet');
  ilość_marek := marki_pojazdów.count;
  select count (*) into ilość_typów_pojazdów from Typy_pojazdów_kurierskich;
  
FOR i IN 1..100 LOOP

wylosowany_id_typu_pojadu := dbms_random.value(1, ilość_typów_pojazdów);

IF wylosowany_id_typu_pojadu = 4 THEN -- rower
   
   INSERT INTO Pojazdy_kurierskie VALUES (i, dbms_random.value(7, 10), 
   wylosowany_id_typu_pojadu, null, null,
   TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-12-31','J'), TO_CHAR(DATE '2020-12-31','J'))),'J'));
   
ELSE

    INSERT INTO Pojazdy_kurierskie VALUES (i, dbms_random.value(7, 10), wylosowany_id_typu_pojadu,
    dbms_random.string('X', 7), marki_pojazdów(dbms_random.value(1, ilość_marek)),
    TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-12-31','J'), TO_CHAR(DATE '2020-12-31','J'))),'J'));    

END IF;

END LOOP;   
   
END;
/



create or replace PROCEDURE generuj_kurierzy_pojazdy IS

    ilość_pojazdów INTEGER;
    data_użycia DATE;

BEGIN

select count (*) into ilość_pojazdów from Pojazdy_kurierskie;

FOR i IN 21..60 LOOP

  FOR j IN 1..ilość_pojazdów LOOP
  
  data_użycia := TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-12-31','J'), TO_CHAR(DATE '2016-12-31','J'))),'J');
  INSERT INTO Kurierzy_pojazdy VALUES (i, j, data_użycia);
  
  END LOOP;
  
END LOOP;
   
END;
/




create or replace PROCEDURE generuj_szefowie_podwładni IS

BEGIN
-- czlonkowie zarządu nad menadżerami
INSERT INTO Szefowie_podwładni VALUES (1, 11);
INSERT INTO Szefowie_podwładni VALUES (1, 12);
INSERT INTO Szefowie_podwładni VALUES (2, 13);
INSERT INTO Szefowie_podwładni VALUES (2, 14);
INSERT INTO Szefowie_podwładni VALUES (3, 15);
INSERT INTO Szefowie_podwładni VALUES (3, 16);
INSERT INTO Szefowie_podwładni VALUES (4, 17);
INSERT INTO Szefowie_podwładni VALUES (4, 18);
INSERT INTO Szefowie_podwładni VALUES (5, 19);
INSERT INTO Szefowie_podwładni VALUES (5, 20);

-- menadżerowie nad pozostalymi
FOR i IN 1..5 LOOP
  INSERT INTO Szefowie_podwładni VALUES (11, 5+i);
END LOOP;
   
FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (12, 20+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (13, 30+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (14, 40+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (15, 50+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (16, 60+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (17, 70+i);
END LOOP;

FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (18, 80+i);
END LOOP;
   
FOR i IN 1..10 LOOP
  INSERT INTO Szefowie_podwładni VALUES (19, 90+i);
END LOOP;   
   
END;
/