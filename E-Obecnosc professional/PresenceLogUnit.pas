unit PresenceLogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, LessonModel, PresenceModel;

type
  TPresenceLogForm = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    LessonModel: TLessonModel;
    PresenceModel: TPresenceModel;
  end;

var
  PresenceLogForm: TPresenceLogForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;


procedure TPresenceLogForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  PresenceModel.GetLog(FDQuery2, FDQuery1.FieldByName('ID').AsInteger);
end;

procedure TPresenceLogForm.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
  PresenceModel.Present(FDQuery3, FDQuery2.FieldByName('ID').AsInteger);
  PresenceModel.unPresent(FDQuery4, FDQuery2.FieldByName('ID').AsInteger);
end;

procedure TPresenceLogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LessonModel.Free;
  PresenceModel.Free;

  Action := caFree;
end;

procedure TPresenceLogForm.FormCreate(Sender: TObject);
begin
  LessonModel := TLessonModel.Create;
  PresenceModel := TPresenceModel.Create;

  FDQuery1.Connection := DBEngineModule.conn;
  FDQuery2.Connection := DBEngineModule.conn;
  FDQuery3.Connection := DBEngineModule.conn;
  FDQuery4.Connection := DBEngineModule.conn;

  LessonModel.GetLessons(FDQuery1, MainForm.ID);
end;

end.
