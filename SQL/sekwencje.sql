CREATE SEQUENCE licznik_spec
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;


UPDATE Typy
SET ID_typu=SEK_typ.NEXTVAL;

//Nie publikuj tego w sprawozdaniu

CREATE TRIGGER trigger_spec
BEFORE INSERT ON specjalizacje
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_spec, licznik_spec.NEXTVAL)
  INTO   :new.id_spec
  FROM   dual;
END;
/
CREATE TRIGGER trigger_spec_nazwa
BEFORE INSERT ON specjalizacje
FOR EACH ROW
BEGIN
	spec
END;
/

CREATE SEQUENCE licznik_wet
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE TRIGGER trigger_wet
BEFORE INSERT ON weterynarze
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_wet, licznik_wet.NEXTVAL)
  INTO   :new.id_wet
  FROM   dual;
END;
/



CREATE SEQUENCE licznik_gat
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE TRIGGER trigger_gat
BEFORE INSERT ON gatunki
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_gat, licznik_gat.NEXTVAL)
  INTO   :new.id_gat
  FROM   dual;
END;
/

CREATE SEQUENCE licznik_wlas
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE TRIGGER trigger_wlas
BEFORE INSERT ON wlasciciele
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_wlas, licznik_wlas.NEXTVAL)
  INTO   :new.id_wlas
  FROM   dual;
END;
/

CREATE SEQUENCE licznik_pac
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE TRIGGER trigger_pac
BEFORE INSERT ON pacjenci
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_pac, licznik_pac.NEXTVAL)
  INTO   :new.id_pac
  FROM   dual;
END;
/

CREATE SEQUENCE licznik_wiz
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE OR REPLACE TRIGGER trigger_wiz
BEFORE INSERT ON wizyty
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_wiz, licznik_wiz.NEXTVAL)
  INTO   :new.id_wiz
  FROM   dual;
END;
/

CREATE TABLE miejscowosci
(
	id_miejsc NUMBER(4) PRIMARY KEY,
	miejsc VARCHAR2(40) NOT NULL UNIQUE
);

CREATE SEQUENCE licznik_miejsc
Increment by 1
Start with 1
Minvalue 1
Maxvalue 999999
NoCycle;

CREATE TRIGGER trigger_miejsc
BEFORE INSERT ON miejscowosci
FOR EACH ROW
BEGIN
  SELECT NVL(:new.id_miejsc, licznik_miejsc.NEXTVAL)
  INTO   :new.id_miejsc
  FROM   dual;
END;
/