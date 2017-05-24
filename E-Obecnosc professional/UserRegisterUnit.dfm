object UserRegisterForm: TUserRegisterForm
  Left = 0
  Top = 0
  Caption = 'Rejestracja nowego u'#380'ytkownika'
  ClientHeight = 491
  ClientWidth = 369
  Color = clBtnFace
  Constraints.MaxHeight = 530
  Constraints.MaxWidth = 385
  Constraints.MinHeight = 530
  Constraints.MinWidth = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gb: TGroupBox
    Left = 8
    Top = 8
    Width = 365
    Height = 425
    Caption = 'Dane u'#380'ytkownika'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblLogin: TLabel
      Left = 16
      Top = 40
      Width = 35
      Height = 16
      Caption = 'Login:'
    end
    object lblPassword: TLabel
      Left = 16
      Top = 83
      Width = 32
      Height = 16
      Caption = 'Has'#322'o'
    end
    object lblPasswordConfirm: TLabel
      Left = 16
      Top = 115
      Width = 86
      Height = 16
      Caption = 'Powt'#243'rz has'#322'o:'
    end
    object lblName: TLabel
      Left = 16
      Top = 192
      Width = 30
      Height = 16
      Caption = 'Imi'#281':'
    end
    object lblSurname: TLabel
      Left = 16
      Top = 232
      Width = 58
      Height = 16
      Caption = 'Nazwisko:'
    end
    object lblEmail: TLabel
      Left = 16
      Top = 272
      Width = 73
      Height = 16
      Caption = 'Adres email:'
    end
    object edtPasswd: TMaskEdit
      Left = 57
      Top = 82
      Width = 196
      Height = 24
      PasswordChar = '*'
      TabOrder = 0
      Text = ''
    end
    object edtRepeatPasswd: TMaskEdit
      Left = 108
      Top = 112
      Width = 196
      Height = 24
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
      OnExit = edtRepeatPasswdExit
    end
    object edtName: TEdit
      Left = 57
      Top = 189
      Width = 193
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtSurname: TEdit
      Left = 80
      Top = 229
      Width = 193
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 95
      Top = 269
      Width = 216
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object btnRegister: TButton
      Left = 16
      Top = 352
      Width = 329
      Height = 49
      Caption = 'Rejestruj'
      TabOrder = 5
      OnClick = btnRegisterClick
    end
  end
  object edtLogin: TEdit
    Left = 65
    Top = 45
    Width = 193
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = edtLoginExit
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 463
    Width = 369
    Height = 28
    Panels = <
      item
        Text = 'Oczekuj'#281' na dane'
        Width = 50
      end>
    SimpleText = 'Oczekuj'#281' na dane'
  end
end
