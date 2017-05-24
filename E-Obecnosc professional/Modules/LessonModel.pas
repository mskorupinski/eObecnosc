unit LessonModel;

interface

uses FireDAC.Comp.Client, Firedac.DApt, System.StrUtils, IdHashSHA, SysUtils, Exceptions, Dialogs, System.Classes;

type
TLesson = class
  ID: Integer;
  ID_Uzytkownika: Integer;
  Nazwa: String;
  Dzien: String;
  Godzina: String;
  Cyklicznosc: String;
  Wydzial: String;
end;

TLessonModel = class
public
  procedure GetStudentsInLesson(var Query: TFDQuery; LessonID: Integer);
  procedure GetLessons(var Query: TFDQuery; UserID: Integer);

  function GetLessonData(var Query: TFDQuery; ID: Integer) : TLesson;
  function ChangeLessonData(var Query: TFDQuery; Lesson: TLesson) : Boolean;
  function DeleteLesson(var Query: TFDQuery; ID: Integer) : Boolean;
  function AddLesson(var Query: TFDQuery; Lesson: TLesson) : Boolean;
  function AddToLesson(var Query: TFDQuery; StudentID:Integer;  LessonID: Integer) : Boolean;
  function DeleteFromLesson(var Query: TFDQuery; StudentID:Integer;  LessonID: Integer) : Boolean;
end;


implementation


procedure TLessonModel.GetStudentsInLesson(var Query: TFDQuery; LessonID: Integer);
begin
  Query.SQL.Text := 'SELECT s.ID as ID, s.Imie as Imie, s.Nazwisko as Nazwisko, s.Indeks as Indeks FROM Studenci as s INNER JOIN Grupy as g ON s.ID = g.ID_Studenta WHERE g.ID_Zajec = :lesson_id';
  Query.ParamByName('lesson_id').AsInteger := LessonID;
  Query.OpenOrExecute;
end;


procedure TLessonModel.GetLessons(var Query: TFDQuery; UserID: Integer);
begin
  Query.SQL.Text := 'SELECT ID, Nazwa, Wydzial, Dzien, Godzina, Cyklicznosc FROM Zajecia WHERE ID_Uzytkownika = :user_id';
  Query.ParamByName('user_id').AsInteger := UserID;
  Query.OpenOrExecute;
end;


function TLessonModel.GetLessonData(var Query: TFDQuery; ID: Integer) : TLesson;
begin
  Query.SQL.Text := 'SELECT * FROM Zajecia WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := ID;
  Query.OpenOrExecute;

  Result := TLesson.Create;

  Query.First;
  Result.ID := ID;
  Result.ID_Uzytkownika := Query.FieldByName('ID_Uzytkownika').AsInteger;
  Result.Nazwa := Query.FieldByName('Nazwa').AsString;
  Result.Dzien := Query.FieldByName('Dzien').AsString;
  Result.Godzina := Query.FieldByName('Godzina').AsString;
  Result.Cyklicznosc := Query.FieldByName('Cyklicznosc').AsString;
  Result.Wydzial := Query.FieldByName('Wydzial').AsString;
end;


function TLessonModel.ChangeLessonData(var Query: TFDQuery; Lesson: TLesson) : Boolean;
begin
  Query.SQL.Text := 'UPDATE Zajecia SET Nazwa = :nazwa, Wydzial = :wydzial, Dzien = :dzien, Godzina = :godzina, Cyklicznosc = :cykl WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := Lesson.ID;
  Query.ParamByName('nazwa').AsString := Lesson.Nazwa;
  Query.ParamByName('wydzial').AsString := Lesson.Wydzial;
  Query.ParamByName('godzina').AsString := Lesson.Godzina;
  Query.ParamByName('cykl').AsString := Lesson.Cyklicznosc;
  Query.ParamByName('dzien').AsString := Lesson.Dzien;

  Query.OpenOrExecute;

  Result := True;
end;


function TLessonModel.DeleteLesson(var Query: TFDQuery; ID: Integer) : Boolean;
begin
  Query.SQL.Text := 'DELETE FROM Zajecia WHERE ID = :ID';
  Query.ParamByName('ID').AsInteger := ID;
  Query.OpenOrExecute;
end;


function TLessonModel.AddLesson(var Query: TFDQuery; Lesson: TLesson) : Boolean;
begin
  Query.SQL.Text := 'INSERT INTO Zajecia(ID_Uzytkownika, Nazwa, Wydzial, Dzien, Godzina, Cyklicznosc) VALUES (:user_id, :nazwa, :wydzial, :dzien, :godzina, :cykl)';
  Query.ParamByName('user_id').AsInteger := Lesson.ID_Uzytkownika;
  Query.ParamByName('nazwa').AsString := Lesson.Nazwa;
  Query.ParamByName('wydzial').AsString := Lesson.Wydzial;
  Query.ParamByName('godzina').AsString := Lesson.Godzina;
  Query.ParamByName('cykl').AsString := Lesson.Cyklicznosc;
  Query.ParamByName('dzien').AsString := Lesson.Dzien;
  Query.OpenOrExecute;

  Result := True;
end;


function TLessonModel.AddToLesson(var Query: TFDQuery; StudentID:Integer;  LessonID: Integer) : Boolean;
begin
  Query.SQL.Text := 'SELECT ID FROM Grupy WHERE ID_Studenta = :student_id AND ID_Zajec = :lesson_id';
  Query.ParamByName('student_id').AsInteger := StudentID;
  Query.ParamByName('lesson_id').AsInteger := LessonID;
  Query.OpenOrExecute;
  Query.First;
  if Query.FieldByName('ID').AsInteger > 0 then
  begin
    Result := False;
    exit;
  end;


  Query.SQL.Text := 'INSERT INTO Grupy(ID_Studenta, ID_Zajec) VALUES (:student_id, :lesson_id)';
  Query.ParamByName('student_id').AsInteger := StudentID;
  Query.ParamByName('lesson_id').AsInteger := LessonID;
  Query.OpenOrExecute;

  Result := True;

end;


function TLessonModel.DeleteFromLesson(var Query: TFDQuery; StudentID:Integer;  LessonID: Integer) : Boolean;
begin
  Query.SQL.Text := 'DELETE FROM Grupy WHERE ID_Studenta = :student_id AND ID_Zajec = :lesson_id';
  Query.ParamByName('student_id').AsInteger := StudentID;
  Query.ParamByName('lesson_id').AsInteger := LessonID;
  Query.OpenOrExecute;

  Result := True;
end;



end.
