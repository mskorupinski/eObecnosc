object PresenceLogForm: TPresenceLogForm
  Left = 0
  Top = 0
  Caption = 'Podgl'#261'd obecno'#347'ci'
  ClientHeight = 636
  ClientWidth = 524
  Color = clBtnFace
  Constraints.MaxHeight = 675
  Constraints.MaxWidth = 540
  Constraints.MinHeight = 675
  Constraints.MinWidth = 540
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 19
    Caption = 'Zaj'#281'cia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 158
    Width = 72
    Height = 19
    Caption = 'Data zaj'#281#263
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 311
    Width = 49
    Height = 19
    Caption = 'Obecni'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 463
    Width = 69
    Height = 19
    Caption = 'Nieobecni'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 497
    Height = 120
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 183
    Width = 497
    Height = 120
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 336
    Width = 497
    Height = 120
    DataSource = DataSource3
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 8
    Top = 488
    Width = 497
    Height = 120
    DataSource = DataSource4
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDQuery1: TFDQuery
    Left = 120
    Top = 312
  end
  object FDQuery2: TFDQuery
    Left = 288
    Top = 312
  end
  object FDQuery3: TFDQuery
    Left = 184
    Top = 312
  end
  object FDQuery4: TFDQuery
    Left = 232
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 128
    Top = 456
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    OnDataChange = DataSource2DataChange
    Left = 192
    Top = 464
  end
  object DataSource3: TDataSource
    DataSet = FDQuery3
    Left = 256
    Top = 464
  end
  object DataSource4: TDataSource
    DataSet = FDQuery4
    Left = 328
    Top = 464
  end
end
