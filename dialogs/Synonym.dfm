object SynonymDialog: TSynonymDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Create Synonym For %s.%s'
  ClientHeight = 132
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  DesignSize = (
    280
    132)
  PixelsPerInch = 96
  TextHeight = 13
  object OwnerLabel: TLabel
    Left = 12
    Top = 43
    Width = 32
    Height = 13
    Caption = 'Owner'
  end
  object NameLabel: TLabel
    Left = 12
    Top = 70
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object OKButton: TButton
    Left = 116
    Top = 99
    Width = 75
    Height = 25
    Action = OKAction
    Anchors = [akRight, akBottom]
    Default = True
    TabOrder = 4
  end
  object CancelButton: TButton
    Left = 197
    Top = 99
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object PrivateRadioButton: TRadioButton
    Left = 67
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Private'
    TabOrder = 1
  end
  object PublicRadioButton: TRadioButton
    Left = 12
    Top = 8
    Width = 53
    Height = 17
    Caption = 'Public'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object OwnerComboBox: TBCComboBox
    Left = 67
    Top = 40
    Width = 202
    Height = 21
    ItemHeight = 13
    ReadOnly = False
    TabOrder = 2
    EditColor = clInfoBk
    DeniedKeyStrokes = True
  end
  object NameEdit: TBCEdit
    Left = 67
    Top = 67
    Width = 202
    Height = 21
    TabOrder = 3
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    EditColor = clInfoBk
    NumbersAllowNegative = False
  end
  object ActionList: TActionList
    Left = 28
    Top = 88
    object OKAction: TAction
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
  end
end
