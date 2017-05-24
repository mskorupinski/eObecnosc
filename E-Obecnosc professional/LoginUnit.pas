unit LoginUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, UserModel;

type
  TLoginForm = class(TForm)
    edtLogin: TEdit;
    edtPasswd: TMaskEdit;
    lblLogin: TLabel;
    lblPasswd: TLabel;
    lblRegister: TLabel;
    btnRegister: TButton;
    gb: TGroupBox;
    btnLogin: TButton;
    btnExit: TButton;
    imgKey: TImage;
    procedure btnExitClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    UserController: TUserModel;
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses UserRegisterUnit, MainUnit;

procedure TLoginForm.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TLoginForm.btnLoginClick(Sender: TObject);
var
  ID: Integer;
begin
  ID := self.UserController.CheckLogin(edtLogin.Text, edtPasswd.Text);

  if ID > 0 then
  begin
    MainForm.ID := ID;
    close;
  end else TaskMessageDlg('B≥πd', 'B≥Ídny login lub has≥o. Wprowadü ponownie', mtError, mbOKCancel, 0);



end;

procedure TLoginForm.btnRegisterClick(Sender: TObject);
var
  RegisterForm : TUserRegisterForm;
begin
  RegisterForm := TUserRegisterForm.Create(self);
  try
    RegisterForm.ShowModal;
  finally
    RegisterForm.Free;
  end;

end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  self.UserController := TUserModel.Create;
end;

end.
