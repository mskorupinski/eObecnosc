unit AddStudentToLessonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls,
  LessonModel, StudentModel, Vcl.Grids, Vcl.DBGrids;

type
  TAddStudentToLessonForm = class(TForm)
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    Label1: TLabel;
    btnAdd: TButton;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    cbType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSearchChange(Sender: TObject);
  private
    LessonID: Integer;
    StudentController: TStudentModel;
    LessonController: TLessonModel;
  public
    constructor Create(AOwner: TComponent; ID: Integer);overload;
  end;

var
  AddStudentToLessonForm: TAddStudentToLessonForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;

procedure TAddStudentToLessonForm.btnAddClick(Sender: TObject);
begin
  LessonController.AddToLesson(FDQuery, FDQuery.FieldByName('ID').AsInteger, self.LessonID);
  Close;
end;

constructor TAddStudentToLessonForm.Create(AOwner: TComponent; ID: Integer);
begin
  inherited Create(AOwner);
  LessonID := ID;
end;

procedure TAddStudentToLessonForm.edtSearchChange(Sender: TObject);
begin
  StudentController.Search(FDQuery, cbType.Items[cbType.ItemIndex], edtSearch.Text);
end;

procedure TAddStudentToLessonForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FDQuery.Free;
  StudentController.Free;
  LessonController.Free;

  Action := caFree;
end;

procedure TAddStudentToLessonForm.FormCreate(Sender: TObject);
begin
  LessonController := TLessonModel.Create;
  StudentController := TStudentModel.Create;

  FDQuery.Connection := DBEngineModule.conn;

  StudentController.Search(FDQuery, '', '');
end;

end.
