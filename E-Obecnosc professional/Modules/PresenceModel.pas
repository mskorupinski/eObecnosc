unit PresenceModel;

interface

uses FireDAC.Comp.Client, Firedac.DApt, System.StrUtils, IdHashSHA, SysUtils, Exceptions, Dialogs, System.Classes, WinSock, WinInet;

type
TPresenceModel = class
private
  TempList: TStringList;
public
  function GetIPAddress : String;
  function AddToList(Indeks: String) : Boolean;
  function Accept(var Query: TFDQuery; DziennikID: Integer) : Boolean;
  function StartLesson(var Query: TFDQuery; LessonID: Integer; UserID: Integer; Sala: String) : Integer;

  procedure ShowPresence(var Query: TFDQuery);
  procedure GetLog(var Query: TFDQuery; ID_Zajec: Integer);
  procedure Present(var Query: TFDQuery; ID_Dziennika: Integer);
  procedure unPresent(var Query: TFDQuery; ID_Dziennika: Integer);

  constructor Create(); overload;
end;

implementation


constructor TPresenceModel.Create();
begin
  TempList := TStringList.Create;
end;


procedure TPresenceModel.ShowPresence(var Query: TFDQuery);
var
  I: Integer;
  S: String;
begin
  S := '';

  if self.TempList.Count = 0 then exit;


  for I := 0 to self.TempList.Count - 1  do
  begin
    if I < self.TempList.Count - 1  then
     S := S + QuotedStr(self.TempList[I]) +  ', '
    else
      S := S + QuotedStr(self.TempList[I]);
  end;

  Query.SQL.Text := 'SELECT * FROM Studenci WHERE Indeks IN (' + S + ')';
  ShowMessage(Query.SQL.Text);
  Query.OpenOrExecute;
end;





procedure TPresenceModel.GetLog(var Query: TFDQuery; ID_Zajec: Integer);
begin
  Query.SQL.Text := 'SELECT ID, Data_rozpoczecia, Sala FROM Dziennik_zajec WHERE ID_Zajec = :id';
  Query.ParamByName('id').AsInteger := ID_Zajec;
  Query.OpenOrExecute;
end;


procedure TPresenceModel.Present(var Query: TFDQuery; ID_Dziennika: Integer);
begin
  Query.SQL.Text := 'SELECT s.ID as ID, s.Imie as Imie, s.Nazwisko as Nazwisko, s.Indeks as Indeks  FROM Obcnosc as o INNER JOIN Studenci as s ON s.ID = o.ID_Studenta  WHERE o.ID_Dziennika_Zajec = :id';
  Query.ParamByName('id').AsInteger := ID_Dziennika;
  Query.OpenOrExecute;
end;

procedure TPresenceModel.unPresent(var Query: TFDQuery; ID_Dziennika: Integer);
var
Temp: String;
begin
  Temp := '(SELECT st.ID FROM Obcnosc as ob INNER JOIN Studenci as st ON st.ID = ob.ID_Studenta  WHERE ob.ID_Dziennika_Zajec = :id)';
  Query.SQL.Text := 'SELECT s.ID as ID, s.Imie as Imie, s.Nazwisko as Nazwisko, s.Indeks as Indeks  FROM Studenci as s INNER JOIN Grupy as g ON g.ID_Studenta = s.ID WHERE g.ID_Zajec = (SELECT ID_Zajec FROM Dziennik_zajec WHERE ID = :id) AND s.ID NOT IN ' + Temp;
  Query.ParamByName('id').AsInteger := ID_Dziennika;
  Query.OpenOrExecute;
end;



function TPresenceModel.GetIPAddress : String;
type pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of ansichar;
begin
  try
    try
      If WSAStartup($101,varTWSAData) <> 0 Then
      Result := ''
      Else Begin
      gethostname(namebuf,sizeof(namebuf));
      varPHostEnt := gethostbyname(namebuf);
      varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
      Result := inet_ntoa(varTInAddr);
      End;
    except
      Result := '';
  end;
  finally
    WSACleanup;
end;


end;


function TPresenceModel.AddToList(Indeks: string) : Boolean;
begin
  TempList.Add(Indeks);
end;


function TPresenceModel.Accept(var Query: TFDQuery; DziennikID: Integer) : Boolean;
var
  I, ID: Integer;
  q1, q2: String;
begin
  q1 := 'INSERT INTO Obecnosci(ID_Dziennika_Zajec, ID_Studenta) VALUES (:id_dziennika, :id_studenta)';
  q2 := 'SELECT ID FROM Studenci WHERE Indeks = :indeks LIMIT 1';

  for I := 0 to self.TempList.Count - 1  do
  begin
    Query.SQL.Text := q2;
    Query.ParamByName('indeks').AsString := self.TempList[I];
    Query.OpenOrExecute;

    Query.First;
    ID := Query.FieldByName('ID').AsInteger;

    Query.SQL.Text := q1;
    Query.ParamByName('id_dziennika').AsInteger := DziennikID;
    Query.ParamByName('id_studenta').AsInteger := ID;
    Query.OpenOrExecute;
  end;

  self.TempList.Clear;

  Result := True;

end;


function TPresenceModel.StartLesson(var Query: TFDQuery; LessonID: Integer; UserID: Integer; Sala: String) : Integer;
var
  ID: Integer;
begin
  Query.SQL.Text := 'INSERT INTO Dziennik_zajec(ID_Zajec, ID_Uzytkownika, Data_rozpoczecia, Sala) VALUES (:id_zajec, :id_uzytkownika, NOW(), :sala)';
  Query.ParamByName('id_zajec').AsInteger := LessonID;
  Query.ParamByName('id_uzytkownika').AsInteger := UserID;
  Query.ParamByName('sala').AsString := Sala;

  Query.OpenOrExecute;

  Query.SQL.Text := 'SELECT MAX(ID) as ID FROM Dziennik_zajec';
  Query.OpenOrExecute;

  Query.First;
  ID := Query.FieldByName('ID').AsInteger;

  Result := ID;
end;




end.
