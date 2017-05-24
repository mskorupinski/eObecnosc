object LessonsForm: TLessonsForm
  Left = 0
  Top = 0
  Caption = 'Zaj'#281'cia'
  ClientHeight = 436
  ClientWidth = 699
  Color = clBtnFace
  Constraints.MaxHeight = 475
  Constraints.MaxWidth = 715
  Constraints.MinHeight = 475
  Constraints.MinWidth = 715
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 201
    Width = 673
    Height = 225
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
    Top = 8
    Width = 409
    Height = 187
    Caption = 'Zaj'#281'cia'
    TabOrder = 1
    object btnAddLesson: TButton
      Left = 0
      Top = 133
      Width = 118
      Height = 40
      Caption = 'Dodaj nowe zaj'#281'cia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAddLessonClick
    end
    object btnDelLesson: TButton
      Left = 264
      Top = 133
      Width = 130
      Height = 40
      Caption = 'Usu'#324' wybrane zaj'#281'cia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnDelLessonClick
    end
    object btnChangeLesson: TButton
      Left = 124
      Top = 133
      Width = 118
      Height = 40
      Caption = 'Modyfikuj zaj'#281'cia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnChangeLessonClick
    end
    object cbLessons: TDBGrid
      Left = 16
      Top = 24
      Width = 378
      Height = 81
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = cbLessonsCellClick
    end
  end
  object btnAddStudent: TButton
    Left = 480
    Top = 25
    Width = 177
    Height = 49
    Caption = 'Dodaj studenta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAddStudentClick
  end
  object btnDelStudent: TButton
    Left = 480
    Top = 105
    Width = 177
    Height = 49
    Caption = 'Usu'#324' Studenta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnDelStudentClick
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 648
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 432
    Top = 24
  end
  object FDQuery: TFDQuery
    Left = 656
    Top = 48
  end
  object FDQuery1: TFDQuery
    Left = 424
    Top = 88
  end
end
