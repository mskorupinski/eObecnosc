object AddStudentToLessonForm: TAddStudentToLessonForm
  Left = 0
  Top = 0
  ClientHeight = 281
  ClientWidth = 694
  Color = clBtnFace
  Constraints.MaxHeight = 320
  Constraints.MaxWidth = 710
  Constraints.MinHeight = 320
  Constraints.MinWidth = 710
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 27
    Width = 49
    Height = 16
    Caption = 'Student:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAdd: TButton
    Left = 240
    Top = 232
    Width = 147
    Height = 41
    Caption = 'Dodaj'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnAddClick
  end
  object edtSearch: TEdit
    Left = 340
    Top = 24
    Width = 346
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = edtSearchChange
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 73
    Width = 678
    Height = 153
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cbType: TComboBox
    Left = 63
    Top = 24
    Width = 234
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'Imie'
    Items.Strings = (
      'Imie'
      'Nazwisko'
      'Indeks')
  end
  object FDQuery: TFDQuery
    Left = 440
    Top = 64
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 440
    Top = 8
  end
end
