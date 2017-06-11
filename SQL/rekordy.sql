INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Mieszkanie');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Dom wolnostojący');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Dom-bliźniak');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Nieruchomość leśna');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Działka');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Magazyn');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Pomieszczenie biurowe');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Budynek mieszkalny');
INSERT INTO Typy(ID_typu, typ) VALUES (SEK_typ.NEXTVAL,'Budynek usługowy');


INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Żory','44-240');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Rybnik','44-200');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Jastrzębie-Zdrój','44-268');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Kaziemierz Dolny','24-120');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Katowice','40-101');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Cieszyn','43-400');
INSERT INTO Miasta(ID_miasta, miasto, kod_pocztowy)
VALUES (SEK_miasto.NEXTVAL,'Racibórz','47-400');

alter table miasta
drop constraint dobrykod;

alter table miasta
add constraint DOBRYKOD
CHECK (kod_pocztowy LIKE '__-___');

select constraint_name, r_constraint_name, table_name, index_name
from user_constraints
where table_name = 'miasta';

select *
from user_constraints
where constraint_name = 'DOBRYKOD';

check telefon1 like '0-9'


INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Emilia','Kowalczyk','032-414-550','669-856-987','kowalczyk@gmail.com');
INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Jarosława','Wąż','120-111-565','788-969-900','waz@gmail.com');

INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Agnieszka','Rydułtowska','023-330-450',NULL,'rydultowska.agnieszka@dobredomy.pl');

INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Witosz','Trocki','909-999-870','340-120-122','trocki@dobredomy.pl');

INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Władysław','Kurowski','567-776-900',NULL,'w_kurowski@gmail.com');

INSERT INTO Sprzedawcy(ID_sprzedawcy, imie, nazwisko, telefon1, telefon2, email)
VALUES (SEK_sprzedawca.NEXTVAL,'Adam','Mrok','234-992-875',NULL,'adam_mrok@nieruchomosci.pl');


INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Agnieszka', 'Agawa', 13, '456-666-342',NULL,'agawa@gmail.com');

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Ewelina', 'Śliwka', 21, '032-123-423',NULL,'sliwka@gmail.com');

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Adam', 'Gruszka', 22, '122-244-353',NULL,'gruszka@gmail.com');

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Robert', 'Wojdowski', 26, '032-431-122','333-232-900','r_wojdowski@interia.pl');

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Władysław', 'Szafowski', 25, '123-213-111','233-231-343',NULL);

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Felicjan', 'Czyrowski', 26, '213-900-022',NULL,NULL);

INSERT INTO Klienci (ID_klienta, imie, nazwisko, ID_miasta, telefon1, telefon2, email)
VALUES (SEK_klient.NEXTVAL,'Norbert', 'Bryk', 13, '309-232-222','982-090-099',NULL);


INSERT INTO Posiadlosci (ID_posiadlosci, ID_typu, ID_miasta, ID_sprzedawcy, ID_sprzedajacego, 
ulica, nr_domu, nr_mieszkania, powierzchnia, ilosc_pomieszczen, 
data_wystawienia, cena, ID_kupujacego, data_zakupu)
VALUES (SEK_posiadlosc.NEXTVAL, 1, 13, 3, 10, 
'Borowskiego', '8G', NULL, 400, 7,
TO_DATE('06-01-2015','DD-MM-YYYY'), 600000, 14, TO_DATE('11-06-2015','DD-MM-YYYY'));

INSERT INTO Posiadlosci (ID_posiadlosci, ID_typu, ID_miasta, ID_sprzedawcy, ID_sprzedajacego, 
ulica, nr_domu, nr_mieszkania, powierzchnia, ilosc_pomieszczen, 
data_wystawienia, cena, ID_kupujacego, data_zakupu)
VALUES (SEK_posiadlosc.NEXTVAL, 9, 23, 4, 10, 
'Miłorzębu', '11A', NULL, 8000, 5,
TO_DATE('06-12-2014','DD-MM-YYYY'), 660000, NULL, NULL);


INSERT INTO Posiadlosci (ID_posiadlosci, ID_typu, ID_miasta, ID_sprzedawcy, ID_sprzedajacego, 
ulica, nr_domu, nr_mieszkania, powierzchnia, ilosc_pomieszczen, 
data_wystawienia, cena, ID_kupujacego, data_zakupu)
VALUES (SEK_posiadlosc.NEXTVAL, 1, 22, 7, 14, 
'Sikorskiego', '5C', 13, 650, 5,
TO_DATE('09-08-2014','DD-MM-YYYY'), 130000.00, NULL, NULL);



INSERT INTO Posiadlosci (ID_posiadlosci, ID_typu, ID_miasta, ID_sprzedawcy, ID_sprzedajacego, 
ulica, nr_domu, nr_mieszkania, powierzchnia, ilosc_pomieszczen, 
data_wystawienia, cena, ID_kupujacego, data_zakupu)
VALUES (SEK_posiadlosc.NEXTVAL, 5, 24, 9, 9, 
'Autostradowa', 'ZOD-6', 78, 5000, NULL,
TO_DATE('30-09-2014','DD-MM-YYYY'), 100000.00, 10, TO_DATE('14-02-2015','DD-MM-YYYY'));

INSERT INTO Posiadlosci (ID_posiadlosci, ID_typu, ID_miasta, ID_sprzedawcy, ID_sprzedajacego, 
ulica, nr_domu, nr_mieszkania, powierzchnia, ilosc_pomieszczen, 
data_wystawienia, cena, ID_kupujacego, data_zakupu)
VALUES (SEK_posiadlosc.NEXTVAL, 3, 21, 8, 11, 
'Spokojna', '55', NULL, 900, 8,
TO_DATE('25-07-2013','DD-MM-YYYY'), 151000.00, 10, TO_DATE('12-06-2015','DD-MM-YYYY'));

KLIENCI: 8-14
TYPY: 1-900
Sprzedawcy : 3,4,7,8,9,10
miasta:13,21-26

INSERT INTO
VALUES (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), ('');
INSERT INTO
VALUES (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), ('');
INSERT INTO
VALUES (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), ('');

(''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), 
(''), (''), (''), (''), (''), (''), (''), (''), (''), ('')