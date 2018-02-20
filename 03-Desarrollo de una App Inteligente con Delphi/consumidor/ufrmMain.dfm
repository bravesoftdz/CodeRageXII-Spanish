object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Consumidor'
  ClientHeight = 141
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblEtiquetas1: TLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Etiquetas1'
  end
  object lblEtiquetas2: TLabel
    Left = 16
    Top = 44
    Width = 51
    Height = 13
    Caption = 'Etiquetas2'
  end
  object lblEtiquetas3: TLabel
    Left = 16
    Top = 72
    Width = 51
    Height = 13
    Caption = 'Etiquetas3'
  end
  object numEtiquetas1: TSpinEdit
    Left = 80
    Top = 13
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object numEtiquetas2: TSpinEdit
    Left = 80
    Top = 41
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object numEtiquetas3: TSpinEdit
    Left = 80
    Top = 69
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object btnPredecir: TButton
    Left = 126
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Predecir'
    TabOrder = 3
    OnClick = btnPredecirClick
  end
end
