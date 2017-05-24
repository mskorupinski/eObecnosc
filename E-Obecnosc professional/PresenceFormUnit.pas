unit PresenceFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, StudentModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPresenceForm = class(TForm)
    lblIndeks: TLabel;
    lblImie: TLabel;
    lblNazwisko: TLabel;
    lblPrzedmiot: TLabel;
    DBGrid1: TDBGrid;
    FDQuery: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource: TDataSource;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    DBGrid3: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     StudentController: TStudentModel;
     ID: Integer;

     procedure Refresh();
  public
    constructor Create(AOwner: TComponent; ID: Integer);overload;
  end;

var
  PresenceForm: TPresenceForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;

procedure TPresenceForm.Refresh;
begin
  FDQuery1.SQL.Text := 'SELECT ID, Data_rozpoczecia, Sala FROM Dziennik_zajec WHERE ID IN (SELECT ID_Dziennika_Zajec FROM Obecnosci WHERE ID_Studenta = :id_studenta) AND ID_Zajec = :id_zajec';
   FDQuery1.ParamByName('id_studenta').AsInteger := self.ID;
   FDQuery1.ParamByName('id_zajec').AsInteger := FDQuery.FieldByName('ID').AsInteger;
   FDQuery1.OpenOrExecute;


   FDQuery2.SQL.Text := 'SELECT ID, Data_rozpoczecia, Sala FROM Dziennik_zajec WHERE ID NOT IN (SELECT ID_Dziennika_Zajec FROM Obecnosci WHERE ID_Studenta = :id_studenta) AND ID_Zajec = :id_zajec';
   FDQuery2.ParamByName('id_studenta').AsInteger := self.ID;
   FDQuery2.ParamByName('id_zajec').AsInteger := FDQuery.FieldByName('ID').AsInteger;
   FDQuery2.OpenOrExecute;
end;


constructor TPresenceForm.Create(AOwner: TComponent; ID: Integer);
begin
  inherited Create(AOwner);
  self.ID := ID;
end;

procedure TPresenceForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  StudentController.GetRaports(FDQuery2, FDQuery1.FieldByName('ID').AsInteger);
end;

procedure TPresenceForm.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  self.Refresh;
end;

procedure TPresenceForm.DBGrid1DblClick(Sender: TObject);    //Odrzuæ obecnoœæ studenta
var
  ID_Dziennika: Integer;
begin
   ID_Dziennika := FDQuery1.FieldByName('ID').AsInteger;

   FDQuery1.SQL.Text := 'DELETE FROM Obecnosci WHERE ID_Dziennika_Zajec = :id_dziennika AND ID_Studenta = :id_studenta';

   FDQuery1.ParamByName('id_studenta').AsInteger := self.ID;
   FDQuery1.ParamByName('id_dziennika').AsInteger := ID_Dziennika;
   FDQuery1.OpenOrExecute;

   self.Refresh;
end;

procedure TPresenceForm.DBGrid2DblClick(Sender: TObject);
var
  ID_Dziennika: Integer;
begin
   ID_Dziennika := FDQuery2.FieldByName('ID').AsInteger;

   FDQuery2.SQL.Text := 'INSERT INTO Obecnosci(ID_Dziennika_Zajec, ID_Studenta) VALUES (:id_dziennika, :id_studenta)';

   FDQuery2.ParamByName('id_studenta').AsInteger := self.ID;
   FDQuery2.ParamByName('id_dziennika').AsInteger := ID_Dziennika;
   FDQuery2.OpenOrExecute;

   self.Refresh;
end;

procedure TPresenceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.StudentController.Free;
  Action := caFree;
end;

procedure TPresenceForm.FormCreate(Sender: TObject);
var
  Student: TStudent;
begin
  StudentController := TStudentModel.Create;
  FDQuery.Connection := DBEngineModule.conn;
  FDQuery1.Connection := DBEngineModule.conn;
  FDQuery2.Connection := DBEngineModule.conn;

  Student := StudentController.GetStudentData(FDQuery, self.ID);
  lblImie.Caption := Student.Imie;
  lblNazwisko.Caption := Student.Nazwisko;
  lblIndeks.Caption := Student.Indeks;

  self.Caption := Student.Imie + ' ' + Student.Nazwisko + ' ' + Student.Indeks;

  StudentController.GetLessons(FDQuery, self.ID);
end;

end.
