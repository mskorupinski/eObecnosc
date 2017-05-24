unit CheckPresenceFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, Vcl.StdCtrls,
  IdCustomTCPServer, IdTCPServer, PresenceModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ExtCtrls,
  IdContext, LessonModel, IdUDPServer, IdGlobal, IdSocketHandle, System.UITypes;

type
  TCheckPresenceForm = class(TForm)
    DBGrid: TDBGrid;
    UDPClient: TIdUDPClient;
    GroupBox1: TGroupBox;
    btnStart: TButton;
    ProgressBar: TProgressBar;
    edtTime: TEdit;
    Label1: TLabel;
    btnCancel: TButton;
    DataSource: TDataSource;
    FDQuery: TFDQuery;
    Label2: TLabel;
    edtSala: TEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Timer: TTimer;
    FDQuery2: TFDQuery;
    IdUDPServer1: TIdUDPServer;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
  private
    IP: String;
  public
    PresenceModel: TPresenceModel;
    LessonModel: TLessonModel;
  end;

var
  CheckPresenceForm: TCheckPresenceForm;

implementation

uses MainUnit, DBEngineModules;

{$R *.dfm}

procedure TCheckPresenceForm.btnCancelClick(Sender: TObject);
var
  LessID: Integer;
begin
  Timer.Enabled := False;
  IdUDPServer1.Active := False;
  btnStart.Enabled := True;
  edtTime.Enabled := True;
  edtSala.Enabled := True;

  case MessageDlg('Zakoñczono sprawdzanie obecnoœci. Dodaæ do bazy?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      LessID := PresenceModel.StartLesson(FDQuery, FDQuery2.FieldByName('ID').AsInteger, MainForm.ID, edtSala.Text);
      PresenceModel.Accept(FDQuery1, LessID);
      ShowMessage('Zakoñczono dodawanie do bazy');
    end;
  mrCancel:
    begin

    end;

  end;

  ProgressBar.Position := 0;
end;

procedure TCheckPresenceForm.btnStartClick(Sender: TObject);
begin
  Timer.Enabled := True;
  IdUDPServer1.Active := True;
  ProgressBar.Max := StrToInt(edtTime.Text) * 60;

  btnStart.Enabled := False;
  edtTime.Enabled := False;
  edtSala.Enabled := False;
end;

procedure TCheckPresenceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PresenceModel.Free;
  LessonModel.Free;

  Action := caFree;
end;

procedure TCheckPresenceForm.FormCreate(Sender: TObject);
begin
  PresenceModel := TPresenceModel.Create;
  LessonModel := TLessonModel.Create;

  FDQuery.Connection := DBEngineModule.conn;
  FDQuery1.Connection := DBEngineModule.conn;
  FDQuery2.Connection := DBEngineModule.conn;

  LessonModel.GetLessons(FDQuery2, MainForm.ID);

  IP := PresenceModel.GetIPAddress;
  CheckPresenceForm.Caption := CheckPresenceForm.Caption + ' ' + IP;
end;

procedure TCheckPresenceForm.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  Indeks: String;
begin
  Indeks := BytesToString(AData);
  Indeks := Indeks.Trim;
  PresenceModel.AddToList(Indeks);
  PresenceModel.ShowPresence(FDQuery);
end;

procedure TCheckPresenceForm.TimerTimer(Sender: TObject);
var
  LessID: Integer;
begin
  UDPClient.Broadcast(self.IP, 8992);
  ProgressBar.Position := ProgressBar.Position + 1;


  if ProgressBar.Position >= ProgressBar.Max then
  begin
    Timer.Enabled := False;
    IdUDPServer1.Active := False;
    btnStart.Enabled := True;
    edtTime.Enabled := True;
    edtSala.Enabled := True;
    case MessageDlg('Zakoñczono sprawdzanie obecnoœci. Dodaæ do bazy?', mtConfirmation, [mbOK, mbCancel], 0) of
    mrOk:
      begin
        LessID := PresenceModel.StartLesson(FDQuery1, FDQuery2.FieldByName('ID').AsInteger, MainForm.ID, edtSala.Text);
        PresenceModel.Accept(FDQuery1, LessID);
        ShowMessage('Zakoñczono dodawanie do bazy');
      end;
    mrCancel:
      begin

      end;
    end;

    ProgressBar.Position := 0;
  end;

end;



end.
