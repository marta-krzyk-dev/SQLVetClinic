CREATE TABLESPACE wet
DATAFILE 'C:\Users\Marta\Desktop\GWSH\Bazy danych 2\Projekt zaliczeniowy Weterynarze\wet.ora'
SIZE 1M
AUTOEXTEND ON
NEXT 1M
MAXSIZE 10M;

//Sprawdź wynik
SELECT tablespace_name, status
FROM dba_tablespaces
WHERE tablespace_name = 'WET';

//Użytkownicy : 
admin (all priviledges, all tables, insert into weterynarze, specjalizacje), 
wet1 (widzi wszystko, wprowadza zwierze, wlasciciela,wizyty )
wet2
wet3
obsluga (rola sekretarki,  widzi wszystko oprócz danych adresu wlasciciela i danych szczegolowych wizyt)





//Przypisz użytkownika do przestrzeni tabel. Każdy użytkownik musi mieć przestrzeń tabel, domyślnie USERS
CREATE USER admin
IDENTIFIED BY wet
DEFAULT TABLESPACE WET
QUOTA UNLIMITED ON WET;

GRANT ALL PRIVILEGES to admin;
GRANT UNLIMITED WET TO admin;

CREATE USER wet1
IDENTIFIED BY wet
DEFAULT TABLESPACE WET
QUOTA 1M ON WET;

CREATE USER wet2
IDENTIFIED BY wet
DEFAULT TABLESPACE WET
QUOTA 5M ON WET;

CREATE USER wet3
IDENTIFIED BY wet
DEFAULT TABLESPACE WET
QUOTA 2M ON WET;

CREATE USER obsluga
IDENTIFIED BY wet
DEFAULT TABLESPACE WET
QUOTA 2M ON WET;

GRANT ALL PRIVILEGES TO szef;


ALTER USER sprzedawca2
DEFAULT TABLESPACE WET
TEMPORARY TABLESPACE USERS
ACCOUNT UNLOCK

GRANT CONNECT to sprzedawca1;
GRANT ALL PRIVILEGES TO sprzedawca1;

GRANT 
CREATE 