unit AddStudentFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StudentModel, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TAddStudentForm = class(TForm)
    Label1: TLabel;
    edtIndeks: TEdit;
    Label2: TLabel;
    edtImie: TEdit;
    Label3: TLabel;
    edtNazwisko: TEdit;
    btnAdd: TButton;
    FDQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure edtIndeksExit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ID: Integer;
    StudentController: TStudentModel;
  public
    constructor Create(AOwner: TComponent); overload;
    constructor Create(AOwner: TComponent; ID: Integer);overload;
  end;

var
  AddStudentForm: TAddStudentForm;

implementation

{$R *.dfm}

uses MainUnit, DBEngineModules;

procedure TAddStudentForm.btnAddClick(Sender: TObject);
var
  Student: TStudent;
begin
  Student := TStudent.Create;
    Student.ID := self.ID;
    Student.Indeks := edtIndeks.Text;
    Student.Imie := edtImie.Text;
    Student.Nazwisko := edtNazwisko.Text;


  if self.ID <> -1 then
  begin
    StudentController.ChangeStudentData(FDQuery, Student);
    Close;
  end else
  begin
    if StudentController.IsExist(FDQuery, edtIndeks.Text) then
    begin
      ShowMessage('Dany student ju¿ istnieje');
      exit;
    end;

    StudentController.AddStudent(FDQuery, Student);
    Close;

  end;
end;


constructor TAddStudentForm.Create(AOwner: TComponent);
begin
  inherited Create(AOWner);
  self.ID := -1;
end;

constructor TAddStudentForm.Create(AOwner: TComponent; ID: Integer);
begin
  inherited Create(AOwner);
  self.ID := ID;
end;


procedure TAddStudentForm.edtIndeksExit(Sender: TObject);
begin
  if StudentController.IsExist(FDQuery, edtIndeks.Text) then
    ShowMessage('Dany student ju¿ istnieje');
end;

procedure TAddStudentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQuery.Free;
  StudentController.Free;

  Action := caFree;
end;

procedure TAddStudentForm.FormCreate(Sender: TObject);
var
Student: TStudent;
begin
  StudentController := TStudentModel.Create;
  FDQuery.Connection := DBEngineModule.conn;

  if ID <> -1 then
  begin
    Student := StudentController.GetStudentData(FDQuery, self.ID);
    edtIndeks.Text := Student.Indeks;
    edtImie.Text := Student.Imie;
    edtNazwisko.Text := Student.Nazwisko;
  end;

end;

end.
