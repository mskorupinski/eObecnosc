object StudentsForm: TStudentsForm
  Left = 0
  Top = 0
  Caption = 'Studenci'
  ClientHeight = 451
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MaxHeight = 490
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 490
  Constraints.MinWidth = 640
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
  object gb1: TGroupBox
    Left = 16
    Top = 88
    Width = 600
    Height = 365
    Caption = 'Studenci'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblSearch: TLabel
      Left = 16
      Top = 32
      Width = 62
      Height = 18
      Caption = 'Szukaj w:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbType: TComboBox
      Left = 84
      Top = 31
      Width = 145
      Height = 24
      ItemIndex = 0
      TabOrder = 0
      Text = 'Imie'
      Items.Strings = (
        'Imie'
        'Nazwisko'
        'Indeks')
    end
    object edtSearch: TEdit
      Left = 256
      Top = 31
      Width = 329
      Height = 24
      TabOrder = 1
      OnChange = edtSearchChange
    end
    object DBGrid: TDBGrid
      Left = 16
      Top = 72
      Width = 569
      Height = 281
      DataSource = DataSource
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
    end
  end
  object btnAdd: TButton
    Left = 32
    Top = 16
    Width = 161
    Height = 49
    Caption = 'Dodaj studenta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnChange: TButton
    Left = 232
    Top = 16
    Width = 161
    Height = 49
    Caption = 'Edytuj studenta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnChangeClick
  end
  object btnDelete: TButton
    Left = 440
    Top = 16
    Width = 161
    Height = 49
    Caption = 'Usu'#324
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object FDQuery: TFDQuery
    Left = 448
    Top = 72
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 520
    Top = 72
  end
  object FDQuery1: TFDQuery
    Left = 392
    Top = 72
  end
end
