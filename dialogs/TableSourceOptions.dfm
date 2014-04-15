object TableSourceOptionsDialog: TTableSourceOptionsDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 169
  ClientWidth = 214
  Color = clWindow
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
    object CreateTableCheckBox: TBCCheckBox
      Left = 14
      Top = 14
      Width = 81
      Height = 15
      Caption = 'Create Table'
      Checked = True
      State = cbChecked
      TabOrder = 0
      AutoSize = True
      ReadOnly = False
    end
    object CommentsCheckBox: TBCCheckBox
      Left = 14
      Top = 37
      Width = 69
      Height = 15
      Caption = 'Comments'
      Checked = True
      State = cbChecked
      TabOrder = 1
      AutoSize = True
      ReadOnly = False
    end
    object IndexesCheckBox: TBCCheckBox
      Left = 14
      Top = 60
      Width = 58
      Height = 15
      Caption = 'Indexes'
      Checked = True
      State = cbChecked
      TabOrder = 2
      AutoSize = True
      ReadOnly = False
    end
    object ConstraintsCheckBox: TBCCheckBox
      Left = 14
      Top = 83
      Width = 74
      Height = 15
      Caption = 'Constraints'
      Checked = True
      State = cbChecked
      TabOrder = 3
      AutoSize = True
      ReadOnly = False
    end
    object TriggersCheckBox: TBCCheckBox
      Left = 14
      Top = 106
      Width = 58
      Height = 15
      Caption = 'Triggers'
      Checked = True
      State = cbChecked
      TabOrder = 4
      AutoSize = True
      ReadOnly = False
    end
    object ParametersCheckBox: TBCCheckBox
      Left = 128
      Top = 106
      Width = 74
      Height = 15
      Caption = 'Parameters'
      TabOrder = 5
      AutoSize = True
      ReadOnly = False
    end
    object StorageCheckBox: TBCCheckBox
      Left = 128
      Top = 83
      Width = 57
      Height = 15
      Caption = 'Storage'
      TabOrder = 6
      AutoSize = True
      ReadOnly = False
    end
    object GrantsCheckBox: TBCCheckBox
      Left = 128
      Top = 60
      Width = 51
      Height = 15
      Caption = 'Grants'
      Checked = True
      State = cbChecked
      TabOrder = 7
      AutoSize = True
      ReadOnly = False
    end
    object SynonymsCheckBox: TBCCheckBox
      Left = 128
      Top = 37
      Width = 68
      Height = 15
      Caption = 'Synonyms'
      Checked = True
      State = cbChecked
      TabOrder = 8
      AutoSize = True
      ReadOnly = False
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
