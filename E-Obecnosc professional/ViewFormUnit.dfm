object ViewForm: TViewForm
  Left = 0
  Top = 0
  Caption = 'G'#322#243'wny podgl'#261'd'
  ClientHeight = 331
  ClientWidth = 524
  Color = clBtnFace
  Constraints.MaxHeight = 370
  Constraints.MaxWidth = 540
  Constraints.MinHeight = 370
  Constraints.MinWidth = 540
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 16
    Top = 32
    Width = 114
    Height = 39
    Caption = 'lblName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object gb: TGroupBox
    Left = 16
    Top = 101
    Width = 481
    Height = 222
    Caption = 'Moje przedmioty'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 16
      Top = 24
      Width = 441
      Height = 177
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object FDQuery: TFDQuery
    Left = 392
    Top = 40
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 448
    Top = 40
  end
end
