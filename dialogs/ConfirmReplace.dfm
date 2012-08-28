object ConfirmReplaceDialog: TConfirmReplaceDialog
  Left = 176
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Confirm replace'
  ClientHeight = 118
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ConfirmationLabel: TLabel
    Left = 74
    Top = 20
    Width = 260
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AutoSize = False
    WordWrap = True
  end
  object Image: TImage
    Left = 20
    Top = 20
    Width = 39
    Height = 39
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  object YesButton: TButton
    Left = 10
    Top = 82
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Yes'
    Default = True
    ModalResult = 6
    TabOrder = 0
  end
  object NoButton: TButton
    Left = 93
    Top = 82
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&No'
    ModalResult = 7
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 176
    Top = 82
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object YesToAllButton: TButton
    Left = 259
    Top = 82
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Yes to &all'
    ModalResult = 10
    TabOrder = 3
  end
end
