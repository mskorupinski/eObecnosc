unit ViewFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UserModel, Data.DB, FireDAC.Comp.Client, Firedac.DApt,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.DataSet;

type
  TViewForm = class(TForm)
    lblName: TLabel;
    gb: TGroupBox;
    DBGrid: TDBGrid;
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    UserController: TUserModel;
  public
    procedure GetUserLessons(ID: Integer);
  end;

var
  ViewForm: TViewForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;


procedure TViewForm.GetUserLessons(ID: Integer);
begin
  FDQuery.SQL.Text := 'SELECT * FROM Zajecia WHERE ID_Uzytkownika = :ID';
  FDQuery.ParamByName('ID').AsInteger := ID;
  FDQuery.OpenOrExecute;
end;

procedure TViewForm.FormActivate(Sender: TObject);
begin
  GetUserLessons(MainForm.ID);
end;

procedure TViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQuery.Free;
  UserController.Free;

  Action := caFree;
end;

procedure TViewForm.FormCreate(Sender: TObject);
var
  User: TUser;
begin
  UserController := TUserModel.Create();
  User := UserController.GetUserData(MainForm.ID);
  lblName.Caption := 'Witaj ' + User.Name + ' ' + User.Surname;

  FDQuery.Connection := DBEngineModule.conn;
  GetUserLessons(MainForm.ID);
end;

end.
