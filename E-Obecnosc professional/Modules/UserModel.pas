unit UserModel;

interface

uses FireDAC.Comp.Client, Firedac.DApt, System.StrUtils, IdHashSHA, SysUtils, Exceptions, Dialogs;

type
  TUser = class
    ID: Integer;
    Login: String;
    Name: String;
    Surname: String;
    Email : String;
end;



TUserModel = class
private
  FDQuery: TFDQuery;

  function GenSalt(Len: Integer) : String;
  function HashPassword(Passwd, Salt: String) : String;
public
  constructor Create();
  //destructor Destroy();

  function GetUserData(UserID: Integer) : TUser;
  function RegisterUser(User, Password, Name, Surname, Email: String) : Boolean;
  function ChangeUserData(UserID : Integer; Name, Surname, Email: String): Boolean;
  function ChangePassword(UserID: Integer; Password: String) : Boolean;
  function DeleteUser(UserID : Integer) : Boolean;

  function CheckUserName(Login: String) : Boolean;
  function CheckLogin(Login, Password: String) : Integer;

end;

implementation

uses DBEngineModules;

constructor  TUserModel.Create();
begin
  self.FDQuery := TFDQuery.Create(DBEngineModule.conn);
  self.FDQuery.Connection := DBEngineModule.conn;

  FDQuery.SQL.Text := 'SELECT * FROM Uzytkownicy';
  FDQuery.ResourceOptions.ParamCreate := True;

  FDQuery.Active := True;

end;


function TUserModel.GenSalt(Len: Integer) : String;
var
  str: String;
begin
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Randomize;
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = Len);
end;


function TUserModel.HashPassword(Passwd, Salt: String) : String;
var
  SHA1: TIdHashSHA1;

  i: Integer;
begin
  SHA1 := TIdHashSHA1.Create;

  Result := SHA1.HashStringAsHex(Passwd + Salt);

  for i := 0 to 5000 do
    Result := SHA1.HashStringAsHex(Result + Salt);

end;


function TUserModel.GetUserData(UserID: Integer) : TUser;
begin
  Result := TUser.Create;

  self.FDQuery.SQL.Text := 'SELECT * FROM Uzytkownicy WHERE ID = :id';
  self.FDQuery.ParamByName('id').AsInteger := UserID;
  self.FDQuery.OpenOrExecute;
  self.FDQuery.First;

  Result.Login := self.FDQuery.FieldByName('Login').AsString;
  Result.Name := self.FDQuery.FieldByName('Imie').AsString;
  Result.Surname := self.FDQuery.FieldByName('Nazwisko').AsString;
  Result.Email := self.FDQuery.FieldByName('Email').AsString;
end;


function TUserModel.RegisterUser(User: string; Password: string; Name: string; Surname: string; Email: string) : Boolean;
var
  Salt: String;
begin
  Salt := GenSalt(32);

  self.FDQuery.SQL.Text := 'SELECT ID FROM Uzytkownicy WHERE Login = :user';
  self.FDQuery.ParamByName('user').AsString := User;
  self.FDQuery.OpenOrExecute;

  if self.FDQuery.FieldByName('ID').AsInteger > 0 then
    raise EUserNameError.Create('Dany u¿ytkownik ju¿ istnieje');

  try
    self.FDQuery.SQL.Text := 'INSERT INTO Uzytkownicy(Login, Password, Sol, Imie, Nazwisko, Email) VALUES (:user, :password, :salt, :name, :surname, :email)';
    self.FDQuery.ParamByName('user').AsString := User;
    self.FDQuery.ParamByName('password').AsString := HashPassword(Password, Salt);
    self.FDQuery.ParamByName('salt').AsString := Salt;
    self.FDQuery.ParamByName('name').AsString := Name;
    self.FDQuery.ParamByName('surname').AsString := Surname;
    self.FDQuery.ParamByName('email').AsString := Email;

    self.FDQuery.OpenOrExecute;
    Result := True;
  except
    Result := False;
  end;
end;


function TUserModel.ChangeUserData(UserID: Integer; Name: string; Surname: string; Email: string) : Boolean;
begin
  self.FDQuery.SQL.Text := 'UPDATE Uzytkownicy SET Imie = :name, Nazwisko = :surname, Email = :email WHERE ID = :id';

  self.FDQuery.ParamByName('id').AsInteger := UserID;
  self.FDQuery.ParamByName('name').AsString := Name;
  self.FDQuery.ParamByName('surname').AsString := Surname;
  self.FDQuery.ParamByName('email').AsString := Email;
  self.FDQuery.OpenOrExecute;

  Result := True;
end;



function TUserModel.ChangePassword(UserID: Integer; Password: string) : Boolean;
var
  Salt: String;
begin
  Salt := GenSalt(32);

  try
    self.FDQuery.SQL.Text := 'UPDATE Uzytkownicy SET Password = :password, Sol = :salt WHERE ID = :id';
    self.FDQuery.ParamByName('id').AsInteger := UserID;
    self.FDQuery.ParamByName('password').AsString := HashPassword(Password, Salt);
    self.FDQuery.ParamByName('salt').AsString := Salt;
    self.FDQuery.OpenOrExecute;

    Result := True;
  except
    raise;
  end;
end;



function TUserModel.DeleteUser(UserID: Integer) : Boolean;
begin
  DBEngineModule.conn.StartTransaction;
  try
    self.FDQuery.ParamByName('id').AsInteger := UserID;
    self.FDQuery.SQL.Text := 'DELETE FROM Uzytkownicy WHERE ID = :id';
    self.FDQuery.OpenOrExecute;

    Result := True;
    DBEngineModule.conn.Commit;
  except
    DBEngineModule.conn.Rollback;
  end;

end;


function TUserModel.CheckUserName(Login: string) : Boolean;
begin

  self.FDQuery.SQL.Text := 'SELECT ID FROM Uzytkownicy WHERE Login = :user';
  self.FDQuery.ParamByName('user').AsString := Login;

  self.FDQuery.OpenOrExecute;
  self.FDQuery.First;

  if (self.FDQuery.FieldByName('ID').AsInteger > 0) then
    Result := False else
    Result := True;

end;


function TUserModel.CheckLogin(Login: string; Password: string) :  Integer;
var
  ID: Integer;
 BaseSalt, BasePassword: String;
begin
  self.FDQuery.SQL.Text := 'SELECT ID, Password, Sol FROM Uzytkownicy WHERE Login = :user';
  self.FDQuery.ParamByName('user').AsString := Login;
  self.FDQuery.OpenOrExecute;

  self.FDQuery.First;
  BasePassword := self.FDQuery.FieldByName('Password').AsString;
  BaseSalt := self.FDQuery.FieldByName('Sol').AsString;
  ID := self.FDQuery.FieldByName('ID').AsInteger;

  if (ID > 0) and (HashPassword(Password, BaseSalt) = BasePassword) then
    Result := ID
    else
    Result := -1;

end;






end.
