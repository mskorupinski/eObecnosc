object PresenceForm: TPresenceForm
  Left = 0
  Top = 0
  Caption = 'PresenceForm'
  ClientHeight = 436
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MaxHeight = 475
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 475
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblIndeks: TLabel
    Left = 16
    Top = 24
    Width = 64
    Height = 19
    Caption = 'lblIndeks'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblImie: TLabel
    Left = 240
    Top = 24
    Width = 46
    Height = 19
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNazwisko: TLabel
    Left = 432
    Top = 24
    Width = 46
    Height = 19
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPrzedmiot: TLabel
    Left = 8
    Top = 67
    Width = 62
    Height = 16
    Caption = 'Przedmiot:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 152
    Top = 191
    Width = 21
    Height = 19
    Caption = 'By'#322
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 560
    Top = 191
    Width = 49
    Height = 19
    Caption = 'Nie by'#322
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 216
    Width = 353
    Height = 201
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DBGrid2: TDBGrid
    Left = 423
    Top = 216
    Width = 353
    Height = 201
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
  end
  object DBGrid3: TDBGrid
    Left = 76
    Top = 67
    Width = 341
    Height = 86
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDQuery: TFDQuery
    Left = 512
    Top = 64
  end
  object FDQuery1: TFDQuery
    Left = 688
    Top = 24
  end
  object FDQuery2: TFDQuery
    Left = 728
    Top = 88
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    OnDataChange = DataSourceDataChange
    Left = 680
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 584
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 632
    Top = 40
  end
end
