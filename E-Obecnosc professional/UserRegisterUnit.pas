unit UserRegisterUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, System.StrUtils,
  UserModel;

type
  TUserRegisterForm = class(TForm)
    gb: TGroupBox;
    edtLogin: TEdit;
    lblLogin: TLabel;
    lblPassword: TLabel;
    edtPasswd: TMaskEdit;
    lblPasswordConfirm: TLabel;
    edtRepeatPasswd: TMaskEdit;
    edtName: TEdit;
    lblName: TLabel;
    lblSurname: TLabel;
    edtSurname: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    StatusBar: TStatusBar;
    btnRegister: TButton;
    procedure edtLoginExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRepeatPasswdExit(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    UserController: TUserModel;
  public
    { Public declarations }
  end;

var
  UserRegisterForm: TUserRegisterForm;

implementation

{$R *.dfm}

uses DBEngineModules, Exceptions;

procedure TUserRegisterForm.btnRegisterClick(Sender: TObject);
var
  Registered: Boolean;
begin
  if not self.UserController.CheckUserName(self.edtLogin.Text) then
  begin
    TaskMessageDlg('B³¹d', 'Login jest ju¿ zajêty. Spróbuj inny', mtError, mbOKCancel, 0);
    exit;
  end;

  if not (edtPasswd.Text = edtRepeatPasswd.Text) then
  begin
    TaskMessageDlg('B³¹d', 'Has³a s¹ niezgodne. WprowadŸ ponownie', mtError, mbOKCancel, 0);
    exit;
  end;

   try
    Registered := self.UserController.RegisterUser(edtLogin.Text, edtPasswd.Text,
    edtName.Text, edtSurname.Text, edtEmail.Text);

    if Registered then
    begin
       TaskMessageDlg('Komunikat', 'U¿ytkownik ' + edtLogin.Text + ' zarejestrowany pomyœlnie!', mtInformation, mbOKCancel, 0);
       close;
    end;

   except
    on E: Exception do  TaskMessageDlg('B³¹d', E.Message, mtError, mbOKCancel, 0);
   end;



end;

procedure TUserRegisterForm.edtLoginExit(Sender: TObject);
var
  IsAvailable : Boolean;
begin
  IsAvailable := self.UserController.CheckUserName(self.edtLogin.Text);

  if IsAvailable then
    self.StatusBar.Panels[0].Text := 'Login jest dostêpny'
    else
    self.StatusBar.Panels[0].Text := 'Login jest ju¿ zajêty. Spróbuj inny';

end;

procedure TUserRegisterForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.UserController.Free;
end;

procedure TUserRegisterForm.FormCreate(Sender: TObject);
begin
  self.UserController := TUserModel.Create();
end;

procedure TUserRegisterForm.edtRepeatPasswdExit(Sender: TObject);
begin
  if not (edtPasswd.Text = edtRepeatPasswd.Text) then
     self.StatusBar.Panels[0].Text := 'Has³a s¹ niezgodne. WprowadŸ ponownie';
end;

end.
