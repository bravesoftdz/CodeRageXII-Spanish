object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Recopilador'
  ClientHeight = 148
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 93
    Height = 13
    Caption = 'Archivo de la forma'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 110
    Height = 13
    Caption = 'Archivo de estadisticas'
  end
  object txtForm: TEdit
    Left = 127
    Top = 32
    Width = 367
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object txtStats: TEdit
    Left = 124
    Top = 72
    Width = 370
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object btnForm: TButton
    Left = 500
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Form'
    TabOrder = 2
    OnClick = btnFormClick
  end
  object btnStats: TButton
    Left = 500
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Stats'
    TabOrder = 3
    OnClick = btnStatsClick
  end
  object btnAdd: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Agregar CSV'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object OpenDialog: TOpenDialog
    Left = 120
    Top = 104
  end
end
