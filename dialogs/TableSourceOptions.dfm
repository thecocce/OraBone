object TableSourceOptionsDialog: TTableSourceOptionsDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 169
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 132
    Width = 214
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 52
      Top = 6
      Width = 75
      Height = 25
      Action = OKAction
      Align = alRight
      Default = True
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 133
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 127
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    TabOrder = 1
    object CreateTableCheckBox: TCheckBox
      Left = 14
      Top = 14
      Width = 84
      Height = 17
      Caption = 'Create Table'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CommentsCheckBox: TCheckBox
      Left = 14
      Top = 37
      Width = 73
      Height = 17
      Caption = 'Comments'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object IndexesCheckBox: TCheckBox
      Left = 14
      Top = 60
      Width = 64
      Height = 17
      Caption = 'Indexes'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object ConstraintsCheckBox: TCheckBox
      Left = 14
      Top = 83
      Width = 80
      Height = 17
      Caption = 'Constraints'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object TriggersCheckBox: TCheckBox
      Left = 14
      Top = 106
      Width = 64
      Height = 17
      Caption = 'Triggers'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object ParametersCheckBox: TCheckBox
      Left = 128
      Top = 106
      Width = 77
      Height = 17
      Caption = 'Parameters'
      TabOrder = 5
    end
    object StorageCheckBox: TCheckBox
      Left = 128
      Top = 83
      Width = 64
      Height = 17
      Caption = 'Storage'
      TabOrder = 6
    end
    object GrantsCheckBox: TCheckBox
      Left = 128
      Top = 60
      Width = 64
      Height = 17
      Caption = 'Grants'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object SynonymsCheckBox: TCheckBox
      Left = 128
      Top = 37
      Width = 74
      Height = 17
      Caption = 'Synonyms'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
  end
  object ActionList: TActionList
    Left = 96
    Top = 16
    object OKAction: TAction
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
  end
end
