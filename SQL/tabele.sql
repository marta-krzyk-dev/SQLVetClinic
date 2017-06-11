CREATE TABLE specjalizacje
(
	id_spec NUMBER(4) PRIMARY KEY,
	spec VARCHAR2(50) NOT NULL
);

ALTER TABLE specjalizacje
ADD CONSTRAINT TylkoLitery
CHECK (spec NOT LIKE '%[^A-Z]%');


CREATE TABLE weterynarze
(
	id_wet NUMBER(4) PRIMARY KEY,
	imie VARCHAR2(40) NOT NULL,
	nazwisko VARCHAR2(60) NOT NULL,
	data_zat DATE NOT NULL,
	telefon NUMBER(9)
);

ALTER TABLE weterynarze
ADD CONSTRAINT TylkoCyfry
CHECK (telefon LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

CREATE TABLE wet_spec
(
	id_wet NUMBER(4) REFERENCES weterynarze(id_wet) NOT NULL,
	id_spec NUMBER(4) REFERENCES specjalizacje(id_spec) NOT NULL,
	PRIMARY KEY (id_wet, id_spec)
);

CREATE TABLE gatunki
(
	id_gat NUMBER(4) PRIMARY KEY,
	gatunek VARCHAR2(25) NOT NULL UNIQUE,
	opis VARCHAR2(50)
);

ALTER TABLE gatunki
ADD CONSTRAINT TylkoLiteryGat
CHECK (gatunek NOT LIKE '%[^A-Z]%');


CREATE TABLE miejscowosci
(
	id_miejsc NUMBER(4) PRIMARY KEY,
	miejsc VARCHAR2(40) NOT NULL UNIQUE
);

CREATE TABLE wlasciciele
(
	id_wlas NUMBER(4) PRIMARY KEY,
	imie VARCHAR2(40) NOT NULL,
	nazw VARCHAR2(60) NOT NULL,
	miejscowosc VARCHAR2(40),
	ulica VARCHAR2(40),
	nr_domu_miesz VARCHAR2(5),
	tel NUMBER(9),    
	email VARCHAR2(50)
);

ALTER TABLE wlasciciele
ADD CONSTRAINT TylkoLiteryImie
CHECK (imie NOT LIKE '%[^A-Z ]%');

ALTER TABLE wlasciciele
ADD CONSTRAINT TylkoLiteryWlas
CHECK (nazw NOT LIKE '%[^A-Z]%');

ALTER TABLE wlasciciele
ADD CONSTRAINT TylkoLiteryWlas
CHECK (miejscowosc NOT LIKE '%[^A-Z]%');

CREATE TABLE pacjenci
(
	id_pac NUMBER(4) PRIMARY KEY,
	imie VARCHAR2(40) NOT NULL,
	id_gat REFERENCES gatunki NOT NULL,
	data_ur DATE,
	waga_kg NUMBER(6,2),
	uwagi VARCHAR2(80)
);

CREATE TABLE wlas_pac
(
	id_wlas NUMBER(4) REFERENCES wlasciciele NOT NULL,
	id_pac NUMBER(4) REFERENCES pacjenci NOT NULL,
	PRIMARY KEY (id_wlas, id_pac)
);

CREATE TABLE wizyty
(
	id_wiz NUMBER(4) PRIMARY KEY,
	id_wet REFERENCES weterynarze NOT NULL, 
	id_wlas REFERENCES wlasciciele NOT NULL,
	id_pac REFERENCES pacjenci,
	data_wiz DATE,
	cena NUMBER(6,2) DEFAULT(0) NOT NULL,
	komentarz VARCHAR2(250)
);

ALTER TABLE wizyty
ADD COINSTAINT Prawid_Wlas
CHECK id_pac
//podanie telefon2 nie wymagane
ALTER TABLE Sprzedawcy
MODIFY telefon2 NULL;

/*Telefon ma 12 cyfr*/
ALTER TABLE Sprzedawcy
MODIFY telefon1 VARCHAR2(12);
ALTER TABLE Sprzedawcy
MODIFY telefon2 VARCHAR2(12);

//podanie emaila wymagane
ALTER TABLE Sprzedawcy
MODIFY email NOT NULL;
		
	
ALTER TABLE Sprzedawcy
ADD CONSTRAINT DobryTelefon2
CHECK (telefon2 LIKE ('[0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-]'));
		
CREATE TABLE Klienci
(
	ID_klienta NUMBER(5) PRIMARY KEY,
	imie VARCHAR2(40) NOT NULL,
	nazwisko VARCHAR2(60) NOT NULL,
	ID_miasta REFERENCES Miasta,
	telefon1 VARCHAR2(12) NOT NULL,
	telefon2 VARCHAR2(12),
	email VARCHAR2(50)
);

ALTER TABLE Klienci
ADD CONSTRAINT DobryTel1
CHECK (telefon1 LIKE ('[0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-]'));
ALTER TABLE Klienci
ADD CONSTRAINT DobryTel2
CHECK (telefon2 LIKE ('[0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-][0-9,-]'));
		

ALTER TABLE Sprzedawcy 
ADD CONSTRAINT DobryEmail 
CHECK (email LIKE ('_%@_%._%'));

ALTER TABLE Klienci 
ADD CONSTRAINT DobryEmail 
CHECK (email LIKE '_%@_%._%');

CREATE TABLE Posiadlosci
(
	ID_posiadlosci NUMBER(5) PRIMARY KEY,
	ID_typu			 REFERENCES Typy NOT NULL,   
	ID_miasta 		 REFERENCES Miasta NOT NULL,
	ID_sprzedawcy 	 REFERENCES Sprzedawcy(ID_sprzedawcy) NOT NULL,
	ID_sprzedajacego REFERENCES Klienci(ID_klienta) NOT NULL,
		
	ulica VARCHAR2(50) NOT NULL,
	nr_domu VARCHAR2(5) NOT NULL,
	nr_mieszkania NUMBER(4),
	powierzchnia NUMBER(15,2),
	ilosc_pomieszczen NUMBER(3),
	data_wystawienia DATE,
	cena NUMBER (15,2) NOT NULL,
	
	ID_kupujacego REFERENCES Klienci(ID_klienta),
	data_zakupu DATE	
);

	ALTER TABLE Posiadlosci
	ADD CONSTRAINT DobraPowierzchnia
	CHECK (powierzchnia > 0);
	
	ALTER TABLE Posiadlosci
	ADD CONSTRAINT Pomieszczenia
	CHECK (ilosc_pomieszczen >= 0);
	
	//funkcja
	alter table Posiadlosci
   add constraint myck1 check (mydate_in_past_ind = 'Y')
  
	/*Data nie z przyszłości - nie udaje się przez sysdate*/
ALTER TABLE Posiadlosci
ADD CONSTRAINT DobraData2 
CHECK (data_wystawienia BETWEEN TO_DATE('01-01-2000','DD-MM-YYYY') AND TRUNC(SYSDATE));

/*Data wystawienia musi być taka jak data założenia firmy*/
ALTER TABLE Posiadlosci
ADD CONSTRAINT DobraData
CHECK (data_wystawienia >= TO_DATE('01-01-2000','DD-MM-YYYY'));

ALTER TABLE posiadlosci
drop CONSTRAINT dobradata;


	
	/*Cena musi być dodatnia*/
ALTER TABLE Posiadlosci
ADD CONSTRAINT DobraCena
CHECK (cena >= 0);
	
	/*Data nie może być z przyszłości i musi byc po wystawieniu*/
	ALTER TABLE Posiadlosci
	ADD CONSTRAINT DataDoDzisiaj
	CHECK (data_zakupu >= data_wystawienia);
	 /*(data_zakupu <= SYSDATE) AND*/
	
