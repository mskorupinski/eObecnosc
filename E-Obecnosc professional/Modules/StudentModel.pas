unit StudentModel;

interface

uses FireDAC.Comp.Client, Firedac.DApt, System.StrUtils, IdHashSHA, SysUtils, Exceptions, Dialogs, System.Classes;

type
TStudent = class
  ID: Integer;
  Imie: String;
  Nazwisko: String;
  Indeks: String;
end;

TStudentModel = class
public
  function GetStudentData(var Query: TFDQuery; ID: Integer) : TStudent;
  function ChangeStudentData(var Query: TFDQuery; Student: TStudent) : Boolean;
  function DeleteStudent(var Query: TFDQuery; ID: Integer) : Boolean;
  function AddStudent(var Query: TFDQuery; Student: TStudent) : Boolean;
  function IsPresence(var Query: TFDQuery; Student: TStudent; StudentID, RaportID: Integer) :  Boolean;
  function IsExist(var Query: TFDQuery; Indeks: String) : Boolean;

  procedure GetRaports(var Query: TFDQuery; LessonID: Integer);
  procedure GetLessons(var Query: TFDQuery; UserID: Integer);
  procedure Search(var Query: TFDQuery; Category: String; Value: String);
end;

implementation

function TStudentModel.GetStudentData(var Query: TFDQuery; ID: Integer) : TStudent;
begin
  Query.SQL.Text := 'SELECT * FROM Studenci WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := ID;
  Query.OpenOrExecute;

  Result := TStudent.Create;

  Query.First;
  Result.ID := ID;
  Result.Imie := Query.FieldByName('Imie').AsString;
  Result.Nazwisko := Query.FieldByName('Nazwisko').AsString;
  Result.Indeks := Query.FieldByName('Indeks').AsString;
end;


function TStudentModel.ChangeStudentData(var Query: TFDQuery; Student: TStudent) : Boolean;
begin
  Query.SQL.Text := 'UPDATE Studenci SET Imie = :imie, Nazwisko = :nazwisko, Indeks = :indeks WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := Student.ID;
  Query.ParamByName('imie').AsString := Student.Imie;
  Query.ParamByName('nazwisko').AsString := Student.Nazwisko;
  Query.ParamByName('indeks').AsString := Student.Indeks;
  Query.OpenOrExecute;

  Result := True;
end;


function TStudentModel.DeleteStudent(var Query: TFDQuery; ID: Integer) : Boolean;
begin
  Query.SQL.Text := 'DELETE FROM Studenci WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := ID;
  Query.OpenOrExecute;
end;


function TStudentModel.AddStudent(var Query: TFDQuery; Student: TStudent) : Boolean;
begin
  Query.SQL.Text := 'INSERT INTO Studenci(Imie, Nazwisko, Indeks) VALUES (:imie, :nazwisko, :indeks)';
  Query.ParamByName('imie').AsString := Student.Imie;
  Query.ParamByName('nazwisko').AsString := Student.Nazwisko;
  Query.ParamByName('indeks').AsString := Student.Indeks;
  Query.OpenOrExecute;

  Result := True;
end;


function TStudentModel.IsPresence(var Query: TFDQuery; Student: TStudent; StudentID, RaportID: Integer) : Boolean;
begin
  Query.SQL.Text := 'SELECT ID FROM Obecnosci WHERE ID_Studenta = :id_studenta AND ID_Dziennika_Zajec = :id';
  Query.ParamByName('id_studenta').AsInteger := Student.ID;
  Query.ParamByName('id').AsInteger := RaportID;
  Query.OpenOrExecute;


  Query.First;
  if Query.FieldByName('ID').AsInteger > 0 then Result := True else Result := False;

end;


function TStudentModel.IsExist(var Query: TFDQuery; Indeks: string) : Boolean;
begin
  Query.SQL.Text := 'SELECT ID FROM Studenci WHERE Indeks = :indeks';
  Query.ParamByName('indeks').AsString := Indeks;
  Query.OpenOrExecute;


  Query.First;
  if Query.FieldByName('ID').AsInteger > 0 then Result := True else Result := False;
end;


procedure TStudentModel.GetRaports(var Query: TFDQuery; LessonID: Integer);
begin
  Query.SQL.Text := 'SELECT Data, Sala FROM Dziennik_zajec WHERE ID_Zajec = :id';
  Query.ParamByName('id').AsInteger := LessonID;
  Query.OpenOrExecute;

end;


procedure TStudentModel.GetLessons(var Query: TFDQuery; UserID: Integer);
begin
  Query.SQL.Text := 'SELECT * FROM Zajecia WHERE ID IN (SELECT ID_Zajec FROM Grupy WHERE ID_Studenta = :id)';
  Query.ParamByName('id').AsInteger := UserID;
  Query.OpenOrExecute;
end;


procedure TStudentModel.Search(var Query: TFDQuery; Category: string; Value: string);
begin
  if (Category.IsEmpty) or (Value.IsEmpty) then
  begin
    Query.SQL.Text := 'SELECT * FROM Studenci';
  end else
  begin
    Query.SQL.Text := 'SELECT * FROM Studenci WHERE ' + Category + ' = :value';
    Query.ParamByName('value').AsString := Value + '%';
  end;

  Query.OpenOrExecute;
end;

end.
