unit DBEngineModules;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.Forms,
  Exceptions, MySQLConectionSettings, Vcl.Dialogs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;


type
  TDBEngineModule = class(TDataModule)
    FDTransaction: TFDTransaction;
    conn: TFDConnection;
    driver: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    SettingsController: TMySQLConectionSettings;
  public

  end;


var
  DBEngineModule: TDBEngineModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDBEngineModule.DataModuleCreate(Sender: TObject);
begin
try
  try


    self.SettingsController := TMySQLConectionSettings.Create(Application.ExeName);
    driver.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
    conn.Params.DriverID := 'MySQL';
    conn.Params.Add('Server=' + self.SettingsController.GetDBHost);
    conn.Params.Add('Database=' + self.SettingsController.GetDBName);
    conn.Params.Add('User_Name=' + self.SettingsController.GetDBUser);
    conn.Params.Add('Password=' + self.SettingsController.GetDBPassword);
    conn.Params.Add('Port=' + IntToStr(self.SettingsController.GetDBPort) );
    conn.Params.Add('UseSSL=' +self.SettingsController.GetDBUseSSL );
    conn.LoginPrompt := False;

    conn.Connected := True;
  except
    on E: ESettingsError do  TaskMessageDlg('B³¹d', E.Message, mtError, mbOKCancel, 0);
  end;
finally
   self.SettingsController.Free;
end;


end;


end.
