unit StudentsFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  StudentModel;

type
  TStudentsForm = class(TForm)
    gb1: TGroupBox;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    lblSearch: TLabel;
    cbType: TComboBox;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    StudentController: TStudentModel;
  public
    { Public declarations }
  end;

var
  StudentsForm: TStudentsForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules, AddStudentFormUnit, PresenceFormUnit;

procedure TStudentsForm.btnAddClick(Sender: TObject);
begin
  TAddStudentForm.Create(MainForm);
end;

procedure TStudentsForm.btnChangeClick(Sender: TObject);
begin
   TAddStudentForm.Create(MainForm, FDQuery.FieldByName('ID').AsInteger);
end;

procedure TStudentsForm.btnDeleteClick(Sender: TObject);
begin
  StudentController.DeleteStudent(FDQuery1, FDQuery.FieldByName('ID').AsInteger);
  StudentController.Search(FDQuery, '', '');

  ShowMessage('Usuniêto studenta!');
end;


procedure TStudentsForm.DBGridDblClick(Sender: TObject);
begin
  TPresenceForm.Create(self, FDQuery.FieldByName('ID').AsInteger);

end;


procedure TStudentsForm.edtSearchChange(Sender: TObject);
begin
  StudentController.Search(FDQuery, cbType.Items[cbType.ItemIndex], edtSearch.Text);
end;

procedure TStudentsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQuery.Free;
  FDQuery1.Free;
  StudentController.Free;

  Action := caFree;
end;

procedure TStudentsForm.FormCreate(Sender: TObject);
begin
  StudentController := TStudentModel.Create();
  FDQuery.Connection := DBEngineModule.conn;
  FDQuery1.Connection := DBEngineModule.conn;

  StudentController.Search(FDQuery, '', '');
end;

end.
