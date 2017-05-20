program eObecnosc;

uses
  Vcl.Forms,
  MainMenuUnit in 'MainMenuUnit.pas' {MainMenu},
  DBEngineModules in 'DBEngineModules.pas' {DBEngineModule: TDataModule},
  MySQLConectionSettings in 'Modules\MySQLConectionSettings.pas',
  Exceptions in 'Modules\Exceptions.pas',
  MainUnit in 'MainUnit.pas' {MainForm},
  LoginUnit in 'LoginUnit.pas' {LoginForm},
  UserRegisterUnit in 'UserRegisterUnit.pas' {UserRegisterForm},
  UserModel in 'Modules\UserModel.pas',
  ViewFormUnit in 'ViewFormUnit.pas' {ViewForm},
  StudentsFormUnit in 'StudentsFormUnit.pas' {StudentsForm},
  StudentModel in 'Modules\StudentModel.pas',
  AddStudentFormUnit in 'AddStudentFormUnit.pas' {AddStudentForm},
  PresenceFormUnit in 'PresenceFormUnit.pas' {PresenceForm},
  CheckPresenceFormUnit in 'CheckPresenceFormUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBEngineModule, DBEngineModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.CreateForm(TPresenceForm, PresenceForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
