object AddLessonForm: TAddLessonForm
  Left = 0
  Top = 0
  Caption = 'Dodaj / Modyfikuj zaj'#281'cia'
  ClientHeight = 286
  ClientWidth = 414
  Color = clBtnFace
  Constraints.MaxHeight = 325
  Constraints.MaxWidth = 430
  Constraints.MinHeight = 325
  Constraints.MinWidth = 430
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
    Left = 16
    Top = 16
    Width = 43
    Height = 16
    Caption = 'Nazwa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 54
    Width = 36
    Height = 16
    Caption = 'Dzie'#324':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 89
    Width = 50
    Height = 16
    Caption = 'Godzina:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 129
    Width = 69
    Height = 16
    Caption = 'Cykliczno'#347#263':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 168
    Width = 50
    Height = 16
    Caption = 'Wydzia'#322':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtName: TEdit
    Left = 65
    Top = 13
    Width = 304
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cbDay: TComboBox
    Left = 65
    Top = 51
    Width = 209
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'Poniedzia'#322'ek'
    Items.Strings = (
      'Poniedzia'#322'ek'
      'Wtorek'
      #346'roda'
      'Czwartek'
      'Pi'#261'tek'
      'Sobota'
      'Niedziela')
  end
  object edtTime: TEdit
    Left = 72
    Top = 86
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object cbFrq: TComboBox
    Left = 91
    Top = 126
    Width = 209
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'Co  tydzie'#324
    Items.Strings = (
      'Co  tydzie'#324
      'Co 2 tygodnie'
      'Co 4 tygodnie')
  end
  object btnSave: TButton
    Left = 8
    Top = 216
    Width = 169
    Height = 49
    Caption = 'Zapisz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 234
    Top = 216
    Width = 169
    Height = 49
    Caption = 'Zamknij'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnCloseClick
  end
  object edtDepartment: TEdit
    Left = 72
    Top = 165
    Width = 304
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object FDQuery: TFDQuery
    Left = 344
    Top = 72
  end
end
