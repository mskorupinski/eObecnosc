object MainForm: TMainForm
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'eObecno'#347#263
  ClientHeight = 283
  ClientWidth = 534
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainTopMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainTopMenu: TMainMenu
    Left = 32
    Top = 16
    object Plik: TMenuItem
      Caption = 'Plik'
      object ShowMainMenu: TMenuItem
        Caption = 'Poka'#380' g'#322#243'wne menu'
      end
      object Logout: TMenuItem
        Caption = 'Wyloguj'
      end
      object Exit: TMenuItem
        Caption = 'Zako'#324'cz'
      end
    end
  end
end
