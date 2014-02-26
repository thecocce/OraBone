object CustomizeObjectFiltersDialog: TCustomizeObjectFiltersDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Customize %s Filters'
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
  ShowHint = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object NameLabel: TLabel
      Left = 6
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object RemoveSpeedButton: TJvSpeedButton
      Left = 321
      Top = 6
      Width = 21
      Height = 21
      Action = RemoveAction
      Align = alRight
      DoubleBuffered = False
      Flat = True
      Glyph.Data = {
        D2020000424DD202000000000000D20100002800000010000000100000000100
        08000000000000010000120B0000120B0000670000006700000000000000FFFF
        FF00FF00FF00A467690096655E0092635D009E6B620099685F00A9756600811E
        0000581400009F6F6000B67F6A00C1896F00BC846C0088604C00CF8E6800D498
        7500ACA69F00F6E3C900FAEBD700ABA39900FBF0E200ACA9A500EEC78F00EDC6
        8F00EEC99300EECB9800F0CF9E00F3D8B000F2D8B100F3DAB500F4DEBD00F6E1
        C200F7E2C400F6E2C400F7E3C600F6E2C500F7E5CA00F7E5CB00F7E6CE00F7E7
        CF00F8EBD800FAEEDD00FCF3E600ABA59C00FCF4E900ACA7A000EDC68B00EDCA
        9200EECB9600EFCE9A00EFCF9D00EFD09F00EFD0A100F0D3A400F0D3A600F2D5
        A900F2D7AB00F0D5AA00F3D9B000F2D8AF00F2D8B000F4DCB600F3DCB600F4DD
        BA00F4DEBC00F6E1C000F6E2C200F7E5C900F7E6CA00F7E6CB00F8E9D100FBF0
        DE00FAEFDD00FAEFDE00FAF2E500FBF4E900F3DCB500F3DEBB00F4E0BD00F4E1
        C000F7E9D100F8EBD400F8EBD500FAEED900F8EDD900FBF2E200FCF7EE00F8ED
        D800F8EEDA00FAF2E300FBF4E700FCF7ED00ACA9A300FCF8F000004B0000315E
        FF001B47FF00052BFF000018F300000CC4000000820002020503030303030303
        0303030303020202044F1F3D39373533323119300B020202075160401D090909
        090909180B020202064521423F1E3A3836341B1A0B0202666666666666666666
        666666666666026608546646226666666666661C0B6602666666666666666666
        66666666666602020C572B2A52472443414E3E3B0B0202020E4D604B59090909
        0909093C0B0202020D582E4C495553281344503F0B0202020F175E122D155A53
        292623200B02666666666666660A0909090909250B02666162636465662F2C16
        4A1448270B02666666666666665F5D5C5B4A56480B0202021110101010101010
        10101010100202020202020202020202020202020202}
      GrayedInactive = False
      MarkDropDown = False
      Spacing = 0
    end
    object NameComboBox: TBCComboBox
      Left = 55
      Top = 6
      Width = 263
      Height = 21
      Align = alRight
      TabOrder = 0
      OnChange = NameComboBoxChange
      DeniedKeyStrokes = False
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object Separator3Panel: TPanel
      Left = 318
      Top = 6
      Width = 3
      Height = 21
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
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
    TabOrder = 1
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
  object ClientPanel: TPanel
    Left = 0
    Top = 33
    Width = 348
    Height = 323
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Right = 6
    TabOrder = 2
    object ObjectsCheckListBox: TCheckListBox
      Left = 6
      Top = 0
      Width = 336
      Height = 323
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object SQLStringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'ObjectsSQL'
        Strings.Strings = (
          'SELECT DISTINCT %s object_name, '#39'F'#39' checked'
          '     FROM %s'
          '    WHERE %s NOT IN (%s) AND (%d <> 0)'
          '                 %s'
          'UNION ALL'
          '   SELECT DISTINCT %s, '#39'T'#39' checked'
          '     FROM %s'
          '    WHERE %s IN (%s) OR (%d = 0)'
          '        %s'
          ' ORDER BY 1')
      end>
    Left = 56
    Top = 104
  end
  object ObjectsQuery: TOraQuery
    Left = 120
    Top = 152
  end
  object ActionList: TActionList
    Left = 124
    Top = 84
    object DeselectAllAction: TAction
      Caption = '&Deselect All'
      Hint = 'Deselect all'
      OnExecute = DeselectAllActionExecute
    end
    object SelectAllAction: TAction
      Caption = '&Select All'
      Hint = 'Select all'
      OnExecute = SelectAllActionExecute
    end
    object RemoveAction: TAction
      Hint = 'Remove filter'
      OnExecute = RemoveActionExecute
    end
    object OKAction: TAction
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
  end
end
