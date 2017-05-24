object CheckPresenceForm: TCheckPresenceForm
  Left = 0
  Top = 0
  Caption = 'Sprawd'#378' obecno'#347#263
  ClientHeight = 596
  ClientWidth = 489
  Color = clBtnFace
  Constraints.MaxHeight = 635
  Constraints.MaxWidth = 505
  Constraints.MinHeight = 635
  Constraints.MinWidth = 505
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 8
    Top = 16
    Width = 465
    Height = 169
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 191
    Width = 465
    Height = 395
    Caption = 'Sprawdzanie obecno'#347'ci'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 168
      Height = 16
      Caption = 'Czas sprawdzania obecnosci:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 120
      Width = 30
      Height = 16
      Caption = 'Sala:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 168
      Width = 46
      Height = 16
      Caption = 'Zaj'#281'cia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnStart: TButton
      Left = 9
      Top = 343
      Width = 193
      Height = 41
      Caption = 'Rozpocznij Sprawdzanie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnStartClick
    end
    object ProgressBar: TProgressBar
      Left = 9
      Top = 32
      Width = 440
      Height = 25
      Max = 100000
      Smooth = True
      TabOrder = 1
    end
    object edtTime: TEdit
      Left = 190
      Top = 80
      Width = 65
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
      Text = '5'
    end
    object btnCancel: TButton
      Left = 256
      Top = 343
      Width = 193
      Height = 41
      Caption = 'Anuluj'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object edtSala: TEdit
      Left = 52
      Top = 120
      Width = 203
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBGrid1: TDBGrid
      Left = 68
      Top = 168
      Width = 320
      Height = 120
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object UDPClient: TIdUDPClient
    BroadcastEnabled = True
    Port = 0
    Left = 424
    Top = 368
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 400
    Top = 263
  end
  object FDQuery: TFDQuery
    Left = 288
    Top = 271
  end
  object FDQuery1: TFDQuery
    Left = 336
    Top = 287
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 416
    Top = 423
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 32
    Top = 407
  end
  object FDQuery2: TFDQuery
    Left = 408
    Top = 479
  end
  object IdUDPServer1: TIdUDPServer
    Active = True
    Bindings = <>
    DefaultPort = 9002
    OnUDPRead = IdUDPServer1UDPRead
    Left = 416
    Top = 327
  end
end
