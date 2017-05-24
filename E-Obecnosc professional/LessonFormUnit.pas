unit LessonFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, StudentModel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  LessonModel;

type
  TLessonsForm = class(TForm)
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    btnAddLesson: TButton;
    btnDelLesson: TButton;
    btnAddStudent: TButton;
    btnDelStudent: TButton;
    DataSource1: TDataSource;
    FDQuery: TFDQuery;
    FDQuery1: TFDQuery;
    btnChangeLesson: TButton;
    cbLessons: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnAddLessonClick(Sender: TObject);
    procedure btnChangeLessonClick(Sender: TObject);
    procedure btnDelLessonClick(Sender: TObject);
    procedure btnAddStudentClick(Sender: TObject);
    procedure btnDelStudentClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cbLessonsCellClick(Column: TColumn);
  private
    StudentController: TStudentModel;
    LessonController: TLessonModel;
  public
    { Public declarations }
  end;

var
  LessonsForm: TLessonsForm;

implementation

{$R *.dfm}

uses DBEngineModules, MainUnit, AddLessonUnit, AddStudentToLessonUnit;

procedure TLessonsForm.btnAddLessonClick(Sender: TObject);
begin
  TAddLessonForm.Create(self);
  LessonController.GetLessons(FDQuery1, MainForm.ID);
end;


procedure TLessonsForm.btnAddStudentClick(Sender: TObject);
begin
  TAddStudentToLessonForm.Create(self, FDQuery1.FieldByName('ID').AsInteger);
  LessonController.GetStudentsInLesson(FDQuery, FDQuery1.FieldByName('ID').AsInteger);
end;


procedure TLessonsForm.btnChangeLessonClick(Sender: TObject);
begin
  TAddLessonForm.Create(self, FDQuery1.FieldByName('ID').AsInteger);
  LessonController.GetLessons(FDQuery1, MainForm.ID);
end;


procedure TLessonsForm.btnDelLessonClick(Sender: TObject);
begin
  case MessageDlg('Czy na pewno chcesz usun¹æ te zajêcia?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      LessonController.DeleteLesson(FDQuery1, FDQuery1.FieldByName('ID').AsInteger);
      ShowMessage('Zajêcia usuniête');
    end;
  mrCancel:
    begin

    end;
end;

  LessonController.GetLessons(FDQuery1, MainForm.ID);
end;



procedure TLessonsForm.btnDelStudentClick(Sender: TObject);
begin
  case MessageDlg('Czy na pewno chcesz usun¹æ studenta z tych zajêæ?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      LessonController.DeleteFromLesson(FDQuery, FDQuery.FieldByName('ID').AsInteger, FDQuery1.FieldByName('ID').AsInteger);
      ShowMessage('Student usuniêty');
    end;
  mrCancel:
    begin

    end;
  end;


  LessonController.GetStudentsInLesson(FDQuery, FDQuery1.FieldByName('ID').AsInteger);
end;



procedure TLessonsForm.cbLessonsCellClick(Column: TColumn);
begin
  LessonController.GetLessons(FDQuery1, MainForm.ID);
  LessonController.GetStudentsInLesson(FDQuery, FDQuery1.FieldByName('ID').AsInteger);
end;

procedure TLessonsForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  LessonController.GetStudentsInLesson(FDQuery, FDQuery1.FieldByName('ID').AsInteger);
end;

procedure TLessonsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StudentController.Free;
  LessonController.Free;

  Action := caFree;
end;

procedure TLessonsForm.FormCreate(Sender: TObject);
begin
  StudentController := TStudentModel.Create();
  LessonController := TLessonModel.Create();

  FDQuery.Connection := DBEngineModule.conn;
  FDQuery1.Connection := DBEngineModule.conn;

  LessonController.GetLessons(FDQuery1, MainForm.ID);

end;

end.
