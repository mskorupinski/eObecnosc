unit AddLessonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, LessonModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TAddLessonForm = class(TForm)
    Label1: TLabel;
    edtName: TEdit;
    cbDay: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtTime: TEdit;
    Label4: TLabel;
    cbFrq: TComboBox;
    btnSave: TButton;
    btnClose: TButton;
    edtDepartment: TEdit;
    Label5: TLabel;
    FDQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ID: Integer;
    LessonController: TLessonModel;
  public
    constructor Create(AOwner: TComponent); overload;
    constructor Create(AOwner: TComponent; ID: Integer);overload;
  end;

var
  AddLessonForm: TAddLessonForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;


constructor TAddLessonForm.Create(AOwner: TComponent);
begin
  inherited Create(AOWner);
  self.ID := -1;
end;

procedure TAddLessonForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TAddLessonForm.btnSaveClick(Sender: TObject);
var
  Lesson: TLesson;
begin
  Lesson := TLesson.Create;
  with Lesson do
  begin
    ID := self.ID;
    ID_Uzytkownika := MainForm.ID;
    Nazwa := edtName.Text;
    Dzien := cbDay.Text;
    Godzina := edtTime.Text;
    Cyklicznosc := cbFrq.Text;
    Wydzial := edtDepartment.Text;
  end;

  if self.ID <> -1 then
  begin
    LessonController.ChangeLessonData(FDQuery, Lesson);
    Close;
  end else
  begin
    LessonController.AddLesson(FDQuery, Lesson);
    Close;

  end;
end;

constructor TAddLessonForm.Create(AOwner: TComponent; ID: Integer);
begin
  inherited Create(AOwner);
  self.ID := ID;
end;



procedure TAddLessonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQuery.Free;
  LessonController.Free;

  Action := caFree;
end;

procedure TAddLessonForm.FormCreate(Sender: TObject);
var
Lesson: TLesson;
begin
  LessonController := TLessonModel.Create;
  FDQuery.Connection := DBEngineModule.conn;

  if ID <> -1 then
  begin
    Lesson := LessonController.GetLessonData(FDQuery, self.ID);
    edtName.Text := Lesson.Nazwa;
    edtDepartment.Text := Lesson.Wydzial;
    edtTime.Text := Lesson.Godzina;
    cbDay.Text := Lesson.Dzien;
    cbFrq.Text := Lesson.Cyklicznosc;
  end;

end;

end.
