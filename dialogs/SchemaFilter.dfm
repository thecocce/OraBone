object SchemaFilterDialog: TSchemaFilterDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Schema Filter'
  ClientHeight = 393
  ClientWidth = 348
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 356
    Width = 348
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object DeselectAllButton: TButton
      Left = 6
      Top = 6
      Width = 75
      Height = 25
      Action = DeselectAllAction
      Align = alLeft
      TabOrder = 2
    end
    object SelectAllButton: TButton
      Left = 87
      Top = 6
      Width = 75
      Height = 25
      Action = SelectAllAction
      Align = alLeft
      TabOrder = 3
    end
    object OKButton: TButton
      Left = 186
      Top = 6
      Width = 75
      Height = 25
      Action = OKAction
      Align = alRight
      Default = True
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 267
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 261
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
    end
    object Separator2Panel: TPanel
      Left = 81
      Top = 6
      Width = 6
      Height = 25
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 356
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    object SchemaFilterCheckListBox: TCheckListBox
      Left = 6
      Top = 6
      Width = 336
      Height = 350
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object SchemasQuery: TOraQuery
    Left = 120
    Top = 152
  end
  object ActionList: TActionList
    Left = 124
    Top = 84
    object DeselectAllAction: TAction
      Caption = '&Deselect All'
      OnExecute = DeselectAllActionExecute
    end
    object SelectAllAction: TAction
      Caption = '&Select All'
      OnExecute = SelectAllActionExecute
    end
    object OKAction: TAction
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
  end
  object SQLStringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'SchemasSQL'
        Strings.Strings = (
          'SELECT username, '#39'F'#39' checked'
          '     FROM all_users'
          '    WHERE username NOT IN (%s) AND (%d <> 0)'
          'UNION ALL'
          '   SELECT username, '#39'T'#39' checked'
          '     FROM all_users'
          '    WHERE username IN (%s) OR (%d = 0)'
          ' ORDER BY 1')
      end>
    Left = 56
    Top = 104
  end
end
