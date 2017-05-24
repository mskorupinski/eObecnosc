unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, IdUDPServer, IdGlobal,
  IdSocketHandle, IdBaseComponent, IdComponent, IdUDPBase, CheckPresenceFormUnit;

const
  WM_SHOWMYOTHERFORM = WM_USER + 0;

type
  TMainForm = class(TForm)
    MainTopMenu: TMainMenu;
    Plik: TMenuItem;
    ShowMainMenu: TMenuItem;
    Logout: TMenuItem;
    Exit: TMenuItem;
    procedure FormShow(Sender: TObject);
  private

  protected
    procedure WMShowLoginForm(var Message: TMessage); message WM_SHOWMYOTHERFORM;
  public
    ID: Integer;
  end;

var
  MainForm: TMainForm;

implementation

uses LoginUnit;

{$R *.dfm}

procedure TMainForm.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_SHOWMYOTHERFORM, 0, 0);
end;


procedure TMainForm.WMShowLoginForm(var Message: TMessage);
begin
  inherited;
  with TLoginForm.Create(nil) do begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;

end;

end.
