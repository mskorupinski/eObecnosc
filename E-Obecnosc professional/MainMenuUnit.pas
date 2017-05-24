unit MainMenuUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.CategoryButtons;

type
  TMainMenu = class(TForm)
    SplitView: TSplitView;
    CategoryButtons1: TCategoryButtons;
    imlIcons: TImageList;
    ActionList: TActionList;
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items4Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items2Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items3Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMenu: TMainMenu;

implementation

{$R *.dfm}

uses ViewFormUnit, StudentsFormUnit, LessonFormUnit, CheckPresenceFormUnit, PresenceLogUnit;


procedure TMainMenu.CategoryButtons1Categories0Items0Click(Sender: TObject);
begin
  TViewForm.Create(self);
end;

procedure TMainMenu.CategoryButtons1Categories0Items1Click(Sender: TObject);
begin
  TStudentsForm.Create(self);
end;

procedure TMainMenu.CategoryButtons1Categories0Items2Click(Sender: TObject);
begin
   TCheckPresenceForm.Create(self);
end;

procedure TMainMenu.CategoryButtons1Categories0Items3Click(Sender: TObject);
begin
   TPresenceLogForm.Create(self);
end;

procedure TMainMenu.CategoryButtons1Categories0Items4Click(Sender: TObject);
begin
  TLessonsForm.Create(self);
end;



procedure TMainMenu.CategoryButtons1Categories0Items5Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
