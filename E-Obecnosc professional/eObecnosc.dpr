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
  CheckPresenceFormUnit in 'CheckPresenceFormUnit.pas' {CheckPresenceForm},
  LessonFormUnit in 'LessonFormUnit.pas' {LessonsForm},
  AddLessonUnit in 'AddLessonUnit.pas' {AddLessonForm},
  LessonModel in 'Modules\LessonModel.pas',
  AddStudentToLessonUnit in 'AddStudentToLessonUnit.pas' {AddStudentToLessonForm},
  PresenceModel in 'Modules\PresenceModel.pas',
  PresenceLogUnit in 'PresenceLogUnit.pas' {PresenceLogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBEngineModule, DBEngineModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.Run;
end.
