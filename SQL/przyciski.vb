'GATUNKI

'EDYTUJ specjalizację

Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "UPDATE gatunki SET gatunek='" & Me.GATUNEK.Value & "', opis='" & Me.OPIS.Value &"' WHERE id_spec= " & ID_GAT
dbs.QueryDefs("gat_update").SQL = sqlstr
dbs.QueryDefs("gat_update").Execute

'Usuń gatunek
Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "DELETE FROM gatunki WHERE id_gat= " & ID_GAT
dbs.QueryDefs("").SQL = sqlstr
dbs.QueryDefs("").Execute


'DODAJ specjalizację

Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "INSERT INTO specjalizacje (spec) VALUES ('" & Me.spec.Value & "')"
dbs.QueryDefs("spec_insert").SQL = sqlstr
dbs.QueryDefs("spec_insert").Execute

'EDYTUJ specjalizację

Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "UPDATE specjalizacje SET spec='" & Me.spec.Value & "' WHERE id_spec= " & Me.id_spec.Value 
dbs.QueryDefs("spec_update").SQL = sqlstr
dbs.QueryDefs("spec_update").Execute

'Usuń specjalizację
Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "DELETE FROM specjalizacje WHERE id_spec= " & Me.id_spec.Value 
dbs.QueryDefs("spec_update").SQL = sqlstr
dbs.QueryDefs("spec_update").Execute

'WETERYNARZE
'Dodaj weterynarza
Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "INSERT INTO weterynarze (imie, nazwisko, data_zat, telefon) VALUES ('" & Me.IMIE.Value & "', " &
Me.NAZWISKO.Value & "', " & Me.DATA_ZAT.Value & ", " & Me.TELEFON.Value & ")"
dbs.QueryDefs("").SQL = sqlstr
dbs.QueryDefs("").Execute

'Edytuj weterynarza
Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "UPDATE weterynarze SET imie='" & Me.IMIE.Value & "' WHERE id_wet= " & ID_WET
dbs.QueryDefs("").SQL = sqlstr
dbs.QueryDefs("").Execute

'Usuń weterynarza
Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "DELETE FROM weterynarze WHERE id_wet= " & ID_WET 
dbs.QueryDefs("").SQL = sqlstr
dbs.QueryDefs("").Execute

'DODAJ pacjenta

Dim sqlstr As String
Dim dbs As Database
Set dbs = CurrentDb
sqlstr = ""
sqlstr = "INSERT INTO pacjenci (imie, id_gat, data_ur, waga_kg, uwagi) VALUES ('" & Me.spec.Value & "')"
dbs.QueryDefs("spec_insert").SQL = sqlstr
dbs.QueryDefs("spec_insert").Execute